package tipi.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value="/admin")
public class UsersController {
	
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
		return "admin/companies";
	}
}
