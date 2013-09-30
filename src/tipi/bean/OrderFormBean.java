package tipi.bean;

public interface OrderFormBean {
	
	//Car
	public abstract String getCarBrand();

	public abstract void setCarBrand(String carBrand);
	
	public abstract String getCarModel();

	public abstract void setCarModel(String carModel);
	
	public abstract String getCarRegister();

	public abstract void setCarRegister(String carRegister);
	
	public abstract String getCarColor();

	public abstract void setCarColor(String carColor);
	
	
	//Delivery
	public abstract String getCollectionDate();

	public abstract void setCollectionDate(String collectionDate);
	
	public abstract String getCollectionTime();

	public abstract void setCollectionTime(String collectionTime);
	
	public abstract String getCollectionAddress();

	public abstract void setCollectionAddress(String collectionAddress);
	
	public abstract String getCollectionPostalCode();

	public abstract void setCollectionPostalCode(String collectionPostalCode);
	
	public abstract String getCollectionCity();

	public abstract void setCollectionCity(String collectionCity);
	
	public abstract String getDestinationDate();

	public abstract void setDestinationDate(String destinationDate);
	
	public abstract String getDestinationTime();

	public abstract void setDestinationTime(String destinationTime);
	
	public abstract String getDestinationAddress();

	public abstract void setDestinationAddress(String destinationAddress);

	
	
	
	public abstract String getDestinationPostalCode();

	public abstract void setDestinationPostalCode(String destinationPostalCode);
	
	public abstract String getDestinationCity();

	public abstract void setDestinationCity(String destinationCity);
	
	
	//Client
	public abstract String getClientFname();

	public abstract void setClientFname(String clientFname);
	
	public abstract String getClientLname();

	public abstract void setClientLname(String clientLname);

	public abstract String getClientPhoneNo();

	public abstract void setClientPhoneNo(String clientPhoneNo);
	
	public abstract String getClientCompany();

	public abstract void setClientCompany(String clientCompany);
	
	public abstract String getAdditionalInformation();

	public abstract void setAdditionalInformation(String additionalInformation);
	
	//Return
	public abstract String getNextDestinationCollectionDate();

	public abstract void setNextDestinationCollectionDate(String nextDestinationCollectionDate);

	public abstract String getNextDestinationCollectionTime();

	public abstract void setNextDestinationCollectionTime(String nextDestinationCollectionTime);
	
	public abstract String getNextDestinationDate();

	public abstract void setNextDestinationDate(String nextDestinationDate);
	
	public abstract String getNextDestinationTime();

	public abstract void setNextDestinationTime(String nextDestinationTime);
	
	public abstract String getNextDestinationAddress();

	public abstract void setNextDestinationAddress(String nextDestinationAddress);

	public abstract String getNextDestinationPostalCode();

	public abstract void setNextDestinationPostalCode(String nextDestinationPostalCode);
	
	public abstract String getNextDestinationCity();

	public abstract void setNextDestinationCity(String nextDestinationCity);
	
	public abstract String getNextAdditionalInformation();

	public abstract void setNextAdditionalInformation(String nextAdditionalInformation);
		
}
