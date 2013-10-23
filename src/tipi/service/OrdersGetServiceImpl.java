package tipi.service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
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
		order = parseMySQLToJavaDate(order);
		return order;
	}

	public List<OrderForm> getOrderListFromDAO(int statusOfOrder) {
		List<OrderForm> allOrders = ordersDAO.getOrderList(statusOfOrder);
		for (OrderForm order : allOrders) {
			order = parseMySQLToJavaDate(order);
		}
		return allOrders;
	}

	public OrderForm parseMySQLToJavaDate(OrderForm order) {
		SimpleDateFormat oldFormat = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat newFormat = new SimpleDateFormat("dd.MM.yyyy");

		try {
			order.setCollectionDate(newFormat.format(oldFormat.parse(order
					.getCollectionDate())));
			order.setDestinationDate(newFormat.format(oldFormat.parse(order
					.getDestinationDate())));
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		if (order.getNextDestinationCollectionDate() != null) {
			try {
				order.setNextDestinationCollectionDate(newFormat
						.format(oldFormat.parse(order
								.getNextDestinationCollectionDate())));
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		if (order.getNextDestinationDate() != null) {
			try {
				order.setNextDestinationDate(newFormat.format(oldFormat
						.parse(order.getNextDestinationDate())));
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return order;
	}

}