package tipi.service;

/**
 * @author Lauri Soivi, Joona Viertola, Samuel Kontiomaa
 * @version 1.0
 * @since 18.12.2013
 */

import org.springframework.security.access.prepost.PreAuthorize;

public interface OrdersDeleteService {

	@PreAuthorize("isAuthenticated()")
	public abstract void deleteOrder(int orderId);
	
}
