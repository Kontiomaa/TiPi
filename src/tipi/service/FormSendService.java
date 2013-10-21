package tipi.service;

import org.springframework.security.access.prepost.PreAuthorize;

import tipi.bean.OrderForm;


public interface FormSendService {

	@PreAuthorize("hasRole('ROLE_USER')")
	public abstract void sendFormToDAO(OrderForm orderForm, int userID, int userCompanyID);
}
