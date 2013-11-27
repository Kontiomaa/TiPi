package tipi.service;

import org.springframework.security.access.prepost.PreAuthorize;

import tipi.bean.DateTimeCheck;
import tipi.bean.OrderForm;

public interface OrderFormValidationService {
	
	@PreAuthorize("isAuthenticated()")
	public abstract DateTimeCheck checkDateAndTimeCorrectness(OrderForm orderForm);
}