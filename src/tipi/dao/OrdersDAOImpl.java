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
		String sql = "SELECT collectionDate, collectionTime, destinationDate, destinationTime, nextDestinationCollectionDate, nextDestinationCollectionTime, nextDestinationDate, nextDestinationTime FROM orders WHERE orders_id = ?;";
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
		String companyMadeOrder = "%";

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
		if(searchOrders.getCompanyMadeOrder() != 0)
			companyMadeOrder = Integer.toString(searchOrders.getCompanyMadeOrder());

		String sql = "SELECT * FROM orders WHERE carBrand LIKE ? AND carModel LIKE ? AND carRegister LIKE ?"
				+ " AND collectionCity LIKE ? AND destinationCity LIKE ? AND (nextDestinationCity LIKE ? OR nextDestinationCity IS NULL)"
				+ "AND (hasNewDestination = ? OR hasNewDestination = ?) AND companyMadeOrder LIKE ?;";
		Object[] data = new Object[] { 
				carBrand, carModel,
				carRegister, collectionCity,
				destinationCity, nextDestinationCity, hasNewDestination, hasNewDestination2,
				companyMadeOrder				
				};
		List<OrderForm> orders = getJdbcTemplate().query(sql,
				new BeanPropertyRowMapper(OrderFormImpl.class), data);
		return orders;
	}
	
	@Override
	public void deleteOrder(int id) {
		String sql = "DELETE FROM orders WHERE orders_id = ?";
		Object[] data =  new Object[] { id };
		getJdbcTemplate().update(sql, data);
		System.out.println("Sir, you made it.");
	}
	
	@Override
	public boolean updateOrderByUser(OrderForm order, boolean collectionTimeLimit, boolean nextDestinationTimeLimit) {	
		
		Object[] data;
		ArrayList<Object> cacheArray = new ArrayList<Object>();
		String sql = "UPDATE orders SET ";
		
		if (collectionTimeLimit) {
			System.out.println("collectionTimeLimit = true");
			sql = sql + "carBrand = ?, carRegister = ?, carModel = ?, carColor = ?, collectionDate = ?, destinationDate = ?, collectionTime = ?, destinationTime = ?, collectionAddress = ?, destinationAddress = ?, collectionPostalCode = ?, destinationPostalCode = ?, collectionCity = ?, destinationCity = ?, clientFname = ?, clientPhoneNo = ?, clientLname = ?, clientCompany = ?, additionalInformation = ?";
			cacheArray.add(order.getCarBrand());
			cacheArray.add(order.getCarRegister());
			cacheArray.add(order.getCarModel());
			cacheArray.add(order.getCarColor());
			cacheArray.add(order.getCollectionDate());
			cacheArray.add(order.getDestinationDate());
			cacheArray.add(order.getCollectionTime());
			cacheArray.add(order.getDestinationTime());
			cacheArray.add(order.getCollectionAddress());
			cacheArray.add(order.getDestinationAddress());
			cacheArray.add(order.getCollectionPostalCode());
			cacheArray.add(order.getDestinationPostalCode());
			cacheArray.add(order.getCollectionCity());
			cacheArray.add(order.getDestinationCity());
			cacheArray.add(order.getClientFname());
			cacheArray.add(order.getClientPhoneNo());
			cacheArray.add(order.getClientLname());
			cacheArray.add(order.getClientCompany());
			cacheArray.add(order.getAdditionalInformation());
		}
		
		if (order.isHasNewDestination()) {
			if (nextDestinationTimeLimit) {
				System.out.println("nextDestinationTimeLimit = true");
				if (collectionTimeLimit) {sql = sql + ", ";}
				sql = sql + "nextDestinationCollectionDate = ?, nextDestinationDate = ?, nextDestinationCollectionTime = ?, nextDestinationTime = ?, nextDestinationAddress = ?, nextDestinationPostalCode = ?, nextDestinationCity = ?, nextAdditionalInformation = ?";
				cacheArray.add(order.getNextDestinationCollectionDate());
				cacheArray.add(order.getNextDestinationDate());
				cacheArray.add(order.getNextDestinationCollectionTime());
				cacheArray.add(order.getNextDestinationTime());
				cacheArray.add(order.getNextDestinationAddress());
				cacheArray.add(order.getNextDestinationPostalCode());
				cacheArray.add(order.getNextDestinationCity());
				cacheArray.add(order.getNextAdditionalInformation());
			}
		}
		
		cacheArray.add(order.getOrders_id());
		sql = sql + " WHERE orders_id = ?";
		data = cacheArray.toArray();
		
		int update = getJdbcTemplate().update(sql, data);
		
		if (update == 1) {
			return true;
		} else { 
			return false;
		}
	}
	
}