package tipi.service;

/**
 * @author Lauri Soivi, Joona Viertola, Samuel Kontiomaa
 * @version 1.0
 * @since 18.12.2013
 * Service sends order id to DAO. DAO changes orderstatus to delete. Not really deleting order from database
 */

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import tipi.dao.OrdersDAO;

@Service
public class OrdersDeleteServiceImpl implements OrdersDeleteService {

	@Inject
	private OrdersDAO ordersDao;
	
	public OrdersDAO getOrdersDao() {
		return ordersDao;
	}

	public void setOrdersDao(OrdersDAO ordersDao) {
		this.ordersDao = ordersDao;
	}
	
	@Override
	public void deleteOrder(int orderId) {
		getOrdersDao().deleteOrder(orderId);
	}
	
}
