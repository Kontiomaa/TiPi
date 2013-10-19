package tipi.dao;

import javax.inject.Inject;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Repository;

import tipi.bean.UserCompany;
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
	public UserProfile getRegisteredUsersInformationDAO(String userEmail,
			UserProfile userProfile) {

		String sql = "SELECT * FROM registeredUsers WHERE email=?;";

		userProfile = (UserProfile) getJdbcTemplate().queryForObject(sql,
				new Object[] { userEmail },
				new BeanPropertyRowMapper(UserProfileImpl.class));

		System.out.println(userProfile.toString());

		return userProfile;
	}
	
	@Override
	public UserCompany getRegisteredUsersCompanyInformationDAO(int companyID,
			UserCompany userCompany) {

		String sql = "SELECT * FROM companies WHERE company_id = ?;";

		userCompany = (UserCompany) getJdbcTemplate().queryForObject(sql,
				new Object[] { companyID },
				new BeanPropertyRowMapper(UserCompanyImpl.class));

		System.out.println(userCompany.toString());

		return userCompany;
	}

}
