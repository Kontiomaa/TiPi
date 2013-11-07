package tipi.service;

import org.springframework.security.access.prepost.PreAuthorize;

public interface OrdersTimeCheckService {
	
	@PreAuthorize("hasRole('ROLE_USER')")
	public abstract boolean checkCollectionTime(int id, int minutes);
	
}
