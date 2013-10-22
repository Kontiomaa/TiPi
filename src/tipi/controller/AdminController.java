package tipi.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.security.crypto.password.StandardPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import tipi.bean.OrderForm;
import tipi.bean.UserProfileImpl;
import tipi.service.OrdersGetService;
import tipi.service.UserProfileService;

@Controller
@RequestMapping(value="/admin")
@SessionAttributes("userProfile")
public class AdminController {
	
	@Inject
	private OrdersGetService ordersGetService;
	
	public OrdersGetService ordersGetService() {
		return ordersGetService;
	}

	public void setFormSendService(OrdersGetService ordersGetService) {
		this.ordersGetService = ordersGetService;
	}
	
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String paasivu(Model model) {
		List<OrderForm> orders = ordersGetService.getOrderListFromDAO();
		model.addAttribute("orders", orders);
		return "admin/newOrders";
	}
	
	@RequestMapping(value = "/profile", method = RequestMethod.GET)
	public String profiili(Model model) {
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
	
	@RequestMapping(value = "/changePassword", method = RequestMethod.POST)
	public String changePassword(Model model, HttpServletRequest req, @ModelAttribute(value = "userProfile") UserProfileImpl userProfile) {
		
		StandardPasswordEncoder spe = new StandardPasswordEncoder();
		String newPassword=spe.encode(req.getParameter("newPassword"));
		
		boolean correctPassword = spe.matches(req.getParameter("oldPassword"), userProfile.getPassword());
		
		if(correctPassword){
			String email = userProfile.getEmail();
			userProfileService.sendNewPasswordToDao(email, newPassword);
			model.addAttribute("passworldChangeSuccessful", "true");
		}
		else
		{
			System.out.println("Wrong password!");
			model.addAttribute("passworldChangeFailed", "true");
		}
		
		return "/user/profile";
	}
}
