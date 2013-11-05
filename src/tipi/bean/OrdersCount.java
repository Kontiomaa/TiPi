package tipi.bean;

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
