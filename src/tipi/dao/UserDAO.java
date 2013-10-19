package tipi.dao;

import tipi.bean.UserCompany;
import tipi.bean.UserProfile;

public interface UserDAO {

	public abstract UserProfile getRegisteredUsersInformationDAO(String userEmail, UserProfile userProfile);
	
	public UserCompany getRegisteredUsersCompanyInformationDAO(int companyID, UserCompany userCompany);
	
}
