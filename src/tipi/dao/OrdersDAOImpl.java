package tipi.dao;

import java.util.List;

import javax.inject.Inject;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import tipi.bean.OrderForm;
import tipi.bean.OrderFormImpl;

@Repository
public class OrdersDAOImpl implements OrdersDAO {

	@Inject
	private JdbcTemplate jdbcTemplate;

	public JdbcTemplate getJdbcTemplate() {
		return jdbcTemplate;
	}

	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}
	

	@Override
	public List<OrderForm> getOrderList() {
		
		String sql = "SELECT * FROM orders;";
		
		List<OrderForm> resultList = getJdbcTemplate().query(sql, new BeanPropertyRowMapper(OrderFormImpl.class));
		
		return resultList;

	}

	@Override
	public OrderForm getOrderBean(int id) {
				
		String sql = "SELECT * FROM orders WHERE orders_id = ?";
		
		Object[] data = new Object[] {id};
		
		OrderForm resultObject = getJdbcTemplate().queryForObject(sql, data, new BeanPropertyRowMapper(OrderFormImpl.class));
		
		return resultObject;
		
	}
	
}