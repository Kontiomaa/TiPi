package tipi.service;

import java.util.List;

import org.springframework.security.access.prepost.PreAuthorize;

import tipi.bean.UserCompany;
import tipi.bean.UserProfile;

public interface UserProfileService {
	
	@PreAuthorize("isAuthenticated()")
	public abstract UserProfile getRegisteredUsersInformationFromDAO(String userEmail, UserProfile userProfile);
	
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	public abstract void sendNewCompanyToDAO(UserCompany registerCompany);
	
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	public abstract void sendNewUserToDAO(UserProfile registerUser);
	
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	public abstract List<UserCompany> getAllCompanies();
	
	@PreAuthorize("isAuthenticated()")
	public abstract void sendNewPasswordToDao(String email, String newPassword);
}
