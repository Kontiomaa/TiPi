package tipi.dao;

import java.util.List;

import tipi.bean.OrderForm;

public interface OrdersDAO {

	public abstract List<OrderForm> getOrderList();

	public abstract OrderForm getOrderBean(int id);

}
