package tipi.service;

/**
 * @author Lauri Soivi, Joona Viertola, Samuel Kontiomaa
 * @version 1.0
 * @since 18.12.2013
 */

import org.springframework.security.access.prepost.PreAuthorize;

import tipi.bean.OrderForm;


public interface FormSendService {

	@PreAuthorize("hasRole('ROLE_USER')")
	public abstract void sendFormToDAO(OrderForm orderForm, int userID, int userCompanyID);
}
