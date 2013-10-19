package tipi.service;

import org.springframework.security.access.prepost.PreAuthorize;

import tipi.bean.UserProfile;

public interface UserProfileService {
	
	@PreAuthorize("isAuthenticated()")
	public abstract UserProfile getRegisteredUsersInformationFromDAO(String userEmail, UserProfile userProfile);

}
