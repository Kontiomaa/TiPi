package tipi.service;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import tipi.bean.DateTimeCheck;
import tipi.bean.DateTimeCheckImpl;
import tipi.bean.OrderForm;
import tipi.dao.OrdersDAO;

@Service
public class OrdersTimeCheckServiceImpl implements OrdersTimeCheckService {

	@Inject
	private OrdersDAO ordersDAO;
	
	public OrdersDAO getOrdersDAO() {
		return ordersDAO;
	}

	public void setOrderDAO(OrdersDAO ordersDAO) {
		this.ordersDAO = ordersDAO;
	}
	
	/**
	 * Compares given date to current time. DateString must be given in 'HH:mm:ss yyyy-MM-dd' -format.
	 * Boolean returns true if editing is still allowed. 
	 * @param dateString
	 * @param minuteLimit
	 * @return
	 */
	private boolean compare(String dateString, int minuteLimit) {
		DateFormat formatter = new SimpleDateFormat("HH:mm:ss yyyy-MM-dd");
		
		// Create Date from order's dateString
		Date collectionTimestamp = new Date();
		try {
			collectionTimestamp = formatter.parse(dateString);
		} catch(ParseException e) {
			e.printStackTrace();
			return false;
		}
		
		// Create Calendar from current time
		Calendar currentCal = Calendar.getInstance();
		currentCal.add(Calendar.MINUTE, minuteLimit);
		
		// Create time limit from orders data
		Calendar timeLimitCal = Calendar.getInstance();
		timeLimitCal.setTime(collectionTimestamp);
		
		// Compare
		boolean allowed = true;
		if (currentCal.after(timeLimitCal)) {
			allowed = false;
		}
		
		if (currentCal.equals(timeLimitCal)) {
			allowed = false;
		}
		
		if (currentCal.before(timeLimitCal)) {
			allowed = true;
		}
		
		return allowed;
	}
	
	@Override
	public boolean checkCollectionTime(int id, int minuteLimitBefore) {

		Map<String, Object> timeMap = ordersDAO.getOrdeDatesAndTimes(id);
		String collectionTime = timeMap.get("collectionTime").toString();
		String collectionDate = timeMap.get("collectionDate").toString();
		
		return compare(collectionTime + " " + collectionDate, minuteLimitBefore);
	}
	
	@Override
	public boolean checkNextDestinationTime(int id, int minuteLimitBefore) {

		Map<String, Object> timeMap = ordersDAO.getOrdeDatesAndTimes(id);
		
		if (timeMap.get("nextDestinationCollectionTime") == null || timeMap.get("nextDestinationCollectionDate") == null) {
			return false;
		}
		
		String nextDestinationCollectionTime = timeMap.get("nextDestinationCollectionTime").toString();
		String nextDestinationCollectionDate = timeMap.get("nextDestinationCollectionDate").toString();
		
		return compare(nextDestinationCollectionTime + " " + nextDestinationCollectionDate, minuteLimitBefore);
	}
	
	//Check that dates and times are in correct order. For example you can't return a car before it's collected
	public DateTimeCheck checkDateAndTimeCorrectness(OrderForm orderForm) {
		//nulls need to be checked first as they will return false immediately. Other type of errors should be collected in order for the user to fix them all at the same time.
		
		DateTimeCheck sendValue=new DateTimeCheckImpl(); //returnaa tämä!!
		
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
				Date collectionDateTime = new SimpleDateFormat().parse(orderForm.getCollectionDate()+" "+orderForm.getCollectionTime());
				Date destinationDateTime = new SimpleDateFormat().parse(orderForm.getDestinationDate()+" "+orderForm.getDestinationTime());
			
				if(!collectionDateTime.before(destinationDateTime)) {
					sendValue.setCollectionBeforeDestination(false);
					System.out.println("Toimitusajankohta on sama tai ennen noutoa!");
					sendValue.setEverythingOk(false);
				}
			
				if(orderForm.isHasNewDestination()) {

					Date nextDestinationCollectionDateTime = new SimpleDateFormat().parse(orderForm.getNextDestinationCollectionDate()+" "+orderForm.getNextDestinationCollectionTime());
					Date nextDestinationDateTime =new SimpleDateFormat().parse(orderForm.getNextDestinationDate()+" "+orderForm.getNextDestinationTime());
				
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
		
		return sendValue;
	}
}
