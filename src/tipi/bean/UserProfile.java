package tipi.bean;

public interface UserProfile {
	
	public String getId();
	
	public void setId(String id);
	
	public abstract String getfName();
	
	public abstract void setfName(String fName);
	
	public abstract String getlName();
	
	public abstract void setlName(String lName);
	
	public abstract String getPhoneNo();
	
	public abstract void setPhoneNo(String phoneNo);
	
	public abstract String getEmail();
	
	public abstract void setEmail(String email);
	
	public abstract String getUsername();
	
	public abstract void setUsername(String username);
	
	public abstract UserCompany getCompany();
	
	public abstract void setCompany(UserCompany company);
}
