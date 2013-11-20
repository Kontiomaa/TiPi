package tipi.service;

import java.util.List;

import org.springframework.security.access.prepost.PreAuthorize;

import tipi.bean.OrderForm;
import tipi.bean.OrdersCount;

public interface OrdersGetService {

	public abstract OrderForm getOrderFromDAO(int id);
	
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	public abstract List<OrderForm> getOrderListFromDAO(int statusOfOrder);
	
	public abstract OrderForm parseMySQLToJavaDate(OrderForm order);
	public abstract OrderForm parseMySQLToJavaTime(OrderForm order);
	public abstract OrderForm parseMySQLToJavaTimeStamp(OrderForm order);
	
	public abstract void updateOrderStatus(int orders_id, int statusOfOrder);
	
	@PreAuthorize("hasRole('ROLE_USER')")
	public abstract List<OrderForm> getOrderListForUserFromDAO(int user_id, int hasNewDestination, int companyMadeOrder, int statusOfOrder);
	
	@PreAuthorize("hasRole('ROLE_USER')")
	public abstract OrderForm getOrderForUserFromDAO(int id);
	
	@PreAuthorize("isAuthenticated()")
	public abstract OrdersCount getOrdersCount();
	
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	public abstract List<OrderForm> searchOrdersService(OrderForm searchOrders);
	
}
