package tipi.service;

import java.sql.Date;

import org.springframework.security.access.prepost.PreAuthorize;

import tipi.bean.OrderForm;

public interface OrdersUpdateService {

	public abstract Date convertStringToSqlDate (String inputDate);
	/*public abstract OrderForm parseMySQLToJavaTime(OrderForm order);
	public abstract OrderForm parseMySQLToJavaTimeStamp(OrderForm order);*/
	
	@PreAuthorize("hasRole('ROLE_USER')")
	public abstract void updateModificatedOrder(OrderForm order, boolean collectionTimeLimit, boolean nextDestinationTimeLimit);
	
}
