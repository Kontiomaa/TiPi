package tipi.service;

import org.springframework.security.access.prepost.PreAuthorize;

public interface OrdersDeleteService {

	@PreAuthorize("isAuthenticated()")
	public abstract void deleteOrder(int orderId);
	
}
