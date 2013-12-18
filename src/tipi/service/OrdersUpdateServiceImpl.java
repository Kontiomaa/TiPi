package tipi.service;

/**
 * @author Lauri Soivi, Joona Viertola, Samuel Kontiomaa
 * @version 1.0
 * @since 18.12.2013
 * Service sends modified order to DAO
 */

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
	public void updateModificatedOrder(OrderForm order, boolean collectionTimeLimit, boolean nextDestinationTimeLimit) {
		boolean success = getOrdersDao().updateOrderByUser(order, collectionTimeLimit, nextDestinationTimeLimit);
		
		if (success == true) {
			System.out.println("Updating done");
		} else {
			System.out.println("Updating failed");
		}
		
	}

}