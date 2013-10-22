package tipi.bean;

import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.NotEmpty;

public class UserProfileImpl implements UserProfile {
	
	private int user_id;
	@NotEmpty(message="Tyhjä")
	@Size(max=30,message="Liian pitkä")
	private String fName;
	@NotEmpty(message="Tyhjä")
	@Size(max=30,message="Liian pitkä")
	private String lName;
	@NotEmpty(message="Tyhjä")
	@Size(max=30,message="Liian pitkä")
	private String phoneNo;
	@NotEmpty(message="Tyhjä")
	@Size(max=40,message="Liian pitkä")
	private String email;
	private String password;
	private boolean isActive;
	private int myRole;
	private int myCompany;
	private UserCompany company;
	
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public String getfName() {
		return fName;
	}
	public void setfName(String fName) {
		this.fName = fName;
	}
	public String getlName() {
		return lName;
	}
	public void setlName(String lName) {
		this.lName = lName;
	}
	public String getPhoneNo() {
		return phoneNo;
	}
	public void setPhoneNo(String phoneNo) {
		this.phoneNo = phoneNo;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public boolean isActive() {
		return isActive;
	}
	public void setActive(boolean isActive) {
		this.isActive = isActive;
	}
	public int getMyRole() {
		return myRole;
	}
	public void setMyRole(int myRole) {
		this.myRole = myRole;
	}
	public int getMyCompany() {
		return myCompany;
	}
	public void setMyCompany(int myCompany) {
		this.myCompany = myCompany;
	}
	
	public UserCompany getCompany() {
		return company;
	}
	public void setCompany(UserCompany company) {
		this.company = company;
	}
	
	@Override
	public String toString() {
		return "UserProfileImpl [user_id=" + user_id + ", fName=" + fName
				+ ", lName=" + lName + ", phoneNo=" + phoneNo + ", email="
				+ email + ", isActive=" + isActive
				+ ", myRole=" + myRole + ", myCompany=" + myCompany + "]";
	}
	
}
