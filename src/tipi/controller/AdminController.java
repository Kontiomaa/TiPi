package tipi.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value="/admin")

public class AdminController {
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String paasivu(Model model) {
		return "admin/index";
	}
	
	@RequestMapping(value = "/users", method = RequestMethod.GET)
	public String kayttajat(Model model) {
		return "admin/users";
	}
	
	@RequestMapping(value = "/registerNewUser", method = RequestMethod.GET)
	public String rekisteroi(Model model) {
		return "admin/registerNewUser";
	}
	
	@RequestMapping(value = "/profile", method = RequestMethod.GET)
	public String profiili(Model model) {
		return "admin/profile";
	}
}
