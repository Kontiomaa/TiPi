package tipi.service;

import java.sql.Date;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import tipi.bean.OrderForm;
import tipi.dao.OrdersDAO;


@Service
public class OrdersUpdateServiceImpl implements OrdersUpdateService {
	
	@Inject
	private OrdersDAO ordersDao;
	
	public OrdersDAO getOrdersDao() {
		return ordersDao;
	}

	public void setOrdersDao(OrdersDAO ordersDao) {
		this.ordersDao = ordersDao;
	}
	
	@Override
	public Date convertStringToSqlDate(String inputDate) {
		DateFormat inputFormat = new SimpleDateFormat("dd.MM.yyyy");
		DateFormat sqlFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date(0);
		java.util.Date middle;
		String sqlDateString;
		
		try {
			middle = inputFormat.parse(inputDate);
			sqlDateString = sqlFormat.format(middle);
			date = Date.valueOf(sqlDateString);
		} catch(ParseException e) {
			e.printStackTrace();
		} catch (NullPointerException e) {
			e.printStackTrace();
		}
		
		return date;
	}
	
	/*@Override
	public OrderForm parseMySQLToJavaTime(OrderForm order) {
		DateFormat inputFormat = new SimpleDateFormat("HH:mm");
		DateFormat sqlFormat = new SimpleDateFormat("HH:mm:ss");
		Time
		
		try {
			
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		if (order.getNextDestinationCollectionTime() != null) {
			try {
				order.setNextDestinationCollectionTime(newFormat.format(oldFormat.parse(order.getNextDestinationCollectionTime())));
			} catch (ParseException e) {
				e.printStackTrace();
			}
		}

		if (order.getNextDestinationTime() != null) {
			try {
				order.setNextDestinationTime(newFormat.format(oldFormat.parse(order.getNextDestinationTime())));
			} catch (ParseException e) {
				e.printStackTrace();
			}
		}
		return order;
	}
	
	@Override
	public OrderForm parseMySQLToJavaTimeStamp(OrderForm order) {
		SimpleDateFormat oldFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.S");
		SimpleDateFormat newFormat = new SimpleDateFormat("dd.MM.yyyy HH:mm");

		try {
			order.setLastTimeEdited(newFormat.format(oldFormat.parse(order.getLastTimeEdited())));
		} catch (ParseException e) {
			e.printStackTrace();
		}

		return order;
	}*/
	

	@Override
	public void updateModificatedOrder(String carBrand, String carModel, String carRegister, String carColor, String collectionDate, String collectionTime, String collectionAddress, String collectionPostalCode, String collectionCity, String destinationDate, String destinationTime, String destinationAddress, String destinationPostalCode, String destinationCity, String clientFname, String clientLname, String clientPhoneNo, String clientCompany, String additionalInformation, String hasNewDestination, String nextDestinationCollectionDate, String nextDestinationCollectionTime, String nextDestinationDate, String nextDestinationTime, String nextDestinationAddress, String nextDestinationPostalCode, String nextDestinationCity, String nextAdditionalInformation, String orders_id) {
		Date collectionDateDate = convertStringToSqlDate(collectionDate);
		Date destinationDateDate = convertStringToSqlDate(destinationDate);
		Date nextDestinationCollectionDateDate = convertStringToSqlDate(nextDestinationCollectionDate);
		Date nextDestinationDateDate = convertStringToSqlDate(nextDestinationDate);
		
		boolean success = ordersDao.updateOrderByUser(carBrand, carModel, carRegister, carColor, collectionDateDate, collectionTime, collectionAddress, collectionPostalCode, collectionCity, destinationDateDate, destinationTime, destinationAddress, destinationPostalCode, destinationCity, clientFname, clientLname, clientPhoneNo, clientCompany, additionalInformation, hasNewDestination, nextDestinationCollectionDateDate, nextDestinationCollectionTime, nextDestinationDateDate, nextDestinationTime, nextDestinationAddress, nextDestinationPostalCode, nextDestinationCity, nextAdditionalInformation, orders_id);
		if (success == true) {
			System.out.println("----------------------------------- Success: TRUE");
		} else {
			System.out.println("----------------------------------- Success: FALSE");
		}
	}

}