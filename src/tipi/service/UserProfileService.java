package tipi.service;

/**
 * @author Lauri Soivi, Joona Viertola, Samuel Kontiomaa
 * @version 1.0
 * @since 18.12.2013
 */

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
	public abstract void sendNewPasswordToDao(int usersId, String newPassword);
	
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	public abstract UserCompany getCompany(int company_id, UserCompany company);
	
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	public void sendModifiedCompany(UserCompany company);
	
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	public void sendModifiedUser(UserProfile user);
	
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	public void changeUserIsActiveStatus(UserProfile user);
	
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	public abstract List<UserProfile> getUsersByRole(int role);
	
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	public abstract UserProfile getUserById(int user_id, UserProfile user);
}
