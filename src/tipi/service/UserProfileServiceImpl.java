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
	
	@Override
	public UserProfile getRegisteredUsersInformationFromDAO(String userEmail, UserProfile userProfile){
		UserCompany userCompany = new UserCompanyImpl();
		userProfile = userDao.getRegisteredUsersInformationWithEmailDAO(userEmail, userProfile);
		userCompany = userDao.getRegisteredUsersCompanyInformationDAO(userProfile.getMyCompany(), userCompany);
		userProfile.setCompany(userCompany);
		return userProfile;
	}

	@Override
	public void sendNewCompanyToDAO(UserCompany registerCompany){
		userDao.registerNewCompanyDAO(registerCompany);
	}
	
	@Override
	public void sendNewUserToDAO(UserProfile registerUser){
		userDao.registerNewUserDAO(registerUser);
	}
	
	@Override
	public List<UserCompany> getAllCompanies(){
		List<UserCompany> allCompanies = userDao.getAllCompaniesDAO();
		return allCompanies;
	}
	
	@Override
	public void sendNewPasswordToDao(String email, String newPassword){
		System.out.println("Service: "+email+" "+newPassword);
		userDao.saveRegisteredUsersNewPassword(email, newPassword);
	}
	
	@Override
	public UserCompany getCompany(int company_id, UserCompany company) {
		company = userDao.getRegisteredUsersCompanyInformationDAO(company_id, company);
		return company;
	}
	
	@Override
	public void sendModifiedCompany(UserCompany company){
		userDao.updateCompanyInformationDAO(company);
	}
	
	@Override
	public void sendModifiedUser(UserProfile user){
		userDao.updateUserInformationDAO(user);
	}
	
	@Override
	public void changeUserIsActiveStatus(UserProfile user){
		userDao.changeUserIsActiveStatusDAO(user);
	}
	
	@Override
	public List<UserProfile> getUsersByRole(int role){
		List<UserProfile> users = userDao.getUsersByRoleDAO(role);
		for (UserProfile user : users) {
			UserCompany userCompany = new UserCompanyImpl();
			userCompany = userDao.getRegisteredUsersCompanyInformationDAO(user.getMyCompany(), userCompany);
			user.setCompany(userCompany);
		}
		return users;
	}
	
	@Override
	public UserProfile getUserById(int user_id, UserProfile user) {
		user = userDao.getUsersInformationWithIdDAO(user_id, user);
		return user;
	}
}
