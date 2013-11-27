package tipi.dao;

import java.util.List;
import java.util.Map;

import tipi.bean.OrderForm;
import tipi.bean.OrdersCount;

public interface OrdersDAO {

	public abstract List<OrderForm> getOrderList(int statusOfOrder);

	public abstract OrderForm getOrderBean(int id);
	
	public abstract void updateOrderStatusDAO(int orders_id, int statusOfOrder);
	
	public abstract List<OrderForm> getOrderListForUser(int user_id, int hasNewDestination, int companyMadeOrder, int statusOfOrder);
	
	public abstract OrdersCount ordersCountDAO(OrdersCount ordersCount);
	
	public abstract Map<String, Object> getOrdeDatesAndTimes(int id);
	
	public abstract List<OrderForm> searchOrdersFromDAO(OrderForm searchOrders);
	
	public abstract void deleteOrder(int orderId);
	
	public abstract boolean updateOrderByUser(OrderForm order, boolean collectionTimeLimit, boolean nextDestinationTimeLimit);
	
}