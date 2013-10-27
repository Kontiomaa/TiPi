package tipi.dao;

import java.util.List;

import tipi.bean.OrderForm;

public interface OrdersDAO {

	public abstract List<OrderForm> getOrderList(int statusOfOrder);

	public abstract OrderForm getOrderBean(int id);
	
	public abstract void updateOrderStatusDAO(int orders_id, int statusOfOrder);
	
	public abstract List<OrderForm> getOrderListForUser(String userEmail);

}
