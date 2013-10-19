package tipi.bean;

public class UserProfileImpl implements UserProfile {
	
	private int user_id;
	private String fName;
	private String lName;
	private String phoneNo;
	private String email;
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
