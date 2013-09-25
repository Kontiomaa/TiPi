package tipi.controller;

import java.util.Set;

import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = "/")
public class SecureController {

	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String paasivu(Model model) {

		Set<String> roles = AuthorityUtils
				.authorityListToSet(SecurityContextHolder.getContext()
						.getAuthentication().getAuthorities());

		if (roles.contains("ROLE_ADMIN")) {
			return "admin/adminIndex";
		}

		return "redirect:/user/orderFormEmpty";
	}

}
