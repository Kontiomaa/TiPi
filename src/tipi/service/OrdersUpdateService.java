package tipi.service;

/**
 * @author Lauri Soivi, Joona Viertola, Samuel Kontiomaa
 * @version 1.0
 * @since 18.12.2013
 */

import java.sql.Date;

import org.springframework.security.access.prepost.PreAuthorize;

import tipi.bean.OrderForm;

public interface OrdersUpdateService {
	
	@PreAuthorize("hasRole('ROLE_USER')")
	public abstract void updateModificatedOrder(OrderForm order, boolean collectionTimeLimit, boolean nextDestinationTimeLimit);
	
}
