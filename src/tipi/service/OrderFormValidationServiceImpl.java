package tipi.service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import tipi.bean.DateTimeCheck;
import tipi.bean.DateTimeCheckImpl;
import tipi.bean.OrderForm;

public class OrderFormValidationServiceImpl implements OrderFormValidationService {

	//Check that dates and times are in correct order. For example you can't return a car before it's collected
	public DateTimeCheck checkDateAndTimeCorrectness(OrderForm orderForm) {
		//nulls need to be checked first as they will return false immediately. Other type of errors should be collected in order for the user to fix them all at the same time.
		
		DateTimeCheck sendValue=new DateTimeCheckImpl(); //returnaa t�m�!!
		
		//Check if empty
		if(orderForm.getCollectionDate().equals(null)) {
			System.out.println("Noutop�iv� on tyhj�");
			//already checked if empty. Only to ascertain if a compare is necessary.
			sendValue.setEverythingOk(false);
		}
		if(orderForm.getCollectionTime().equals(null)) {
			System.out.println("Noutoaika on tyhj�");
			//already checked if empty. Only to ascertain if a compare is necessary.
			sendValue.setEverythingOk(false);
		}
		if(orderForm.getDestinationDate().equals(null)) {
			System.out.println("Toimitusp�iv� on tyhj�");
			//already checked if empty. Only to ascertain if a compare is necessary.
			sendValue.setEverythingOk(false);
		}
		if(orderForm.getDestinationTime().equals(null)) {
			System.out.println("Toimitusaika on tyhj�");
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
				System.out.println("Palautuksen noutop�iv� on tyhj�");
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
				System.out.println("Palautuksen noutoaika on tyhj�");
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
				System.out.println("Palautuksen palautusp�iv� on tyhj�");
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
				System.out.println("Palautuksen palautusaika on tyhj�");
				sendValue.setValueNullNextDestinationTime(true);
				sendValue.setEverythingOk(false);
			}
		}
		
		//if sendValue.isEverythingOk() is false return immediately to inform that the above mentioned fields are not filled. If true, continue to actual testing of datetimes
		if(sendValue.isEverythingOk());
		{
		
			//turn Strings to Dates and compare them with each other
			try {
				Date collectionDateTime = new SimpleDateFormat().parse(orderForm.getCollectionDate()+orderForm.getCollectionTime());
				Date destinationDateTime = new SimpleDateFormat().parse(orderForm.getDestinationDate()+orderForm.getDestinationTime());
			
				if(!collectionDateTime.before(destinationDateTime)) {
					sendValue.setCollectionBeforeDestination(false);
					System.out.println("Toimitusajankohta on sama tai ennen noutoa!");
					sendValue.setEverythingOk(false);
				}
			
				if(orderForm.isHasNewDestination()) {

					Date nextDestinationCollectionDateTime = new SimpleDateFormat().parse(orderForm.getNextDestinationCollectionDate()+orderForm.getNextDestinationCollectionTime());
					Date nextDestinationDateTime =new SimpleDateFormat().parse(orderForm.getNextDestinationDate()+orderForm.getNextDestinationTime());
				
					if(!destinationDateTime.before(nextDestinationCollectionDateTime)) {
						sendValue.setDestinationBeforeNextCollection(false);
						System.out.println("Palautuksen nouto on ennen toimitusta!");
						sendValue.setEverythingOk(false);
					}
				
					if(!nextDestinationCollectionDateTime.before(nextDestinationDateTime)) {
						sendValue.setNextCollectionBeforeNextDestination(false);
						System.out.println("Palautuksen palautus on ennen palautuksen noutoa!");
						sendValue.setEverythingOk(false);
					}
				
					System.out.println("CollectionDatetime: "+collectionDateTime+"\n DestinationDateTime: "+destinationDateTime+"\n nextDestinationCollectionDateTime: "+nextDestinationCollectionDateTime+"\n nextDestinationDateTime: "+nextDestinationDateTime);
				}
				else {
					System.out.println("CollectionDatetime: "+collectionDateTime+"\nDestinationDateTime: "+destinationDateTime);
				}
			}
			catch(ParseException e) {
				System.out.println("ParseException: "+e);
				System.out.println("try failed. Catch instead.");
				sendValue.setEverythingOk(false);
			}
		}
		
		if(orderForm.isHasNewDestination()) {
			if(orderForm.getNextDestinationAddress().equals(null)) {
				sendValue.setEverythingOk(false);
				sendValue.setNextDestinationAddressEmpty(true);
			} else if (orderForm.getNextDestinationAddress().length() > 30) {
				sendValue.setEverythingOk(false);
				sendValue.setNextDestinationAddressTooLong(true);
			}
			
			if(orderForm.getNextDestinationPostalCode().equals(null)) {
				sendValue.setEverythingOk(false);
				sendValue.setNextDestinationPostalCodeEmpty(true);
			} else if (orderForm.getNextDestinationPostalCode().matches("\\d{5}")) {
				sendValue.setEverythingOk(false);
				sendValue.setNextDestinationPostalCodeIsNotValid(true);
			}
			
			if(orderForm.getNextDestinationCity().equals(null)) {
				sendValue.setEverythingOk(false);
				sendValue.setNextDestinationCityEmpty(true);
			} else if (orderForm.getNextDestinationCity().length() > 30) {
				sendValue.setEverythingOk(false);
				sendValue.setNextDestinationCityTooLong(true);
			}
		}
		
		return sendValue;
	}
	
}
