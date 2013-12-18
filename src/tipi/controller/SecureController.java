package tipi.controller;

/**
 * @author Lauri Soivi, Joona Viertola, Samuel Kontiomaa
 * @version 1.0
 * @since 18.12.2013
 * Controller determines if user is logged in as ADMIN go to admin side if USER go to user side
 * if it's neither go back to login page.
 */

import java.util.Set;

import javax.inject.Inject;

import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import tipi.bean.UserProfile;
import tipi.bean.UserProfileImpl;
import tipi.service.UserProfileService;

@Controller
@RequestMapping(value = "/")
@SessionAttributes("userProfile")
public class SecureController {
	
	@Inject
	private UserProfileService userProfileService;
	
	public UserProfileService getUserProfileService() {
		return userProfileService;
	}
	
	public void setUserProfileService(UserProfileService userProfileService) {
		this.userProfileService = userProfileService;
	}

	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String paasivu(Model model) {
		
		String userEmail = SecurityContextHolder.getContext()
				.getAuthentication().getName();
		
		UserProfile userProfile = new UserProfileImpl();		
		
		userProfile = userProfileService.getRegisteredUsersInformationFromDAO(userEmail, userProfile);
		model.addAttribute("userProfile", userProfile);
		
		Set<String> roles = AuthorityUtils
				.authorityListToSet(SecurityContextHolder.getContext()
						.getAuthentication().getAuthorities());
		if (roles.contains("ROLE_ADMIN")) {
			return "redirect:/admin/new";
		}
		else if (roles.contains("ROLE_USER")) {
			return "redirect:/user/orderFormEmpty";
		} else {
			return "redirect:/login";
		}
	}

}
