package tipi.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import tipi.bean.UserCompany;
import tipi.bean.UserCompanyImpl;
import tipi.bean.UserProfile;
import tipi.dao.UserDAO;

@Service
public class UserProfileServiceImpl implements UserProfileService {

	@Inject
	private UserDAO userDao;
	
	public UserDAO getUserDao() {
		return userDao;
	}
	
	public void setUserDao(UserDAO userDao) {
		this.userDao = userDao;
	}
	
	public UserProfile getRegisteredUsersInformationFromDAO(String userEmail, UserProfile userProfile){
		UserCompany userCompany = new UserCompanyImpl();
		userProfile = userDao.getRegisteredUsersInformationWithEmailDAO(userEmail, userProfile);
		userCompany = userDao.getRegisteredUsersCompanyInformationDAO(userProfile.getMyCompany(), userCompany);
		userProfile.setCompany(userCompany);
		return userProfile;
	}

	public void sendNewCompanyToDAO(UserCompany registerCompany){
		userDao.registerNewCompanyDAO(registerCompany);
	}
	
	public void sendNewUserToDAO(UserProfile registerUser){
		userDao.registerNewUserDAO(registerUser);
	}
	
	public List<UserCompany> getAllCompanies(){
		List<UserCompany> allCompanies = userDao.getAllCompaniesDAO();
		return allCompanies;
	}
	
	public void sendNewPasswordToDao(String email, String newPassword){
		System.out.println("Service: "+email+" "+newPassword);
		userDao.saveRegisteredUsersNewPassword(email, newPassword);
	}
	
}
