package tipi.service;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Map;

import javax.inject.Inject;

import tipi.dao.OrdersDAO;

public class OrdersTimeCheckServiceImpl implements OrdersTimeCheckService {

	@Inject
	private OrdersDAO ordersDAO;
	
	public OrdersDAO getOrdersDAO() {
		return ordersDAO;
	}

	public void setOrderDAO(OrdersDAO ordersDAO) {
		this.ordersDAO = ordersDAO;
	}
	
	@Override
	public boolean checkCollectionTime(int id, int minuteLimitBefore) {
		
		DateFormat formatter = new SimpleDateFormat("HH:mm:ss yyyy-MM-dd");
		
		// Create Date from orders data
		Map<String, Object> timeMap = ordersDAO.getOrdeDatesAndTimes(id);
		String collectionDate = (String)timeMap.get("collectionDate");
		String collectionTimeFrom = (String)timeMap.get("collectionTimeFrom");
		Date collectionTimestamp = new Date();
		try {
			collectionTimestamp = formatter.parse(collectionTimeFrom + " " + collectionDate);
		} catch(ParseException e) {
			e.printStackTrace();
			collectionTimestamp = null;
		}
		
		// Create Calendar from current time
		Calendar currentTimestampCal = Calendar.getInstance();
		
		// Create Calendar from orders data
		Calendar compareTimestampCal = Calendar.getInstance();
		compareTimestampCal.setTime(collectionTimestamp);
		compareTimestampCal.add(Calendar.MINUTE, minuteLimitBefore);
		
		// Compare!
		if (compareTimestampCal.compareTo(currentTimestampCal) > 0 && compareTimestampCal.compareTo(currentTimestampCal) == 0 ) {
			return false;
		}
		else {
			return true;
		}
	}
	
}
