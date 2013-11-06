package tipi.dao;

import java.util.List;
import java.util.Map;

import tipi.bean.OrderForm;
import tipi.bean.OrdersCount;

public interface OrdersDAO {

	public abstract List<OrderForm> getOrderList(int statusOfOrder);

	public abstract OrderForm getOrderBean(int id);
	
	public abstract void updateOrderStatusDAO(int orders_id, int statusOfOrder);
	
	public abstract List<OrderForm> getOrderListForUser(String userEmail);
	
	public abstract OrdersCount ordersCountDAO(OrdersCount ordersCount);
	
	public abstract Map<String, Object> getOrdeDatesAndTimes(int id);

}
