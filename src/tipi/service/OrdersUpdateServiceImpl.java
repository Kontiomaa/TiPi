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
	public String convertStringToSqlDate(String inputDate) {
		SimpleDateFormat oldFormat = new SimpleDateFormat("dd.MM.yyyy");
		SimpleDateFormat newFormat = new SimpleDateFormat("yyyy-MM-dd");

		String date = "";
		
		try {
			date = newFormat.format(oldFormat.parse(inputDate));
		} catch (ParseException e) {
			// TODO Auto-generated catch block
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
	public void updateModificatedOrder(OrderForm order, boolean collectionTimeLimit, boolean nextDestinationTimeLimit) {
		if(!order.getCollectionDate().isEmpty())
			order.setCollectionDate(convertStringToSqlDate(order.getCollectionDate()));
		if(!order.getDestinationDate().isEmpty())
			order.setDestinationDate(convertStringToSqlDate(order.getDestinationDate()));
		if(!order.getNextDestinationCollectionDate().isEmpty())
			order.setNextDestinationCollectionDate(convertStringToSqlDate(order.getNextDestinationCollectionDate()));
		if(!order.getNextDestinationDate().isEmpty())
			order.setNextDestinationDate(convertStringToSqlDate(order.getNextDestinationDate()));

		boolean success = getOrdersDao().updateOrderByUser(order, collectionTimeLimit, nextDestinationTimeLimit);
		
		if (success == true) {
			System.out.println("Updating done");
		} else {
			System.out.println("Updating failed");
		}
		
	}

}