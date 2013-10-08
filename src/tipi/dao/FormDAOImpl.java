package tipi.dao;

import org.springframework.stereotype.Repository;


import javax.inject.Inject;

import org.springframework.jdbc.core.JdbcTemplate;

@Repository
public class FormDAOImpl implements FormDAO {
/*
	@Inject
	private JdbcTemplate jdbcTemplate;
	
	public JdbcTemplate getJdbcTemplate() {
		return jdbcTemplate;
	}
	
	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}
*/	
	@Override
	public void saveOrderFormDAO() {
		System.out.println("TÄMä ON DAO!!!!!!!!!");
		

	}
	
}