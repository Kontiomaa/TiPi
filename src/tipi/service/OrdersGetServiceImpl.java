package tipi.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import tipi.bean.OrderForm;
import tipi.dao.OrdersDAO;

@Service
public class OrdersGetServiceImpl implements OrdersGetService {

	@Inject
    private OrdersDAO ordersDAO;
    
    public OrdersDAO getOrdersDAO() {
            return ordersDAO;
    }

    public void setOrderDAO(OrdersDAO ordersDAO) {
            this.ordersDAO = ordersDAO;
    }
    
    public OrderForm getOrderFromDAO(int id) {
    	OrderForm order = ordersDAO.getOrderBean(id);
    	return order;
    }
    
    public List<OrderForm> getOrderListFromDAO() {
    	List<OrderForm> allOrders = ordersDAO.getOrderList();
    	return allOrders;
    }
	
}