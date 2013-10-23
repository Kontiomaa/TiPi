package tipi.service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import tipi.bean.OrderForm;
import tipi.bean.UserCompany;
import tipi.bean.UserCompanyImpl;
import tipi.bean.UserProfile;
import tipi.bean.UserProfileImpl;
import tipi.dao.OrdersDAO;
import tipi.dao.UserDAO;

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
	
	@Inject
	private UserDAO userDao;
	
	public UserDAO getUserDao() {
		return userDao;
	}
	
	public void setUserDao(UserDAO userDao) {
		this.userDao = userDao;
	}

	@Override
	public OrderForm getOrderFromDAO(int id) {
		OrderForm order = ordersDAO.getOrderBean(id);
		order = parseMySQLToJavaDate(order);
		order = parseMySQLToJavaTime(order);
		order = parseMySQLToJavaTimeStamp(order);
		UserProfile userProfile = new UserProfileImpl();
		userProfile = userDao.getUsersInformationWithIdDAO(order.getUserMadeOrder(), userProfile);
		UserCompany userCompany = new UserCompanyImpl();
		userCompany = userDao.getRegisteredUsersCompanyInformationDAO(userProfile.getMyCompany(), userCompany);
		userProfile.setCompany(userCompany);
		order.setUserProfile(userProfile);
		
		return order;
	}

	@Override
	public List<OrderForm> getOrderListFromDAO(int statusOfOrder) {
		List<OrderForm> allOrders = ordersDAO.getOrderList(statusOfOrder);
		for (OrderForm order : allOrders) {
			order = parseMySQLToJavaDate(order);
			order = parseMySQLToJavaTime(order);
			order = parseMySQLToJavaTimeStamp(order);
			UserProfile userProfile = new UserProfileImpl();
			userProfile = userDao.getUsersInformationWithIdDAO(order.getUserMadeOrder(), userProfile);
			UserCompany userCompany = new UserCompanyImpl();
			userCompany = userDao.getRegisteredUsersCompanyInformationDAO(userProfile.getMyCompany(), userCompany);
			userProfile.setCompany(userCompany);
			order.setUserProfile(userProfile);
		}
		return allOrders;
	}
	
	@Override
	public void updateOrderStatus(int orders_id, int statusOfOrder) {
		ordersDAO.updateOrderStatusDAO(orders_id, statusOfOrder);
	}

	@Override
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
	
	@Override
	public OrderForm parseMySQLToJavaTime(OrderForm order) {
		SimpleDateFormat oldFormat = new SimpleDateFormat("HH:mm:ss");
		SimpleDateFormat newFormat = new SimpleDateFormat("HH:mm");

		try {
			order.setCollectionTime(newFormat.format(oldFormat.parse(order
					.getCollectionTime())));
			order.setDestinationTime(newFormat.format(oldFormat.parse(order
					.getDestinationTime())));
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		if (order.getNextDestinationCollectionTime() != null) {
			try {
				order.setNextDestinationCollectionTime(newFormat
						.format(oldFormat.parse(order
								.getNextDestinationCollectionTime())));
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		if (order.getNextDestinationTime() != null) {
			try {
				order.setNextDestinationTime(newFormat.format(oldFormat
						.parse(order.getNextDestinationTime())));
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return order;
	}
	
	@Override
	public OrderForm parseMySQLToJavaTimeStamp(OrderForm order) {
		SimpleDateFormat oldFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.S");
		SimpleDateFormat newFormat = new SimpleDateFormat("dd.MM.yyyy HH:mm");

		try {
			order.setLastTimeEdited(newFormat.format(oldFormat.parse(order
					.getLastTimeEdited())));
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return order;
	}
}