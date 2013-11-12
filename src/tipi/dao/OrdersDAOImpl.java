package tipi.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import tipi.bean.OrderForm;
import tipi.bean.OrderFormImpl;
import tipi.bean.OrdersCount;
import tipi.bean.OrdersCountImpl;

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
		Object[] data = new Object[] { statusOfOrder };
		List<OrderForm> resultList = getJdbcTemplate().query(sql,
				new BeanPropertyRowMapper(OrderFormImpl.class), data);

		return resultList;
	}

	@Override
	public OrderForm getOrderBean(int id) {
		String sql = "SELECT * FROM orders WHERE orders_id = ?;";
		Object[] data = new Object[] { id };
		OrderForm resultObject = getJdbcTemplate().queryForObject(sql, data,
				new BeanPropertyRowMapper(OrderFormImpl.class));

		return resultObject;
	}

	@Override
	public void updateOrderStatusDAO(int orders_id, int statusOfOrder) {
		String newPasswordQuery = "UPDATE orders SET statusOfOrder=? WHERE orders_id=?;";
		jdbcTemplate.update(newPasswordQuery, new Object[] { statusOfOrder,
				orders_id });
	}

	@Override
	public List<OrderForm> getOrderListForUser(String userEmail) {
		String sql = "SELECT * FROM orders WHERE userMadeOrder = (SELECT user_id FROM registeredUsers WHERE email = ?);";
		Object[] data = new Object[] { userEmail };
		List<OrderForm> resultList = jdbcTemplate.query(sql,
				new BeanPropertyRowMapper(OrderFormImpl.class), data);

		return resultList;
	}

	@Override
	public OrdersCount ordersCountDAO(OrdersCount ordersCount) {
		String sql = "SELECT COUNT(CASE WHEN statusOfOrder =1 THEN 1 end) as newOrdersCount,"
				+ " COUNT(CASE WHEN statusOfOrder =2 THEN 1 end) as acceptedOrdersCount,"
				+ " COUNT(CASE WHEN statusOfOrder =3 THEN 1 end) as takenOrdersCount,"
				+ " COUNT(CASE WHEN statusOfOrder =4 THEN 1 end) as completedOrdersCount FROM orders;";
		ordersCount = (OrdersCount) jdbcTemplate.queryForObject(sql,
				new BeanPropertyRowMapper(OrdersCountImpl.class));
		return ordersCount;
	}

	@Override
	public Map<String, Object> getOrdeDatesAndTimes(int id) {
		String sql = "SELECT collectionDate, collectionTimeFrom, collectionTimeTo, destinationDate, destinationTime, nextDestinationCollectionDate, nextDestinationCollectionTimeFrom, nextDestinationCollectionTimeTo, nextDestinationDate, nextDestinationTime FROM orders WHERE orders_id = ?;";
		Object[] data = new Object[] { id };
		Map<String, Object> resultMap = jdbcTemplate.queryForMap(sql, data);

		return resultMap;
	}

	@Override
	public List<OrderForm> searchOrdersFromDAO(OrderForm searchOrders) {
		String carBrand = "%";
		String carModel = "%";
		String carRegister = "%";
		String collectionCity = "%";
		String destinationCity = "%";
		String nextDestinationCity = "%";
		boolean hasNewDestination = true;
		boolean hasNewDestination2 = false;

		if (!searchOrders.getCarBrand().isEmpty())
			carBrand = searchOrders.getCarBrand();
		if (!searchOrders.getCarModel().isEmpty())
			carModel = searchOrders.getCarModel();
		if (!searchOrders.getCarRegister().isEmpty())
			carRegister = searchOrders.getCarRegister();
		if (!searchOrders.getCollectionCity().isEmpty())
			collectionCity = searchOrders.getCollectionCity();
		if (!searchOrders.getDestinationCity().isEmpty())
			destinationCity = searchOrders.getDestinationCity();
		if (!searchOrders.getNextDestinationCity().isEmpty())
			nextDestinationCity = searchOrders.getNextDestinationCity();
		if (searchOrders.getHasNewDestinationForSearchOrders() == 1)
			hasNewDestination = false;
		else if (searchOrders.getHasNewDestinationForSearchOrders() == 2)
			hasNewDestination2 = true;
		

		String sql = "SELECT * FROM orders WHERE carBrand LIKE ? AND carModel LIKE ? AND carRegister LIKE ?"
				+ " AND collectionCity LIKE ? AND destinationCity LIKE ? AND (nextDestinationCity LIKE ? OR nextDestinationCity IS NULL)"
				+ "AND (hasNewDestination = ? OR hasNewDestination = ?);";
		Object[] data = new Object[] { 
				carBrand, carModel,
				carRegister, collectionCity,
				destinationCity, nextDestinationCity, hasNewDestination, hasNewDestination2,
				
				};
		List<OrderForm> orders = getJdbcTemplate().query(sql,
				new BeanPropertyRowMapper(OrderFormImpl.class), data);
		return orders;
	}
}