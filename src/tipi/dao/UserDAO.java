package tipi.dao;

import java.util.List;

import tipi.bean.UserCompany;
import tipi.bean.UserProfile;

public interface UserDAO {

	public abstract UserProfile getRegisteredUsersInformationDAO(String userEmail, UserProfile userProfile);
	
	public abstract UserCompany getRegisteredUsersCompanyInformationDAO(int companyID, UserCompany userCompany);
	
	public abstract void registerNewCompanyDAO(UserCompany registerCompany);
	
	public abstract void registerNewUserDAO(UserProfile registerUser);
	
	public abstract List<UserCompany> getAllCompaniesDAO();
	
	public abstract void saveRegisteredUsersNewPassword(String email, String newPassword);
	
}
