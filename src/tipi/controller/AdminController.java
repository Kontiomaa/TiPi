package tipi.controller;

/**
 * @author Lauri Soivi, Joona Viertola, Samuel Kontiomaa
 * @version 1.0
 * @since 18.12.2013
 * Controller moves admin-users to profile and handles their password change onward
 */

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
@RequestMapping(value="/admin")
@SessionAttributes({"userProfile", "pageIdentifier"})
public class AdminController {
	
	@RequestMapping(value = "/profile", method = RequestMethod.GET)
	public String profiili(Model model) {
		model.addAttribute("pageIdentifier", "profile");
		return "admin/profile";
	}
	
	@Inject
	private UserProfileService userProfileService;
	
	public UserProfileService getUserProfileService() {
		return userProfileService;
	}

	public void setUserProfileService(UserProfileService userProfileService) {
		this.userProfileService = userProfileService;
	}
	
	/**
	 * When changing the password from the profile -page, the written "old password" is checked if it matches the one currently in use.
	 * If everything is ok the new encoded password is sent on to the service in order to get the password changed
	 */
	@RequestMapping(value = "/changePassword", method = RequestMethod.POST)
	public String changePassword(Model model, HttpServletRequest req, @ModelAttribute(value = "userProfile") UserProfileImpl userProfile) {
		
		StandardPasswordEncoder spe = new StandardPasswordEncoder();
		String newPassword=spe.encode(req.getParameter("newPassword"));
		
		boolean correctPassword = spe.matches(req.getParameter("oldPassword"), userProfile.getPassword());
		
		if(correctPassword){
			int usersId = userProfile.getUser_id();
			userProfileService.sendNewPasswordToDao(usersId, newPassword);
			model.addAttribute("passwordChangeSuccessful", "true");
			userProfile.setPassword(newPassword); //In case you want  to change your password multiple times. (This way the changed password is recognized without a need to re-login)
		}
		else
		{
			System.out.println("Wrong password!");
			model.addAttribute("passwordChangeFailed", "true");
		}
		
		model.addAttribute("pageIdentifier", "profile");
		
		return "/admin/profile";
	}
}
