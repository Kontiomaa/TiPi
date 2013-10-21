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

import tipi.bean.UserProfile;
import tipi.bean.UserProfileImpl;
import tipi.service.UserProfileService;


@Controller
@RequestMapping(value = "/user")
@SessionAttributes("userProfile")
public class UserProfileController {

	@RequestMapping(value = "/profile", method = RequestMethod.GET)
	public String profile(Model model, @ModelAttribute(value = "userProfile") UserProfileImpl juuseri) {
		//tuhoa t‰m‰ sysoon asti!
		System.out.println("salis ennen vaihtotoimenpiteit‰ "+juuseri.getPassword());
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
		System.out.println("Controller: "+req.getParameter("oldPassword"));
		System.out.println(req.getParameter("newPassword"));
		
		
		
		StandardPasswordEncoder spe = new StandardPasswordEncoder();
		String newPassword=spe.encode(req.getParameter("newPassword")); //Password is now encrypted for safety
		System.out.println("New password encrypted: "+newPassword);
		
		//TODO check how to see if the old password matches the written one... Can I use the same field as when users are logging in?

		//if correct send the new password to dao in order to get it into the database
		
		System.out.println(req.getParameter("oldPassword"));
		System.out.println(userProfile.getPassword());
		
		boolean correctPassword = spe.matches(req.getParameter("oldPassword"), userProfile.getPassword());
		System.out.println(correctPassword);
		if(correctPassword){
			String email = userProfile.getEmail();
			System.out.println("Email: " +email);
			userProfileService.sendNewPasswordToDao(email, newPassword);
			System.out.println("Great Success! No? Little success?! Any success??");
		}
		else
		{
			System.out.println("V‰‰rin meni!");
		}
		
		return "/user/profile";
	}
}
