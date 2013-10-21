package tipi.dao;

import tipi.bean.OrderForm;

public interface FormDAO {

	public abstract void saveOrderFormDAO(OrderForm orderForm, int userID, int userCompanyID);
	
}