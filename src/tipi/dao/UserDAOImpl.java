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

	@Override
	public UserProfile getRegisteredUsersInformationWithEmailDAO(
			String userEmail, UserProfile userProfile) {

		String sql = "SELECT * FROM registeredUsers WHERE email=?;";

		userProfile = (UserProfile) getJdbcTemplate().queryForObject(sql,
				new Object[] { userEmail },
				new BeanPropertyRowMapper(UserProfileImpl.class));

		return userProfile;
	}

	@Override
	public UserCompany getRegisteredUsersCompanyInformationDAO(int companyID,
			UserCompany userCompany) {

		String sql = "SELECT * FROM companies WHERE company_id = ?;";

		userCompany = (UserCompany) getJdbcTemplate().queryForObject(sql,
				new Object[] { companyID },
				new BeanPropertyRowMapper(UserCompanyImpl.class));

		return userCompany;
	}

	@Override
	public void registerNewCompanyDAO(UserCompany registerCompany) {

		String sql = "INSERT INTO companies (name, address, postalCode, city) VALUES (?,?,?,?);";

		jdbcTemplate.update(sql, new Object[] { registerCompany.getName(),
				registerCompany.getAddress(), registerCompany.getPostalCode(),
				registerCompany.getCity() });
	}

	@Override
	public void registerNewUserDAO(UserProfile registerUser) {

		String sql = "INSERT INTO registeredUsers (fName, lName, phoneNo, email, password, myRole, myCompany) VALUES (?,?,?,?,?,?,?);";
		System.out.println(registerUser.toString());

		jdbcTemplate.update(sql, new Object[] { registerUser.getfName(),
				registerUser.getlName(), registerUser.getPhoneNo(),
				registerUser.getEmail(), registerUser.getPassword(),
				registerUser.getMyRole(), registerUser.getMyCompany() });
	}

	@Override
	public List<UserCompany> getAllCompaniesDAO() {
		String sql = "SELECT * FROM companies;";

		List<UserCompany> allCompanies = getJdbcTemplate().query(sql,
				new BeanPropertyRowMapper(UserCompanyImpl.class));

		for (UserCompany userCompany2 : allCompanies) {
			System.out.println(userCompany2.toString());
		}
		return allCompanies;

	}

	@Override
	public void saveRegisteredUsersNewPassword(String email, String newPassword) {
		System.out.println("DAO: " + email + ": " + newPassword);
		String newPasswordQuery = "UPDATE registeredUsers SET password=? WHERE email=?;";
		System.out.println("Query:");
		System.out.println(newPasswordQuery);
		jdbcTemplate.update(newPasswordQuery,
				new Object[] { newPassword, email });
		System.out.println("Accessed the database...");
	}

	@Override
	public UserProfile getUsersInformationWithIdDAO(int id,
			UserProfile userProfile) {

		String sql = "SELECT * FROM registeredUsers WHERE user_id=?;";

		userProfile = (UserProfile) getJdbcTemplate().queryForObject(sql,
				new Object[] { id },
				new BeanPropertyRowMapper(UserProfileImpl.class));

		return userProfile;
	}

	@Override
	public void updateCompanyInformationDAO(UserCompany company) {
		String newPasswordQuery = "UPDATE companies SET name=?, address=?, postalCode=?, city=? WHERE company_id=?;";
		jdbcTemplate.update(
				newPasswordQuery,
				new Object[] { company.getName(), company.getAddress(),
						company.getPostalCode(), company.getCity(),
						company.getCompany_id() });
	}

	@Override
	public List<UserProfile> getUsersByRoleDAO(int role) {

		String sql = "select * from registeredUsers where myRole=?;";

		List<UserProfile> users = getJdbcTemplate().query(sql,
				new BeanPropertyRowMapper(UserProfileImpl.class),
				new Object[] { role });

		return users;
	}
}
