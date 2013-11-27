package tipi.bean;

public class DateTimeCheckImpl implements DateTimeCheck {
	
	private boolean everythingOk;

	private boolean valueNullNextDestinationCollectionDate;
	private boolean valueNullNextDestinationCollectionTime;
	
	private boolean valueNullNextDestinationDate;
	private boolean valueNullNextDestinationTime;
	
	private boolean collectionBeforeDestination;
	private boolean destinationBeforeNextCollection;
	private boolean nextCollectionBeforeNextDestination;
	
	//Constructor
	public DateTimeCheckImpl() {
		this.everythingOk = true;
		this.valueNullNextDestinationCollectionDate = false;
		this.valueNullNextDestinationCollectionTime = false;
		this.valueNullNextDestinationDate = false;
		this.valueNullNextDestinationTime = false;
		this.collectionBeforeDestination = true;
		this.destinationBeforeNextCollection = true;
		this.nextCollectionBeforeNextDestination = true;
	}
	//getters & setters
	public boolean isEverythingOk() {
		return everythingOk;
	}
	
	public void setEverythingOk(boolean everythingOk) {
		this.everythingOk = everythingOk;
	}
	
	public boolean isValueNullNextDestinationCollectionDate() {
		return valueNullNextDestinationCollectionDate;
	}
	public void setValueNullNextDestinationCollectionDate(
			boolean valueNullNextDestinationCollectionDate) {
		this.valueNullNextDestinationCollectionDate = valueNullNextDestinationCollectionDate;
	}
	public boolean isValueNullNextDestinationCollectionTime() {
		return valueNullNextDestinationCollectionTime;
	}
	public void setValueNullNextDestinationCollectionTime(
			boolean valueNullNextDestinationCollectionTime) {
		this.valueNullNextDestinationCollectionTime = valueNullNextDestinationCollectionTime;
	}
	public boolean isValueNullNextDestinationDate() {
		return valueNullNextDestinationDate;
	}
	public void setValueNullNextDestinationDate(boolean valueNullNextDestinationDate) {
		this.valueNullNextDestinationDate = valueNullNextDestinationDate;
	}
	public boolean isValueNullNextDestinationTime() {
		return valueNullNextDestinationTime;
	}
	public void setValueNullNextDestinationTime(boolean valueNullNextDestinationTime) {
		this.valueNullNextDestinationTime = valueNullNextDestinationTime;
	}
	public boolean isCollectionBeforeDestination() {
		return collectionBeforeDestination;
	}
	public void setCollectionBeforeDestination(boolean collectionBeforeDestination) {
		this.collectionBeforeDestination = collectionBeforeDestination;
	}
	public boolean isDestinationBeforeNextCollection() {
		return destinationBeforeNextCollection;
	}
	public void setDestinationBeforeNextCollection(
			boolean destinationBeforeNextCollection) {
		this.destinationBeforeNextCollection = destinationBeforeNextCollection;
	}
	public boolean isNextCollectionBeforeNextDestination() {
		return nextCollectionBeforeNextDestination;
	}
	public void setNextCollectionBeforeNextDestination(
			boolean nextCollectionBeforeNextDestination) {
		this.nextCollectionBeforeNextDestination = nextCollectionBeforeNextDestination;
	}
}
