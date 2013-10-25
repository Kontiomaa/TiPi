package tipi.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import tipi.bean.UserCompany;
import tipi.bean.UserCompanyImpl;
import tipi.bean.UserProfile;
import tipi.service.UserProfileService;

@Controller
@RequestMapping(value="/admin")
@SessionAttributes({"allUsers","allCompanies, modifyCompany"})
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
		List<UserProfile> users = userProfileService.getUsersByRole(1);
		model.addAttribute("users", users);
		return "admin/users";
	}
	
	@RequestMapping(value = "/admins", method = RequestMethod.GET)
	public String admins(Model model) {
		List<UserProfile> users = userProfileService.getUsersByRole(2);
		model.addAttribute("users", users);
		return "admin/admins";
	}
	
	@RequestMapping(value = "/companies", method = RequestMethod.GET)
	public String companies(Model model) {
		List<UserCompany> allCompanies = userProfileService.getAllCompanies();		
		return "admin/companies";
	}
	
	@RequestMapping(value = "/modifyCompany", method = RequestMethod.POST)
	public String modifyCompany(Model model, HttpServletRequest req) {
		UserCompany company = new UserCompanyImpl();
		company = userProfileService.getCompany(Integer.parseInt(req.getParameter("company_id")), company);
		model.addAttribute("modifyCompany", company);
		return "admin/modifyCompany";
	}
	
	@RequestMapping(value = "/saveModifiedCompany", method = RequestMethod.POST)
	public String saveModifiedCompany(@ModelAttribute(value = "modifyCompany") @Valid UserCompanyImpl company,
			BindingResult result) {
		if (result.hasErrors()) {
			return "admin/modifyCompany";
		} else {
			userProfileService.sendModifiedCompanyToDAO(company);
			return "redirect:/admin/companies";
		}	
	}
}
