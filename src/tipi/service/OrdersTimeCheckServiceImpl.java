package tipi.service;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Map;

import javax.inject.Inject;
import javax.validation.constraints.Pattern;

import org.springframework.stereotype.Service;

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
		
		// Create time limit from orders data
		Calendar timeLimitCal = Calendar.getInstance();
		timeLimitCal.setTime(collectionTimestamp);
		timeLimitCal.add(Calendar.MINUTE, minuteLimit);
		
		// Compare
		boolean allowed = true;
		if (currentCal.before(timeLimitCal)) {
			allowed = true;
		}
		
		if (currentCal.equals(timeLimitCal)) {
			allowed = false;
		}
		
		if (currentCal.after(timeLimitCal)) {
			allowed = false;
		}
		
		return allowed;
	}
	
	@Override
	public boolean checkCollectionTime(int id, int minuteLimitBefore) {

		Map<String, Object> timeMap = ordersDAO.getOrdeDatesAndTimes(id);
		String collectionTime = timeMap.get("collectionTime").toString();
		String collectionDate = timeMap.get("collectionDate").toString();

		return compare(collectionTime + " " + collectionDate, 180);
	}
	
	@Override
	public boolean checkNextDestinationTime(int id, int minuteLimitBefore) {

		Map<String, Object> timeMap = ordersDAO.getOrdeDatesAndTimes(id);
		
		if (timeMap.get("nextDestinationCollectionTime") == null || timeMap.get("nextDestinationCollectionDate") == null) {
			return false;
		}
		
		String nextDestinationCollectionTime = timeMap.get("nextDestinationCollectionTime").toString();
		String nextDestinationCollectionDate = timeMap.get("nextDestinationCollectionDate").toString();
		
		return compare(nextDestinationCollectionTime + " " + nextDestinationCollectionDate, 180);
	}
	
	//Check that dates and times are in correct order. For example you can't return a car before it's collected
	public boolean checkDateAndTimeCorrectness(OrderForm orderForm) {
		//nulls need to be checked first as they will return false immediately. Other type of errors should be collected in order for the user to fix them all at the same time.
		boolean returnValue=true;
		
		//Check if empty
		if(orderForm.getCollectionDate().equals(null)) {
			System.out.println("Noutop�iv� on tyhj�");
			returnValue=false;
		}
		else if(orderForm.getCollectionTime().equals(null)) {
			System.out.println("Noutoaika on tyhj�");
			returnValue=false;
		}
		else if(orderForm.getDestinationDate().equals(null)) {
			System.out.println("Toimitusp�iv� on tyhj�");
			returnValue=false;
		}
		else if(orderForm.getDestinationTime().equals(null)) {
			System.out.println("Toimitusaika on tyhj�");
			returnValue=false;
		}
		
		if(orderForm.isHasNewDestination()) {
			
			//Check for nulls and incorrect values. 
			
			if(!orderForm.getNextDestinationCollectionDate().equals(null)) {
				//@Pattern(regexp = "\\d{2}[.]\\d{2}[.]\\d{4}")
			}
			else {
				System.out.println("Palautuksen noutop�iv� on tyhj�");
				returnValue=false;	
			}
			if(!orderForm.getNextDestinationCollectionTime().equals(null)) {
				//@Pattern(regexp = "\\d{2}[:]\\d{2}")
			}
			else {
				System.out.println("Palautuksen noutoaika on tyhj�");
				returnValue=false;
			}
			if(!orderForm.getNextDestinationDate().equals(null)) {
				//@Pattern(regexp = "\\d{2}[.]\\d{2}[.]\\d{4}")
			}
			else {
				System.out.println("Palautuksen palautusp�iv� on tyhj�");
				returnValue=false;	
			}
			if(!orderForm.getNextDestinationTime().equals(null)) {
				//@Pattern(regexp = "\\d{2}[:]\\d{2}")
			}
			else {
				System.out.println("Palautuksen palautusaika on tyhj�");
				returnValue=false;
			}
		}
		
		//if returnValue is false return immediately to inform that the above mentioned fields are not filled. If true, continue to actual testing of datetimes
		if(returnValue=false)
		{
			//inform of empty values to user
			return returnValue;
		}
		
		//turn Strings to Dates and compare them with each other
		try{
			Date collectionDateTime = new SimpleDateFormat().parse(orderForm.getCollectionDate()+" "+orderForm.getCollectionTime());
			Date destinationDateTime = new SimpleDateFormat().parse(orderForm.getDestinationDate()+" "+orderForm.getDestinationTime());
			
			if(!collectionDateTime.before(destinationDateTime)) {
				//set/send false notification of this datetime to a bean so the user can be shown the exact error row(s).
				System.out.println("Toimitusajankohta on sama tai ennen noutoa!");
				returnValue=false;
			}
			
			if(orderForm.isHasNewDestination()) {

				Date nextDestinationCollectionDateTime = new SimpleDateFormat().parse(orderForm.getNextDestinationCollectionDate()+" "+orderForm.getNextDestinationCollectionTime());
				Date nextDestinationDateTime =new SimpleDateFormat().parse(orderForm.getNextDestinationDate()+" "+orderForm.getNextDestinationTime());
				
				if(!destinationDateTime.before(nextDestinationCollectionDateTime)) {
					System.out.println("Palautuksen nouto on ennen toimitusta!");
					returnValue=false;
				}
				
				if(!nextDestinationCollectionDateTime.before(nextDestinationDateTime)) {
					System.out.println("Palautuksen palautus on ennen palautuksen noutoa!");
					returnValue=false;
				}
				
				System.out.println("CollectionDatetime: "+collectionDateTime+"\n DestinationDateTime: "+destinationDateTime+"\n nextDestinationCollectionDateTime: "+nextDestinationCollectionDateTime+"\n nextDestinationDateTime: "+nextDestinationDateTime);
			}
			else {
				System.out.println("CollectionDatetime: "+collectionDateTime+"\nDestinationDateTime: "+destinationDateTime);
			}
		}
		catch(ParseException e) {
			System.out.println("ParseException: "+e);
		}
		return returnValue;
	}
}
