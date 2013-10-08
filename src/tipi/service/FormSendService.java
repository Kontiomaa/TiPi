package tipi.service;

import org.springframework.security.access.prepost.PreAuthorize;

import tipi.bean.OrderFormImpl;


public interface FormSendService {

	@PreAuthorize("hasRole('ROLE_USER')")
	public abstract void sendFormToDAO(OrderFormImpl orderForm);
	
}
