package tipi.service;

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
	public void deleteOrder(int id) {
		getOrdersDao().deleteOrder(id);
	}
	
}
