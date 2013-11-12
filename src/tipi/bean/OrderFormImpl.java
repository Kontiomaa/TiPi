package tipi.bean;

import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.NotEmpty;

public class OrderFormImpl implements OrderForm {
	
	private int orders_id;
	
	//Car
	@NotEmpty(message="Tyhj‰")
	@Size(max=30,message="Liian pitk‰")
	private String carBrand;
	@NotEmpty(message="Tyhj‰")
	@Size(max=30,message="Liian pitk‰")
	private String carModel;
	@NotEmpty(message="Tyhj‰")
	@Size(max=30,message="Liian pitk‰")
	private String carRegister;
	@Size(max=30,message="Liian pitk‰")
	private String carColor;
	
	//Delivery
	//@CollectionDestinationTime(first = "collectionDate", second = "destinationDate")
	@Pattern(regexp = "\\d{2}[.]\\d{2}[.]\\d{4}",message="Valitse p‰iv‰m‰‰r‰")
	private String collectionDate;
	@Pattern(regexp = "\\d{2}[:]\\d{2}",message="Virheellinen Aika")
	private String collectionTimeFrom;
	@Pattern(regexp = "\\d{2}[:]\\d{2}",message="Virheellinen Aika")
	private String collectionTimeTo;
	@NotEmpty(message="Tyhj‰")
	@Size(max=30,message="Liian pitk‰")
	private String collectionAddress;
	@Pattern(regexp = "\\d{5}",message="Postinumeron pit‰‰ olla 5 numeroa")
	private String collectionPostalCode;
	@NotEmpty(message="Tyhj‰")
	@Size(max=30,message="Liian pitk‰")
	private String collectionCity;
	@Pattern(regexp = "\\d{2}[.]\\d{2}[.]\\d{4}",message="Valitse p‰iv‰m‰‰r‰")
	private String destinationDate;
	@Pattern(regexp = "\\d{2}[:]\\d{2}",message="Virheellinen Aika")
	private String destinationTime;
	@NotEmpty(message="Tyhj‰")
	@Size(max=30,message="Liian pitk‰")
	private String destinationAddress;
	@Pattern(regexp = "\\d{5}",message="Postinumeron pit‰‰ olla 5 numeroa")
	private String destinationPostalCode;
	@NotEmpty(message="Tyhj‰")
	@Size(max=30,message="Liian pitk‰")
	private String destinationCity;
	
	//Client
	@NotEmpty(message="Tyhj‰")
	@Size(max=30,message="Liian pitk‰")
	private String clientFname;
	@NotEmpty(message="Tyhj‰clientLname")
	@Size(max=30,message="Liian pitk‰")
	private String clientLname;
	@NotEmpty(message="Tyhj‰")
	@Size(max=30,message="Liian pitk‰")
	private String clientPhoneNo;
	@Size(max=30,message="Liian pitk‰")
	private String clientCompany;
	@Size(max=1000,message="Liian pitk‰")
	private String additionalInformation;
	
	//Return
	private boolean hasNewDestination;
	private String nextDestinationCollectionDate;
	private String nextDestinationCollectionTimeFrom;
	private String nextDestinationCollectionTimeTo;
	private String nextDestinationDate;
	private String nextDestinationTime;
	private String nextDestinationAddress;
	private String nextDestinationPostalCode;
	private String nextDestinationCity;
	private String nextAdditionalInformation;
	
	//Other
	private int companyMadeOrder;
	private int userMadeOrder;
	private String lastTimeEdited;
	private int statusOfOrder;
	private UserProfile userProfile;
	private int hasNewDestinationForSearchOrders;

	public int getOrders_id() {
		return orders_id;
	}

	public void setOrders_id(int orders_id) {
		this.orders_id = orders_id;
	}

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

	public String getCollectionTimeFrom() {
		return collectionTimeFrom;
	}

	public void setCollectionTimeFrom(String collectionTimeFrom) {
		this.collectionTimeFrom = collectionTimeFrom;
	}

	public String getCollectionTimeTo() {
		return collectionTimeTo;
	}

	public void setCollectionTimeTo(String collectionTimeTo) {
		this.collectionTimeTo = collectionTimeTo;
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

	public boolean isHasNewDestination() {
		return hasNewDestination;
	}

	public void setHasNewDestination(boolean hasNewDestination) {
		this.hasNewDestination = hasNewDestination;
	}

	public String getNextDestinationCollectionDate() {
		return nextDestinationCollectionDate;
	}

	public void setNextDestinationCollectionDate(
			String nextDestinationCollectionDate) {
		this.nextDestinationCollectionDate = nextDestinationCollectionDate;
	}

	public String getNextDestinationCollectionTimeFrom() {
		return nextDestinationCollectionTimeFrom;
	}

	public void setNextDestinationCollectionTimeFrom(
			String nextDestinationCollectionTimeFrom) {
		this.nextDestinationCollectionTimeFrom = nextDestinationCollectionTimeFrom;
	}

	public String getNextDestinationCollectionTimeTo() {
		return nextDestinationCollectionTimeTo;
	}

	public void setNextDestinationCollectionTimeTo(
			String nextDestinationCollectionTimeTo) {
		this.nextDestinationCollectionTimeTo = nextDestinationCollectionTimeTo;
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
	public int getCompanyMadeOrder() {
		return companyMadeOrder;
	}

	public void setCompanyMadeOrder(int companyMadeOrder) {
		this.companyMadeOrder = companyMadeOrder;
	}

	public int getUserMadeOrder() {
		return userMadeOrder;
	}

	public void setUserMadeOrder(int userMadeOrder) {
		this.userMadeOrder = userMadeOrder;
	}

	public String getLastTimeEdited() {
		return lastTimeEdited;
	}

	public void setLastTimeEdited(String lastTimeEdited) {
		this.lastTimeEdited = lastTimeEdited;
	}
	
	public int getStatusOfOrder() {
		return statusOfOrder;
	}

	public void setStatusOfOrder(int statusOfOrder) {
		this.statusOfOrder = statusOfOrder;
	}

	public UserProfile getUserProfile() {
		return userProfile;
	}

	public void setUserProfile(UserProfile userProfile) {
		this.userProfile = userProfile;
	}

	public int getHasNewDestinationForSearchOrders() {
		return hasNewDestinationForSearchOrders;
	}

	public void setHasNewDestinationForSearchOrders(
			int hasNewDestinationForSearchOrders) {
		this.hasNewDestinationForSearchOrders = hasNewDestinationForSearchOrders;
	}
	
}
