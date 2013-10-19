package tipi.controller;

import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import tipi.bean.UserProfile;
import tipi.bean.UserProfileImpl;


@Controller
@RequestMapping(value="/admin")
@SessionAttributes("registerUser")
public class RegisterUserController {
	
	@RequestMapping(value = "/registerEmptyUser", method = RequestMethod.GET)
	public String getEmptyUser(Model model) {
		UserProfile registerUser = new UserProfileImpl();
		model.addAttribute("registerUser", registerUser);
		return "redirect:/admin/registerNewUser";
	}
	
	@RequestMapping(value = "/registerNewUser", method = RequestMethod.GET)
	public String registerNewUser(Model model) {
		if (!model.containsAttribute("registerUser")) {
			return "redirect:/admin/registerEmptyUser";
		}
		return "admin/registerNewUser";
	}
	
	@RequestMapping(value = "/registerNewUser", method = RequestMethod.POST)
	public String getConfirmation(
			@ModelAttribute(value = "registerUser") @Valid UserProfileImpl registerUser,
			BindingResult result) {
		if (result.hasErrors()) {
			return "/admin/registerNewUser";
		} else {
			// System.out.println(orderForm.getCarBrand());
			//return "/admin/registerNewUserConfirmation";
			System.out.println(registerUser.getfName());
			return null;
		}
	}

}
