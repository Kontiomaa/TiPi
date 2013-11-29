package tipi.bean;

import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.NotEmpty;

public class UserCompanyImpl implements UserCompany {

	private int company_id;
	@NotEmpty(message="Lisää nimi")
	@Size(max=30,message="Nimi on liian pitkä")
	private String name;
	@NotEmpty(message="Lisää osoite")
	@Size(max=30,message="Liian pitkä osoite")
	private String address;
	@Pattern(regexp = "\\d{5}",message="Postinumeron pitää olla 5 numeroinen")
	private String postalCode;
	@NotEmpty(message="Lisää kaupunki")
	@Size(max=30,message="Kaupunki on liian pitkä")
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
