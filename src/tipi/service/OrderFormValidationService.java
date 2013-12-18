package tipi.service;

/**
 * @author Lauri Soivi, Joona Viertola, Samuel Kontiomaa
 * @version 1.0
 * @since 18.12.2013
 */

import org.springframework.security.access.prepost.PreAuthorize;

import tipi.bean.DateTimeCheck;
import tipi.bean.OrderForm;

public interface OrderFormValidationService {
	
	@PreAuthorize("isAuthenticated()")
	public abstract DateTimeCheck checkDateAndTimeCorrectness(OrderForm orderForm);
}