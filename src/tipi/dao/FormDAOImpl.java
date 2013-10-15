package tipi.dao;

import javax.inject.Inject;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.text.ParseException;
import java.text.SimpleDateFormat;

import tipi.bean.OrderForm;

@Repository
public class FormDAOImpl implements FormDAO {

	@Inject
	private JdbcTemplate jdbcTemplate;

	public JdbcTemplate getJdbcTemplate() {
		return jdbcTemplate;
	}

	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}

	@Override
	public void saveOrderFormDAO(OrderForm orderForm) {
		System.out.println("TULEEKO?");
		
		SimpleDateFormat oldFormat = new SimpleDateFormat("dd.MM.yyyy");
		SimpleDateFormat newFormat = new SimpleDateFormat("yyyy-MM-dd");

		String collectionDate = null;
		String destinationDate = null;
		String nextDestinationCollectionDate = null;
		String nextDestinationDate = null;

		try {
			collectionDate = newFormat.format(oldFormat.parse(orderForm
					.getCollectionDate()));
			destinationDate = newFormat.format(oldFormat.parse(orderForm
					.getDestinationDate()));
			nextDestinationCollectionDate = newFormat.format(oldFormat
					.parse(orderForm.getNextDestinationCollectionDate()));
			nextDestinationDate = newFormat.format(oldFormat.parse(orderForm
					.getNextDestinationDate()));
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		String sql = "INSERT INTO orders ( carMake, carModel, carRegister, carColor,"
				+ " collectionDate, collectionTime, collectionAddress, collectionPostalCode, collectionCity,"
				+ " destinationDate, destinationTime, destinationAddress, destinationPostalCode, destinationCity,"
				+ " clientFname, clientLname, clientPhoneNo, clientCompany, additionalInformation,"
				+ "	nextDestinationCollectionDate, nextDestinationCollectionTime, nextDestinationDate,	nextDestinationTime,"
				+ " nextDestinationAddress, nextDestinationPostalCode, nextDestinationCity, "
				+ "nextAdditionalInformation) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?);";

		jdbcTemplate.update(
				sql,
				new Object[] { orderForm.getCarBrand(),
						orderForm.getCarModel(), orderForm.getCarRegister(),
						orderForm.getCarColor(), collectionDate,
						orderForm.getCollectionTime(),
						orderForm.getCollectionAddress(),
						orderForm.getCollectionPostalCode(),
						orderForm.getCollectionCity(), destinationDate,
						orderForm.getDestinationTime(),
						orderForm.getDestinationAddress(),
						orderForm.getDestinationPostalCode(),
						orderForm.getDestinationCity(),
						orderForm.getClientFname(), orderForm.getClientLname(),
						orderForm.getClientPhoneNo(),
						orderForm.getClientCompany(),
						orderForm.getAdditionalInformation(),
						nextDestinationCollectionDate,
						orderForm.getNextDestinationCollectionTime(),
						nextDestinationDate,
						orderForm.getNextDestinationTime(),
						orderForm.getNextDestinationAddress(),
						orderForm.getNextDestinationPostalCode(),
						orderForm.getNextDestinationCity(),
						orderForm.getNextAdditionalInformation()});

		/*
		 * String sql =
		 * "INSERT INTO companies (name, address, postalCode, city) VALUES (?,?,?,?);"
		 * ;
		 * 
		 * jdbcTemplate.update(sql, new Object[] { "Kesko", "Tie 32","00100",
		 * "Stadi" });
		 * 
		 * 
		 * int id = 3; String sql =
		 * "select name from companies where company_id=?";
		 * 
		 * String name = (String)getJdbcTemplate().queryForObject( sql, new
		 * Object[] { id }, String.class);
		 * 
		 * System.out.println(name);
		 */
	}

}