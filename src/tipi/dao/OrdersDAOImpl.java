package tipi.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

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
	public ArrayList<OrderFormImpl> getOrderListDAO() {

		ArrayList<OrderFormImpl> orderArrayList = new ArrayList<OrderFormImpl>();
		
		String sql = "SELECT carMake, carModel, carRegister, carColor, collectionDate, collectionTime, collectionAddress, collectionPostalCode, collectionCity, clientFname, clientLname, clientPhoneNo, clientCompany, additionalInformation, companyMadeOrder, userMadeOrder, statusOfOrder, lastTimeEdited, hasNewDestination, nextDestinationCollectionDate, nextDestinationCollectionTime, nextDestinationDate, nextDestinationTime, nextDestinationAddress, nextDestinationPostalCode, nextAdditionalInformation FROM orders;";
		
		// Creates list of order beans in List-type
		List<OrderFormImpl> sqlQueryOrderList = jdbcTemplate.query(sql, new RowMapper() {
			public Object mapRow(ResultSet rs, int rowNum) throws SQLException {
				
				OrderFormImpl order = new OrderFormImpl();
				order.setCarBrand(rs.getString(1));
				order.setCarModel(rs.getString(2));
				order.setCarRegister(rs.getString(3));
				order.setCarColor(rs.getString(4));
				order.setCollectionDate(rs.getString(5));
				order.setCollectionTime(rs.getString(6));
				order.setCollectionAddress(rs.getString(7));
				order.setCollectionPostalCode(rs.getString(8));
				order.setCollectionCity(rs.getString(9));
				order.setDestinationTime(rs.getString(10));
				order.setDestinationAddress(rs.getString(11));
				order.setDestinationPostalCode(rs.getString(12));
				order.setDestinationCity(rs.getString(13));
				order.setClientFname(rs.getString(14));
				order.setClientLname(rs.getString(15));
				order.setClientPhoneNo(rs.getString(16));
				order.setClientCompany(rs.getString(17));
				order.setAdditionalInformation(rs.getString(18));
				order.setNextDestinationCollectionDate(rs.getString(19));
				order.setNextDestinationCollectionTime(rs.getString(20));
				order.setNextDestinationDate(rs.getString(21));
				order.setNextDestinationTime(rs.getString(22));
				order.setNextDestinationAddress(rs.getString(23));
				order.setNextDestinationPostalCode(rs.getString(24));
				order.setNextDestinationCity(rs.getString(25));
				order.setNextAdditionalInformation(rs.getString(26));
				
				return order;
			}
		});
		
		// Convert ArrayList from List
		for (OrderFormImpl orderFormImpl : sqlQueryOrderList) {
			orderArrayList.add(orderFormImpl);
		}
		
		return orderArrayList;

	}

}














