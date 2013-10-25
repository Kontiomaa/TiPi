package tipi.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import tipi.bean.UserCompany;
import tipi.service.UserProfileService;

@Controller
@RequestMapping(value="/admin")
@SessionAttributes({"allUsers","allCompanies"})
public class UsersController {
	
	@Inject
	private UserProfileService userProfileService;
	
	public UserProfileService getUserProfileService() {
		return userProfileService;
	}

	public void setUserProfileService(UserProfileService userProfileService) {
		this.userProfileService = userProfileService;
	}
	
	@RequestMapping(value = "/users", method = RequestMethod.GET)
	public String users(Model model) {
		return "admin/users";
	}
	
	@RequestMapping(value = "/admins", method = RequestMethod.GET)
	public String admins(Model model) {
		return "admin/admins";
	}
	
	@RequestMapping(value = "/companies", method = RequestMethod.GET)
	public String companies(Model model) {
		List<UserCompany> allCompanies = userProfileService.getAllCompanies();		
		model.addAttribute("allCompanies", allCompanies);
		for (UserCompany userCompany : allCompanies) {
			System.out.println(userCompany.toString());
		}
		return "admin/companies";
	}
}
