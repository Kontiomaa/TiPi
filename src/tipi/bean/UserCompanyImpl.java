package tipi.bean;

public class UserCompanyImpl implements UserCompany {

	private int company_id;
	private String name;
	private String address;
	private String postalCode;
	private String city;
	
	public int getCompany_id() {
		return company_id;
	}
	public void setCompany_id(int company_id) {
		this.company_id = company_id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getPostalCode() {
		return postalCode;
	}
	public void setPostalCode(String postalCode) {
		this.postalCode = postalCode;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	@Override
	public String toString() {
		return "UserCompanyImpl [company_id=" + company_id + ", name=" + name
				+ ", address=" + address + ", postalCode=" + postalCode
				+ ", city=" + city + "]";
	}
	
	
	
}
