package tipi.service;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

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
		Calendar currentTimestampCal = Calendar.getInstance();
		
		// Create Calendar from orders data
		Calendar compareTimestampCal = Calendar.getInstance();
		compareTimestampCal.setTime(collectionTimestamp);
		compareTimestampCal.add(Calendar.MINUTE, minuteLimit);
		
		// Compare!
		if (compareTimestampCal.compareTo(currentTimestampCal) > 0 && compareTimestampCal.compareTo(currentTimestampCal) == 0 ) {
			// Over timelimit
			return false;
		}
		else {
			// Under timelimit
			return true;
		}
	}
	
	@Override
	public boolean checkCollectionTime(int id, int minuteLimitBefore) {

		Map<String, Object> timeMap = ordersDAO.getOrdeDatesAndTimes(id);
		String collectionTimeFrom = timeMap.get("collectionTimeFrom").toString();
		String collectionDate = timeMap.get("collectionDate").toString();
		
		return compare(collectionTimeFrom + " " + collectionDate, 180);
	}
	
	@Override
	public boolean checkNextDestinationTime(int id, int minuteLimitBefore) {

		Map<String, Object> timeMap = ordersDAO.getOrdeDatesAndTimes(id);
		String nextDestinationCollectionTimeFrom = timeMap.get("nextDestinationCollectionTimeFrom").toString();
		String nextDestinationCollectionDate = timeMap.get("nextDestinationCollectionDate").toString();
		
		return compare(nextDestinationCollectionTimeFrom + " " + nextDestinationCollectionDate, 180);
	}
	
}
