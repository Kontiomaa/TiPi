package tipi.bean;

import org.hibernate.validator.constraints.NotEmpty;

public class OrderFormImpl implements OrderForm {
	
	@NotEmpty
	private String carBrand;
	private String carModel;
	private String carRegister;
	private String carColor;
	
	private String collectionDate;
	private String collectionTime;
	private String collectionAddress;
	private String collectionPostalCode;
	
	private String collectionCity;
	private String destinationDate;
	private String destinationTime;
	private String destinationAddress;
	
	private String destinationPostalCode;
	private String destinationCity;
	private String clientFname;
	private String clientLname;
	
	private String clientPhoneNo;
	private String clientCompany;
	private String additionalInformation;
	private String nextDestinationCollectionDate;
	
	private String nextDestinationCollectionTime;
	private String nextDestinationDate;
	private String nextDestinationTime;
	private String nextDestinationAddress;
	
	private String nextDestinationPostalCode;
	private String nextDestinationCity;
	private String nextAdditionalInformation;
	
	public String getCarBrand() {
		return carBrand;
	}

	public void setCarBrand(String carBrand) {
		this.carBrand = carBrand;
	}

	public String getCarModel() {
		return carModel;
	}

	public void setCarModel(String carModel) {
		this.carModel = carModel;
	}
	
	public String getCarRegister() {
		return carRegister;
	}

	public void setCarRegister(String carRegister) {
		this.carRegister = carRegister;
	}
	
	public String getCarColor() {
		return carColor;
	}

	public void setCarColor(String carColor) {
		this.carColor = carColor;
	}

	public String getCollectionDate() {
		return collectionDate;
	}

	public void setCollectionDate(String collectionDate) {
		this.collectionDate = collectionDate;
	}

	public String getCollectionTime() {
		return collectionTime;
	}

	public void setCollectionTime(String collectionTime) {
		this.collectionTime = collectionTime;
	}

	public String getCollectionAddress() {
		return collectionAddress;
	}

	public void setCollectionAddress(String collectionAddress) {
		this.collectionAddress = collectionAddress;
	}

	public String getCollectionPostalCode() {
		return collectionPostalCode;
	}

	public void setCollectionPostalCode(String collectionPostalCode) {
		this.collectionPostalCode = collectionPostalCode;
	}

	public String getCollectionCity() {
		return collectionCity;
	}

	public void setCollectionCity(String collectionCity) {
		this.collectionCity = collectionCity;
	}

	public String getDestinationDate() {
		return destinationDate;
	}

	public void setDestinationDate(String destinationDate) {
		this.destinationDate = destinationDate;
	}

	public String getDestinationTime() {
		return destinationTime;
	}

	public void setDestinationTime(String destinationTime) {
		this.destinationTime = destinationTime;
	}

	public String getDestinationAddress() {
		return destinationAddress;
	}

	public void setDestinationAddress(String destinationAddress) {
		this.destinationAddress = destinationAddress;
	}

	public String getDestinationPostalCode() {
		return destinationPostalCode;
	}

	public void setDestinationPostalCode(String destinationPostalCode) {
		this.destinationPostalCode = destinationPostalCode;
	}

	public String getDestinationCity() {
		return destinationCity;
	}

	public void setDestinationCity(String destinationCity) {
		this.destinationCity = destinationCity;
	}

	public String getClientFname() {
		return clientFname;
	}

	public void setClientFname(String clientFname) {
		this.clientFname = clientFname;
	}

	public String getClientLname() {
		return clientLname;
	}

	public void setClientLname(String clientLname) {
		this.clientLname = clientLname;
	}

	public String getClientPhoneNo() {
		return clientPhoneNo;
	}

	public void setClientPhoneNo(String clientPhoneNo) {
		this.clientPhoneNo = clientPhoneNo;
	}

	public String getClientCompany() {
		return clientCompany;
	}

	public void setClientCompany(String clientCompany) {
		this.clientCompany = clientCompany;
	}

	public String getAdditionalInformation() {
		return additionalInformation;
	}

	public void setAdditionalInformation(String additionalInformation) {
		this.additionalInformation = additionalInformation;
	}

	public String getNextDestinationCollectionDate() {
		return nextDestinationCollectionDate;
	}

	public void setNextDestinationCollectionDate(
			String nextDestinationCollectionDate) {
		this.nextDestinationCollectionDate = nextDestinationCollectionDate;
	}

	public String getNextDestinationCollectionTime() {
		return nextDestinationCollectionTime;
	}

	public void setNextDestinationCollectionTime(
			String nextDestinationCollectionTime) {
		this.nextDestinationCollectionTime = nextDestinationCollectionTime;
	}

	public String getNextDestinationDate() {
		return nextDestinationDate;
	}

	public void setNextDestinationDate(String nextDestinationDate) {
		this.nextDestinationDate = nextDestinationDate;
	}

	public String getNextDestinationTime() {
		return nextDestinationTime;
	}

	public void setNextDestinationTime(String nextDestinationTime) {
		this.nextDestinationTime = nextDestinationTime;
	}

	public String getNextDestinationAddress() {
		return nextDestinationAddress;
	}

	public void setNextDestinationAddress(String nextDestinationAddress) {
		this.nextDestinationAddress = nextDestinationAddress;
	}

	public String getNextDestinationPostalCode() {
		return nextDestinationPostalCode;
	}

	public void setNextDestinationPostalCode(String nextDestinationPostalCode) {
		this.nextDestinationPostalCode = nextDestinationPostalCode;
	}

	public String getNextDestinationCity() {
		return nextDestinationCity;
	}

	public void setNextDestinationCity(String nextDestinationCity) {
		this.nextDestinationCity = nextDestinationCity;
	}

	public String getNextAdditionalInformation() {
		return nextAdditionalInformation;
	}

	public void setNextAdditionalInformation(String nextAdditionalInformation) {
		this.nextAdditionalInformation = nextAdditionalInformation;
	}
}
