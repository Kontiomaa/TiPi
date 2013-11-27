package tipi.bean;

public interface DateTimeCheck {
	
	public abstract boolean isEverythingOk();
	public abstract void setEverythingOk(boolean everythingOk);
	
	//Check null
	
	public abstract boolean isValueNullNextDestinationCollectionDate();
	public abstract void setValueNullNextDestinationCollectionDate(boolean valueNullNextDestinationCollectionDate);
	
	public abstract boolean isValueNullNextDestinationCollectionTime();
	public abstract void setValueNullNextDestinationCollectionTime(boolean valueNullNextDestinationCollectionTime);
	
	public abstract boolean isValueNullNextDestinationDate();
	public abstract void setValueNullNextDestinationDate(boolean valueNullNextDestinationDate);
	
	public abstract boolean isValueNullNextDestinationTime();
	public abstract void setValueNullNextDestinationTime(boolean valueNullNextDestinationTime);
	
	//Check if dateTimes are in correct order
	
	public abstract boolean isCollectionBeforeDestination();
	public abstract void setCollectionBeforeDestination(boolean collectionBeforeDestination);
	
	public abstract boolean isDestinationBeforeNextCollection();
	public abstract void setDestinationBeforeNextCollection(boolean destinationBeforeNextCollection);
	
	public abstract boolean isNextCollectionBeforeNextDestination();
	public abstract void setNextCollectionBeforeNextDestination(boolean nextCollectionBeforeNextDestination);
	
	public boolean isNextDestinationAddressEmpty();
	public void setNextDestinationAddressEmpty(boolean nextDestinationAddressEmpty);
	
	public boolean isNextDestinationPostalCodeEmpty();
	public void setNextDestinationPostalCodeEmpty(
			boolean nextDestinationPostalCodeEmpty);
	
	public boolean isNextDestinationCityEmpty();
	public void setNextDestinationCityEmpty(boolean nextDestinationCityEmpty);
	
	public boolean isNextDestinationAddressTooLong();
	public void setNextDestinationAddressTooLong(
			boolean nextDestinationAddressTooLong);
	
	public boolean isNextDestinationPostalCodeIsNotValid();
	
	public void setNextDestinationPostalCodeIsNotValid(
			boolean nextDestinationPostalCodeIsNotValid);
	
	public boolean isNextDestinationCityTooLong();
	public void setNextDestinationCityTooLong(boolean nextDestinationCityTooLong);
}
