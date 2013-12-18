package tipi.bean;

/**
 * @author Lauri Soivi, Joona Viertola, Samuel Kontiomaa
 * @version 1.0
 * @since 18.12.2013
 */

public interface UserProfile {
	
	public abstract int getUser_id();

	public abstract void setUser_id(int user_id);
	
	public abstract String getfName();
	
	public abstract void setfName(String fName);
	
	public abstract String getlName();
	
	public abstract void setlName(String lName);
	
	public abstract String getPhoneNo();
	
	public abstract void setPhoneNo(String phoneNo);
	
	public abstract String getEmail();
	
	public abstract void setEmail(String email);
	
	public abstract String getPassword();

	public abstract void setPassword(String password);
	
	public boolean isUserIsActive();
	
	public void setUserIsActive(boolean userIsActive);
	
	public abstract int getMyRole();
	
	public abstract void setMyRole(int myRole);
	
	public abstract int getMyCompany();
	
	public abstract void setMyCompany(int myCompany);
	
	public abstract UserCompany getCompany();
	
	public abstract void setCompany(UserCompany company);
	
	public abstract String toString();
	
}
