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
@SessionAttributes({"registerUser","registerCompany","allCompanies", "pageIdentifier"})
public class RegisterUserController {
	
	boolean newUserAdded=false;
	boolean newCompanyAdded=false;
	
	@Inject
	private UserProfileService userProfileService;
	
	public UserProfileService getUserProfileService() {
		return userProfileService;
	}
	
	public void setUserProfileService(UserProfileService userProfileService) {
		this.userProfileService = userProfileService;
	}
	
	
	@RequestMapping(value = "/registerEmptyUser", method = RequestMethod.GET)
	public String getEmptyUser(Model model) {
		UserProfile registerUser = new UserProfileImpl();
		model.addAttribute("registerUser", registerUser);
		return "redirect:/admin/registerNewUser";
	}
	
	@RequestMapping(value = "/registerNewUser", method = RequestMethod.GET)
	public String registerNewUser(Model model) {
		model.addAttribute("pageIdentifier", "register");
		if (!model.containsAttribute("registerUser")) {
			return "redirect:/admin/registerEmptyUser";
		}
		List<UserCompany> allCompanies = userProfileService.getAllCompanies();		
		model.addAttribute("allCompanies", allCompanies);
		if(newUserAdded){
			model.addAttribute("registerNewUserSuccessful", "true");
		}
		newUserAdded=false;
		
		return "admin/registerNewUser";
	}
	
	@RequestMapping(value = "/registerNewUser", method = RequestMethod.POST)
	public String getUserConfirmation(
			@ModelAttribute(value = "registerUser") @Valid UserProfileImpl registerUser,
			BindingResult result, Model model) {
		SecureRandom random = new SecureRandom();
		String generatedPassword = new BigInteger(50, random).toString(20);
		model.addAttribute("generatedPassword", generatedPassword);
		
		if (result.hasErrors()) {
			return "/admin/registerNewUser";
		} else {
			return "/admin/confirmationNewUser";
		}
	}
	
	@RequestMapping(value = "registerNewUserSend", method = RequestMethod.POST)
	public String registerNewUserSend(@ModelAttribute(value = "registerUser") @Valid UserProfileImpl registerUser,
			BindingResult result, HttpServletRequest req) {
		StandardPasswordEncoder spe = new StandardPasswordEncoder();
		registerUser.setPassword(spe.encode(req.getParameter("password"))); //Password is now encrypted for safety
		userProfileService.sendNewUserToDAO(registerUser);
		newUserAdded=true;
		return "redirect:/admin/registerEmptyUser";
	}
	
	
	
	@RequestMapping(value = "/registerEmptyCompany", method = RequestMethod.GET)
	public String getCompanyUser(Model model) {
		UserCompany registerCompany = new UserCompanyImpl();
		model.addAttribute("registerCompany", registerCompany);
		
		return "redirect:/admin/registerNewCompany";
	}
	
	@RequestMapping(value = "/registerNewCompany", method = RequestMethod.GET)
	public String registerNewCompany(Model model) {
		if (!model.containsAttribute("registerCompany")) {
			return "redirect:/admin/registerEmptyCompany";
		}
		if(newCompanyAdded){
			model.addAttribute("registerNewCompanySuccessful", "true");
		}
		newCompanyAdded=false;
		
		return "admin/registerNewCompany";
	}
	
	@RequestMapping(value = "/registerNewCompany", method = RequestMethod.POST)
	public String getCompanyConfirmation(
			@ModelAttribute(value = "registerCompany") @Valid UserCompanyImpl registerCompany,
			BindingResult result) {

		if (result.hasErrors()) {
			return "/admin/registerNewCompany";
		} else {
			return "/admin/confirmationNewCompany";
		}
	}
	
	@RequestMapping(value = "registerNewCompanySend", method = RequestMethod.POST)
	public String registerNewCompanySend(@ModelAttribute(value = "registerCompany") @Valid UserCompanyImpl registerCompany,
			BindingResult result) {
		userProfileService.sendNewCompanyToDAO(registerCompany);
		newCompanyAdded=true;
		return "redirect:/admin/registerEmptyCompany";
	}

}
