package tipi.service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.stereotype.Service;

import tipi.bean.DateTimeCheck;
import tipi.bean.DateTimeCheckImpl;
import tipi.bean.OrderForm;

@Service
public class OrderFormValidationServiceImpl implements OrderFormValidationService {

	//Check that dates and times are in correct order. For example you can't return a car before it's collected
	public DateTimeCheck checkDateAndTimeCorrectness(OrderForm orderForm) {
		//nulls need to be checked first as they will return false immediately. Other type of errors should be collected in order for the user to fix them all at the same time.
		
		DateTimeCheck sendValue=new DateTimeCheckImpl();
		System.out.println("1 " + orderForm.isHasNewDestination());
		
		//Check if empty
		if(orderForm.getCollectionDate().equals(null)) {
			System.out.println("Noutopäivä on tyhjä");
			//already checked if empty. Only to ascertain if a compare is necessary.
			sendValue.setEverythingOk(false);
		}
		if(orderForm.getCollectionTime().equals(null)) {
			System.out.println("Noutoaika on tyhjä");
			//already checked if empty. Only to ascertain if a compare is necessary.
			sendValue.setEverythingOk(false);
		}
		if(orderForm.getDestinationDate().equals(null)) {
			System.out.println("Toimituspäivä on tyhjä");
			//already checked if empty. Only to ascertain if a compare is necessary.
			sendValue.setEverythingOk(false);
		}
		if(orderForm.getDestinationTime().equals(null)) {
			System.out.println("Toimitusaika on tyhjä");
			//already checked if empty. Only to ascertain if a compare is necessary.
			sendValue.setEverythingOk(false);
		}
		
		if(orderForm.isHasNewDestination()) {

			//Check for nulls and incorrect values.
			String ndcd=orderForm.getNextDestinationCollectionDate();
			String ndct=orderForm.getNextDestinationCollectionTime();
			String ndd=orderForm.getNextDestinationDate();
			String ndt=orderForm.getNextDestinationTime();
			
			if(!ndcd.equals(null)) {
				if(!ndcd.matches("\\d{2}[.]\\d{2}[.]\\d{4}")) {
					sendValue.setValueNullNextDestinationCollectionDate(true);
					sendValue.setEverythingOk(false);
				}
			}
			else {
				System.out.println("Palautuksen noutopäivä on tyhjä");
				sendValue.setValueNullNextDestinationCollectionDate(true);
				sendValue.setEverythingOk(false);
			}
			if(!ndct.equals(null)) {
				if(!ndct.matches("\\d{2}[:]\\d{2}")) {
					sendValue.setValueNullNextDestinationCollectionTime(true);
					sendValue.setEverythingOk(false);
				}
			}
			else {
				System.out.println("Palautuksen noutoaika on tyhjä");
				sendValue.setValueNullNextDestinationCollectionTime(true);
				sendValue.setEverythingOk(false);
			}
			if(!ndd.equals(null)) {
				if(!ndd.matches("\\d{2}[.]\\d{2}[.]\\d{4}")) {
					sendValue.setValueNullNextDestinationDate(true);
					sendValue.setEverythingOk(false);
				}
			}
			else {
				System.out.println("Palautuksen palautuspäivä on tyhjä");
				sendValue.setValueNullNextDestinationDate(true);
				sendValue.setEverythingOk(false);
			}
			if(!ndt.equals(null)) {
				if(!ndt.matches("\\d{2}[:]\\d{2}")) {
					sendValue.setValueNullNextDestinationTime(true);
					sendValue.setEverythingOk(false);
				}
				
			}
			else {
				System.out.println("Palautuksen palautusaika on tyhjä");
				sendValue.setValueNullNextDestinationTime(true);
				sendValue.setEverythingOk(false);
			}
		}
		
		//if sendValue.isEverythingOk() is false return immediately to inform that the above mentioned fields are not filled. If true, continue to actual testing of datetimes
		if(sendValue.isEverythingOk());
		{
		
			//turn Strings to Dates and compare them with each other
			try {
				Date collectionDateTime = new SimpleDateFormat("dd.MM.yyyy HH:mm").parse(orderForm.getCollectionDate()+" "+orderForm.getCollectionTime());
				Date destinationDateTime = new SimpleDateFormat("dd.MM.yyyy HH:mm").parse(orderForm.getDestinationDate()+" "+orderForm.getDestinationTime());
			
				if(!collectionDateTime.before(destinationDateTime)) {
					sendValue.setCollectionBeforeDestination(false);
					System.out.println("Toimitusajankohta on sama tai ennen noutoa!");
					sendValue.setEverythingOk(false);
				}
			
				if(orderForm.isHasNewDestination()) {

					Date nextDestinationCollectionDateTime = new SimpleDateFormat("dd.MM.yyyy HH:mm").parse(orderForm.getNextDestinationCollectionDate()+" "+orderForm.getNextDestinationCollectionTime());
					Date nextDestinationDateTime =new SimpleDateFormat("dd.MM.yyyy HH:mm").parse(orderForm.getNextDestinationDate()+" "+orderForm.getNextDestinationTime());

					if(orderForm.getStatusOfOrder() < 3) {
						if(!destinationDateTime.before(nextDestinationCollectionDateTime)) {
							sendValue.setDestinationBeforeNextCollection(false);
							System.out.println("Palautuksen nouto on ennen toimitusta!");
							sendValue.setEverythingOk(false);
						}
					}
				
					if(!nextDestinationCollectionDateTime.before(nextDestinationDateTime)) {
						sendValue.setNextCollectionBeforeNextDestination(false);
						System.out.println("Palautuksen palautus on ennen palautuksen noutoa!");
						sendValue.setEverythingOk(false);
					}
				
					System.out.println("CollectionDatetime: "+collectionDateTime+"\n DestinationDateTime: "+destinationDateTime+"\n nextDestinationCollectionDateTime: "+nextDestinationCollectionDateTime+"\n nextDestinationDateTime: "+nextDestinationDateTime);
				}
				else {
					System.out.println("CollectionDatetime: "+collectionDateTime+"\n DestinationDateTime: "+destinationDateTime);
				}
			}
			catch(ParseException e) {
				System.out.println("ParseException: "+e);
				System.out.println("try failed. Catch instead.");
				sendValue.setEverythingOk(false);
				System.out.println(orderForm.getCollectionDate());
				System.out.println(orderForm.getDestinationDate());
			}
		}
		
		if(orderForm.isHasNewDestination()) {
			System.out.println("Service: Has new destination");
			if(orderForm.getNextDestinationAddress().isEmpty()) {
				System.out.println("Address is null");
				sendValue.setEverythingOk(false);
				sendValue.setNextDestinationAddressEmpty(true);
			} else if (orderForm.getNextDestinationAddress().length() > 30) {
				System.out.println("Address is too long");
				sendValue.setEverythingOk(false);
				sendValue.setNextDestinationAddressTooLong(true);
			}
			
			if(orderForm.getNextDestinationPostalCode().isEmpty()) {
				System.out.println("Postal code is null");
				sendValue.setEverythingOk(false);
				sendValue.setNextDestinationPostalCodeEmpty(true);
			} else if (!orderForm.getNextDestinationPostalCode().matches("\\d{5}")) {
				System.out.println("Postal code doesn't match");
				sendValue.setEverythingOk(false);
				sendValue.setNextDestinationPostalCodeIsNotValid(true);
			}
			
			if(orderForm.getNextDestinationCity().isEmpty()) {
				System.out.println("City is null");
				sendValue.setEverythingOk(false);
				sendValue.setNextDestinationCityEmpty(true);
			} else if (orderForm.getNextDestinationCity().length() > 30) {
				System.out.println("City is too long");
				sendValue.setEverythingOk(false);
				sendValue.setNextDestinationCityTooLong(true);
			}
		}
		System.out.println("2 " + orderForm.isHasNewDestination());
		return sendValue;
	}
	
}
