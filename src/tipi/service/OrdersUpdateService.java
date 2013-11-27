package tipi.service;

import java.sql.Date;

import org.springframework.security.access.prepost.PreAuthorize;

import tipi.bean.OrderForm;

public interface OrdersUpdateService {
	
	@PreAuthorize("hasRole('ROLE_USER')")
	public abstract void updateModificatedOrder(OrderForm order, boolean collectionTimeLimit, boolean nextDestinationTimeLimit);
	
}
