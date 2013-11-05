package tipi.bean;

public class OrdersCountImpl implements OrdersCount {
	
	private int newOrdersCount;
	private int acceptedOrdersCount;
	private int takenOrdersCount;
	private int completedOrdersCount;
	
	public int getNewOrdersCount() {
		return newOrdersCount;
	}
	public void setNewOrdersCount(int newOrdersCount) {
		this.newOrdersCount = newOrdersCount;
	}
	public int getAcceptedOrdersCount() {
		return acceptedOrdersCount;
	}
	public void setAcceptedOrdersCount(int acceptedOrdersCount) {
		this.acceptedOrdersCount = acceptedOrdersCount;
	}
	public int getTakenOrdersCount() {
		return takenOrdersCount;
	}
	public void setTakenOrdersCount(int takenOrdersCount) {
		this.takenOrdersCount = takenOrdersCount;
	}
	public int getCompletedOrdersCount() {
		return completedOrdersCount;
	}
	public void setCompletedOrdersCount(int completedOrdersCount) {
		this.completedOrdersCount = completedOrdersCount;
	}
	@Override
	public String toString() {
		return "OrdersCountImpl [newOrdersCount=" + newOrdersCount
				+ ", acceptedOrdersCount=" + acceptedOrdersCount
				+ ", takenOrdersCount=" + takenOrdersCount
				+ ", completedOrdersCount=" + completedOrdersCount + "]";
	}
}
