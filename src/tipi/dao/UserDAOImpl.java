package tipi.dao;

import javax.inject.Inject;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;

import tipi.bean.OrderForm;
import tipi.bean.OrderFormImpl;
import tipi.bean.UserCompany;
import tipi.bean.UserCompanyImpl;
import tipi.bean.UserProfile;
import tipi.bean.UserProfileImpl;

/**
 * @author Lauri Soivi, Joona Viertola, Samuel Kontiomaa
 * @version 1.0
 * @since 18.12.2013
 * DAO saves,updates and gets users and companies
 */

@Repository
public class UserDAOImpl implements UserDAO {

	@Inject
	private JdbcTemplate jdbcTemplate;

	public JdbcTemplate getJdbcTemplate() {
		return jdbcTemplate;
	}

	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}

	/**
	 * Method gets userprofile with email.
	 * @param email is users that is registered
	 */
	@Override
	public UserProfile getRegisteredUsersInformationWithEmailDAO(
			String userEmail, UserProfile userProfile) {

		String sql = "SELECT * FROM registeredUsers WHERE email=?;";

		userProfile = (UserProfile) getJdbcTemplate().queryForObject(sql,
				new Object[] { userEmail },
				new BeanPropertyRowMapper(UserProfileImpl.class));

		return userProfile;
	}

	/**
	 * Method gets registered user company
	 */
	@Override
	public UserCompany getRegisteredUsersCompanyInformationDAO(int companyID,
			UserCompany userCompany) {

		String sql = "SELECT * FROM companies WHERE company_id = ?;";

		userCompany = (UserCompany) getJdbcTemplate().queryForObject(sql,
				new Object[] { companyID },
				new BeanPropertyRowMapper(UserCompanyImpl.class));

		return userCompany;
	}

	/**
	 * Method inserts new company to database.
	 */
	@Override
	public void registerNewCompanyDAO(UserCompany registerCompany) {

		String sql = "INSERT INTO companies (name, address, postalCode, city) VALUES (?,?,?,?);";

		jdbcTemplate.update(sql, new Object[] { registerCompany.getName(),
				registerCompany.getAddress(), registerCompany.getPostalCode(),
				registerCompany.getCity() });
	}

	/**
	 * Method inserts new user to database
	 */
	@Override
	public void registerNewUserDAO(UserProfile registerUser) {

		String sql = "INSERT INTO registeredUsers (fName, lName, phoneNo, email, password, myRole, myCompany) VALUES (?,?,?,?,?,?,?);";

		jdbcTemplate.update(sql, new Object[] { registerUser.getfName(),
				registerUser.getlName(), registerUser.getPhoneNo(),
				registerUser.getEmail(), registerUser.getPassword(),
				registerUser.getMyRole(), registerUser.getMyCompany() });
	}

	/**
	 * Method gets all companies
	 */
	@Override
	public List<UserCompany> getAllCompaniesDAO() {
		String sql = "SELECT * FROM companies;";
		List<UserCompany> allCompanies = getJdbcTemplate().query(sql,
				new BeanPropertyRowMapper(UserCompanyImpl.class));
		return allCompanies;

	}

	/**
	 * Method changes users password
	 */
	@Override
	public void saveRegisteredUsersNewPassword(int usersId, String newPassword) {
		System.out.println("DAO: " + usersId + ": " + newPassword);
		String newPasswordQuery = "UPDATE registeredUsers SET password=? WHERE user_id=?;";
		System.out.println("Query:");
		System.out.println(newPasswordQuery);
		jdbcTemplate.update(newPasswordQuery,
				new Object[] { newPassword, usersId });
		System.out.println("Accessed the database...");
	}

	/**
	 * Method gets users information with id
	 */
	@Override
	public UserProfile getUsersInformationWithIdDAO(int id,
			UserProfile userProfile) {

		String sql = "SELECT * FROM registeredUsers WHERE user_id=?;";

		userProfile = (UserProfile) getJdbcTemplate().queryForObject(sql,
				new Object[] { id },
				new BeanPropertyRowMapper(UserProfileImpl.class));

		return userProfile;
	}

	/**
	 * Method updates modified company
	 */
	@Override
	public void updateCompanyInformationDAO(UserCompany company) {
		String newPasswordQuery = "UPDATE companies SET name=?, address=?, postalCode=?, city=? WHERE company_id=?;";
		jdbcTemplate.update(
				newPasswordQuery,
				new Object[] { company.getName(), company.getAddress(),
						company.getPostalCode(), company.getCity(),
						company.getCompany_id() });
	}

	/**
	 * Method updates modified user
	 */
	@Override
	public void updateUserInformationDAO(UserProfile user) {
		String newPasswordQuery = "UPDATE registeredUsers SET fName = ?, lName = ?, phoneNo = ?,"
				+ " email = ?, myRole = ?, myCompany = ? WHERE user_id = ?;";
		jdbcTemplate.update(newPasswordQuery, new Object[] {
				user.getfName(),
				user.getlName(),
				user.getPhoneNo(),
				user.getEmail(),
				user.getMyRole(),
				user.getMyCompany(),
				user.getUser_id()
		});
	}
	
	/**
	 * Method changes is user active or not
	 */
	@Override
	public void changeUserIsActiveStatusDAO(UserProfile user) {
		String newPasswordQuery = "UPDATE registeredUsers SET userIsActive = ? WHERE user_id = ?;";
		jdbcTemplate.update(newPasswordQuery, new Object[] {
				user.isUserIsActive(),
				user.getUser_id()
		});
	}

	/**
	 * Method gets all Admins or Users
	 */
	@Override
	public List<UserProfile> getUsersByRoleDAO(int role) {

		String sql = "select * from registeredUsers where myRole=?;";

		List<UserProfile> users = getJdbcTemplate().query(sql,
				new BeanPropertyRowMapper(UserProfileImpl.class),
				new Object[] { role });

		return users;
	}
}
