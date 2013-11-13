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
	 * Returns boolean if the editing is allowed anymore. 
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
		String collectionTimeFrom = timeMap.get("collectionTimeFrom").toString();
		String collectionDate = timeMap.get("collectionDate").toString();
		
		return compare(collectionTimeFrom + " " + collectionDate, 180);
	}
	
	@Override
	public boolean checkNextDestinationTime(int id, int minuteLimitBefore) {

		Map<String, Object> timeMap = ordersDAO.getOrdeDatesAndTimes(id);
		
		if (timeMap.get("nextDestinationCollectionTimeFrom") == null || timeMap.get("nextDestinationCollectionDate") == null) {
			return false;
		}
		
		String nextDestinationCollectionTimeFrom = timeMap.get("nextDestinationCollectionTimeFrom").toString();
		String nextDestinationCollectionDate = timeMap.get("nextDestinationCollectionDate").toString();
		
		return compare(nextDestinationCollectionTimeFrom + " " + nextDestinationCollectionDate, 180);
	}
	
}
