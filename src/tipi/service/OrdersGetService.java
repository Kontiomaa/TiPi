package tipi.service;

import java.util.List;

import org.springframework.security.access.prepost.PreAuthorize;

import tipi.bean.OrderForm;

public interface OrdersGetService {

	@PreAuthorize("hasRole('ROLE_ADMIN')")
	public abstract OrderForm getOrderFromDAO(int id);
	
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	public abstract List<OrderForm> getOrderListFromDAO();
	
}
