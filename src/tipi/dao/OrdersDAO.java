package tipi.dao;

import java.sql.Date;
import java.util.List;
import java.util.Map;

import tipi.bean.OrderForm;
import tipi.bean.OrdersCount;

public interface OrdersDAO {

	public abstract List<OrderForm> getOrderList(int statusOfOrder);

	public abstract OrderForm getOrderBean(int id);
	
	public abstract void updateOrderStatusDAO(int orders_id, int statusOfOrder);
	
	public abstract List<OrderForm> getOrderListForUser(String userEmail);
	
	public abstract OrdersCount ordersCountDAO(OrdersCount ordersCount);
	
	public abstract Map<String, Object> getOrdeDatesAndTimes(int id);
	
	public abstract List<OrderForm> searchOrdersFromDAO(OrderForm searchOrders);
	
	public abstract void deleteOrder(int id);
	
	public abstract boolean updateOrderByUser(String carBrand, String carModel, String carRegister, String carColor, Date collectionDate, String collectionTime, String collectionAddress, String collectionPostalCode, String collectionCity, Date destinationDate, String destinationTime, String destinationAddress, String destinationPostalCode, String destinationCity, String clientFname, String clientLname, String clientPhoneNo, String clientCompany, String additionalInformation, String hasNewDestination, Date nextDestinationCollectionDate, String nextDestinationCollectionTime, Date nextDestinationDate, String nextDestinationTime, String nextDestinationAddress, String nextDestinationPostalCode, String nextDestinationCity, String nextAdditionalInformation, String orders_id);

}
