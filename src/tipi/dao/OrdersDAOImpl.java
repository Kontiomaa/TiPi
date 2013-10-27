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
	public List<OrderForm> getOrderList(int statusOfOrder) {
		String sql = "SELECT * FROM orders WHERE statusOfOrder = ?;";
		Object[] data = new Object[] {statusOfOrder};
		List<OrderForm> resultList = getJdbcTemplate().query(sql, new BeanPropertyRowMapper(OrderFormImpl.class), data);
		
		return resultList;
	}

	@Override
	public OrderForm getOrderBean(int id) {
		String sql = "SELECT * FROM orders WHERE orders_id = ?;";
		Object[] data = new Object[] {id};
		OrderForm resultObject = getJdbcTemplate().queryForObject(sql, data, new BeanPropertyRowMapper(OrderFormImpl.class));
		
		return resultObject;
	}
	
	@Override
	public void updateOrderStatusDAO(int orders_id, int statusOfOrder) {
		String newPasswordQuery = "UPDATE orders SET statusOfOrder=? WHERE orders_id=?;";
		jdbcTemplate.update(newPasswordQuery, new Object[] {
				statusOfOrder,
				orders_id
		});
	}
	
	@Override
	public List<OrderForm> getOrderListForUser(String userEmail) {
		String sql = "SELECT * FROM orders WHERE userMadeOrder = (SELECT user_id FROM registeredUsers WHERE email = ?);";
		Object[] data = new Object[] {userEmail};
		List<OrderForm> resultList = jdbcTemplate.query(sql, new BeanPropertyRowMapper(OrderFormImpl.class), data);
		
		return resultList;
	}
}