package tipi.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.security.crypto.password.StandardPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import tipi.bean.UserProfileImpl;
import tipi.service.UserProfileService;


@Controller
@RequestMapping(value = "/user")
@SessionAttributes("userProfile")
public class UserProfileController {

	@RequestMapping(value = "/profile", method = RequestMethod.GET)
	public String profile(Model model) {
		return "/user/profile";
	}
	
	@Inject
	private UserProfileService userProfileService;
	
	public UserProfileService getUserProfileService() {
		return userProfileService;
	}

	public void setUserProfileService(UserProfileService userProfileService) {
		this.userProfileService = userProfileService;
	}
	
	@RequestMapping(value = "/changePassword", method = RequestMethod.POST)
	public String changePassword(Model model, HttpServletRequest req, @ModelAttribute(value = "userProfile") UserProfileImpl userProfile) {
		
		StandardPasswordEncoder spe = new StandardPasswordEncoder();
		String newPassword=spe.encode(req.getParameter("newPassword"));
		
		boolean correctPassword = spe.matches(req.getParameter("oldPassword"), userProfile.getPassword());
		
		if(correctPassword){
			String email = userProfile.getEmail();
			userProfileService.sendNewPasswordToDao(email, newPassword);
		}
		else
		{
			System.out.println("Wrong password!");
		}
		
		return "/user/profile";
	}
}
