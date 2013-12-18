package tipi.dao;

/**
 * @author Lauri Soivi, Joona Viertola, Samuel Kontiomaa
 * @version 1.0
 * @since 18.12.2013
 */

import tipi.bean.OrderForm;

public interface FormDAO {

	public abstract void saveOrderFormDAO(OrderForm orderForm, int userID, int userCompanyID);
	
}