package tipi.service;

/**
 * @author Lauri Soivi, Joona Viertola, Samuel Kontiomaa
 * @version 1.0
 * @since 18.12.2013
 * Checks that the form is filled correctly before sending it onward to be saved to the database
 */

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
			sendValue.setEverythingOk(false);
		}
		if(orderForm.getCollectionTime().equals(null)) {
			sendValue.setEverythingOk(false);
		}
		if(orderForm.getDestinationDate().equals(null)) {
			sendValue.setEverythingOk(false);
		}
		if(orderForm.getDestinationTime().equals(null)) {
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
					sendValue.setEverythingOk(false);
				}
			
				if(orderForm.isHasNewDestination()) {

					Date nextDestinationCollectionDateTime = new SimpleDateFormat("dd.MM.yyyy HH:mm").parse(orderForm.getNextDestinationCollectionDate()+" "+orderForm.getNextDestinationCollectionTime());
					Date nextDestinationDateTime =new SimpleDateFormat("dd.MM.yyyy HH:mm").parse(orderForm.getNextDestinationDate()+" "+orderForm.getNextDestinationTime());

					if(orderForm.getStatusOfOrder() < 3) {
						if(!destinationDateTime.before(nextDestinationCollectionDateTime)) {
							sendValue.setDestinationBeforeNextCollection(false);
							sendValue.setEverythingOk(false);
						}
					}
				
					if(!nextDestinationCollectionDateTime.before(nextDestinationDateTime)) {
						sendValue.setNextCollectionBeforeNextDestination(false);
						sendValue.setEverythingOk(false);
					}
				}
			}
			catch(ParseException e) {
				sendValue.setEverythingOk(false);
				System.out.println(orderForm.getCollectionDate());
				System.out.println(orderForm.getDestinationDate());
			}
		}
		
		if(orderForm.isHasNewDestination()) {
			if(orderForm.getNextDestinationAddress().isEmpty()) {
				sendValue.setEverythingOk(false);
				sendValue.setNextDestinationAddressEmpty(true);
			} else if (orderForm.getNextDestinationAddress().length() > 30) {
				sendValue.setEverythingOk(false);
				sendValue.setNextDestinationAddressTooLong(true);
			}
			
			if(orderForm.getNextDestinationPostalCode().isEmpty()) {
				sendValue.setEverythingOk(false);
				sendValue.setNextDestinationPostalCodeEmpty(true);
			} else if (!orderForm.getNextDestinationPostalCode().matches("\\d{5}")) {
				sendValue.setEverythingOk(false);
				sendValue.setNextDestinationPostalCodeIsNotValid(true);
			}
			
			if(orderForm.getNextDestinationCity().isEmpty()) {
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
