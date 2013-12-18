package tipi.service;

/**
 * @author Lauri Soivi, Joona Viertola, Samuel Kontiomaa
 * @version 1.0
 * @since 18.12.2013
 * Service sends users and companies to dao. Service gets users and companies from dao
 */

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
	
	/**
	 * Method gets registered users profile 
	 */
	@Override
	public UserProfile getRegisteredUsersInformationFromDAO(String userEmail, UserProfile userProfile){
		UserCompany userCompany = new UserCompanyImpl();
		userProfile = userDao.getRegisteredUsersInformationWithEmailDAO(userEmail, userProfile);
		userCompany = userDao.getRegisteredUsersCompanyInformationDAO(userProfile.getMyCompany(), userCompany);
		userProfile.setCompany(userCompany);
		return userProfile;
	}

	/**
	 * Method sends new company to DAO. So new company is registered
	 */
	@Override
	public void sendNewCompanyToDAO(UserCompany registerCompany){
		userDao.registerNewCompanyDAO(registerCompany);
	}
	
	/**
	 * Method sends new user to DAO. So new user is registered
	 */
	@Override
	public void sendNewUserToDAO(UserProfile registerUser){
		userDao.registerNewUserDAO(registerUser);
	}
	
	/**
	 * Method gets list of all companies
	 */
	@Override
	public List<UserCompany> getAllCompanies(){
		List<UserCompany> allCompanies = userDao.getAllCompaniesDAO();
		return allCompanies;
	}
	
	/**
	 * Method sends new password to DAO
	 */
	@Override
	public void sendNewPasswordToDao(int usersId, String newPassword){
		System.out.println("Service: "+usersId+" "+newPassword);
		userDao.saveRegisteredUsersNewPassword(usersId, newPassword);
	}
	
	/**
	 * Method gets company object from dao.
	 */
	@Override
	public UserCompany getCompany(int company_id, UserCompany company) {
		company = userDao.getRegisteredUsersCompanyInformationDAO(company_id, company);
		return company;
	}
	
	/**
	 * Method sends modified company to dao.
	 */
	@Override
	public void sendModifiedCompany(UserCompany company){
		userDao.updateCompanyInformationDAO(company);
	}
	
	/**
	 * Method sends modified user to dao.
	 */
	@Override
	public void sendModifiedUser(UserProfile user){
		userDao.updateUserInformationDAO(user);
	}
	
	/**
	 * Method changes user to active or deleted
	 */
	@Override
	public void changeUserIsActiveStatus(UserProfile user){
		userDao.changeUserIsActiveStatusDAO(user);
	}
	
	/**
	 * Method gets users or admins from dao.
	 */
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
	
	/**
	 * Method get user information
	 */
	@Override
	public UserProfile getUserById(int user_id, UserProfile user) {
		user = userDao.getUsersInformationWithIdDAO(user_id, user);
		return user;
	}
}
