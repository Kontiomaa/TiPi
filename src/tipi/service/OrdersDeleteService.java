package tipi.service;

import org.springframework.security.access.prepost.PreAuthorize;

public interface OrdersDeleteService {

	@PreAuthorize("hasRole('ROLE_USER')")
	public abstract void deleteOrder(int id);
	
}
