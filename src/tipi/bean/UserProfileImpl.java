package tipi.bean;

/**
 * @author Lauri Soivi, Joona Viertola, Samuel Kontiomaa
 * @version 1.0
 * @since 18.12.2013
 */

import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.NotEmpty;

public class UserProfileImpl implements UserProfile {
	
	private int user_id;
	@NotEmpty(message="Lisää etunimi")
	@Size(max=30,message="Etunimi liian pitkä")
	private String fName;
	@NotEmpty(message="Lisää sukunimi")
	@Size(max=30,message="Sukunimi liian pitkä")
	private String lName;
	@NotEmpty(message="Lisää puhelinnumero")
	@Size(max=30,message="Puhelinnumero on liian pitkä")
	private String phoneNo;
	@NotEmpty(message="Lisää sähköposti")
	@Size(max=40,message="Sähköposti liian pitkä")
	private String email;
	private String password;
	private boolean userIsActive;
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
	public boolean isUserIsActive() {
		return userIsActive;
	}
	public void setUserIsActive(boolean userIsActive) {
		this.userIsActive = userIsActive;
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
				+ email + ", password=" + password + ", userIsActive="
				+ userIsActive + ", myRole=" + myRole + ", myCompany="
				+ myCompany + ", company=" + company + "]";
	}
}
