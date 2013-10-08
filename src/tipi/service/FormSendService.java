package tipi.service;

import org.springframework.security.access.prepost.PreAuthorize;


public interface FormSendService {

	@PreAuthorize("hasRole('ROLE_USER')")
	public abstract void sendFormToDAO();
	
}
