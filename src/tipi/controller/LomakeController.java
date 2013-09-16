package tipi.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value="/kirjautunut")

public class LomakeController {
	@RequestMapping(value = "/lomake", method = RequestMethod.GET)
	public String paasivu(Model model) {
		return "/kirjautunut/lomake";
	}
}
