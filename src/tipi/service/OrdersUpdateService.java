package tipi.service;

import java.sql.Date;

import org.springframework.security.access.prepost.PreAuthorize;

public interface OrdersUpdateService {

	public abstract Date convertStringToSqlDate (String inputDate);
	/*public abstract OrderForm parseMySQLToJavaTime(OrderForm order);
	public abstract OrderForm parseMySQLToJavaTimeStamp(OrderForm order);*/
	
	@PreAuthorize("hasRole('ROLE_USER')")
	public abstract void updateModificatedOrder(String carBrand, String carModel, String carRegister, String carColor, String collectionDate, String collectionTime, String collectionAddress, String collectionPostalCode, String collectionCity, String destinationDate, String destinationTime, String destinationAddress, String destinationPostalCode, String destinationCity, String clientFname, String clientLname, String clientPhoneNo, String clientCompany, String additionalInformation, String hasNewDestination, String nextDestinationCollectionDate, String nextDestinationCollectionTime, String nextDestinationDate, String nextDestinationTime, String nextDestinationAddress, String nextDestinationPostalCode, String nextDestinationCity, String nextAdditionalInformation, String orders_id);
	
}
