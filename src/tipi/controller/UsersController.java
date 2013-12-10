package tipi.controller;

import java.math.BigInteger;
import java.security.SecureRandom;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.security.crypto.password.StandardPasswordEncoder;
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
import tipi.bean.UserProfileImpl;
import tipi.service.UserProfileService;

@Controller
@RequestMapping(value="/admin")
@SessionAttributes({"allUsers","allCompanies, modifyCompany, modifyUser", "pageIdentifier"})
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
		model.addAttribute("pageIdentifier", "users");
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
		model.addAttribute("allCompanies", allCompanies);
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
			userProfileService.sendModifiedCompany(company);
			return "redirect:/admin/companies";
		}	
	}
	
	@RequestMapping(value = "/modifyUser", method = RequestMethod.POST)
	public String modifyUser(Model model, HttpServletRequest req) {
		UserProfile user = new UserProfileImpl();
		user = userProfileService.getUserById(Integer.parseInt(req.getParameter("user_id")), user);
		model.addAttribute("modifyUser", user);
		List<UserCompany> allCompanies = userProfileService.getAllCompanies();
		model.addAttribute("allCompanies", allCompanies);
		return "admin/modifyUser";
	}
	
	@RequestMapping(value = "/saveModifiedUser", method = RequestMethod.POST)
	public String saveModifiedUser(@ModelAttribute(value = "modifyUser") @Valid UserProfileImpl user,
			BindingResult result, Model model, HttpServletRequest req) {
		if (result.hasErrors()) {
			List<UserCompany> allCompanies = userProfileService.getAllCompanies();
			model.addAttribute("allCompanies", allCompanies);
			return "admin/modifyUser";
		} else if (Boolean.parseBoolean(req.getParameter("changeUserIsActiveStatus")) == true) {
			userProfileService.changeUserIsActiveStatus(user);
		} else {
			userProfileService.sendModifiedUser(user);
		}	
		if(user.getMyRole() == 2) {
			return "redirect:/admin/admins";
		}
		return "redirect:/admin/users";
	}
	
	@RequestMapping(value = "/modifyUserResetPassword", method = RequestMethod.POST)
	public String modifyUserResetPassword(Model model, HttpServletRequest req) {
		int user_id = Integer.parseInt(req.getParameter("user_id"));
		String email = req.getParameter("email");
		SecureRandom random = new SecureRandom();
		String newPassword = new BigInteger(50, random).toString(20);
		
		StandardPasswordEncoder spe = new StandardPasswordEncoder();
		String cryptedPassword=spe.encode(newPassword);
		
		model.addAttribute("email", email);
		model.addAttribute("newPassword", newPassword);
		userProfileService.sendNewPasswordToDao(user_id, cryptedPassword);
		return "/admin/passwordReseted";
	}
}
