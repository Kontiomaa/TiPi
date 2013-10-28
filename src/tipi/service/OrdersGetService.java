package tipi.service;

import java.util.List;

import org.springframework.security.access.prepost.PreAuthorize;

import tipi.bean.OrderForm;

public interface OrdersGetService {

	public abstract OrderForm getOrderFromDAO(int id);
	
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	public abstract List<OrderForm> getOrderListFromDAO(int statusOfOrder);
	
	public abstract OrderForm parseMySQLToJavaDate(OrderForm order);
	public abstract OrderForm parseMySQLToJavaTime(OrderForm order);
	public abstract OrderForm parseMySQLToJavaTimeStamp(OrderForm order);
	
	public abstract void updateOrderStatus(int orders_id, int statusOfOrder);
	
	public abstract List<OrderForm> getOrderListForUserFromDAO(String userEmail);
	
}
