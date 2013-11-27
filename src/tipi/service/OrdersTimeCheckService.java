package tipi.service;

import org.springframework.security.access.prepost.PreAuthorize;

import tipi.bean.OrderForm;
import tipi.bean.DateTimeCheck;


public interface OrdersTimeCheckService {
	
	@PreAuthorize("hasRole('ROLE_USER')")
	public abstract boolean checkCollectionTime(int id, int minutes);
	
	@PreAuthorize("hasRole('ROLE_USER')")
	public abstract boolean checkNextDestinationTime(int id, int minutes);
	
	@PreAuthorize("isAuthenticated()")
	public abstract DateTimeCheck checkDateAndTimeCorrectness(OrderForm orderForm);
}
