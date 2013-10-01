package tipi.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import tipi.bean.UserProfileBean;
import tipi.bean.UserProfileBeanImpl;

@Controller
@RequestMapping(value = "/user")
@SessionAttributes("userProfile")
public class UserProfileController {

	@RequestMapping(value = "/profile", method = RequestMethod.GET)
	public String profile(Model model) {
		if (!model.containsAttribute("userProfile")) {
			
			UserProfileBean emptyUser = new UserProfileBeanImpl();
			emptyUser.setfName("Pekka");
			emptyUser.setlName("Padas");
			emptyUser.setPhoneNo("0400123123");
			emptyUser.setEmail("esim@sivu.fi");
			emptyUser.setUsername("kayttaja");
			
			model.addAttribute("userProfile", emptyUser);
		}

		return "/user/profile";
	}

}
