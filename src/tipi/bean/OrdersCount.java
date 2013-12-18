package tipi.bean;

/**
 * @author Lauri Soivi, Joona Viertola, Samuel Kontiomaa
 * @version 1.0
 * @since 18.12.2013
 */

public interface OrdersCount {
	
	public abstract int getNewOrdersCount();
	
	public abstract void setNewOrdersCount(int newOrdersCount);
	
	public abstract int getAcceptedOrdersCount();
	
	public abstract void setAcceptedOrdersCount(int acceptedOrdersCount);
	
	public abstract int getTakenOrdersCount();
	
	public abstract void setTakenOrdersCount(int takenOrdersCount);
	
	public abstract int getCompletedOrdersCount();
	
	public abstract void setCompletedOrdersCount(int completedOrdersCount);
}
