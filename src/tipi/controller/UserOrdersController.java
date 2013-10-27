package tipi.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import tipi.bean.OrderForm;
import tipi.service.OrdersGetService;

@Controller
@RequestMapping(value = "/user")
@SessionAttributes({"pageIdentifier"})
public class UserOrdersController {

	@Inject
	private OrdersGetService ordersGetService;

	public OrdersGetService getOrdersGetService() {
		return ordersGetService;
	}

	public void setFormSendService(OrdersGetService ordersGetService) {
		this.ordersGetService = ordersGetService;
	}
	
	@RequestMapping(value = "/show-orders", method = RequestMethod.GET)
	public String madeOrders(Model model) {
		UserDetails userDetails = (UserDetails)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String userEmail = userDetails.getUsername();
				
		List<OrderForm> orders = ordersGetService.getOrderListForUserFromDAO(userEmail);
		
		model.addAttribute("orders", orders);
		model.addAttribute("pageIdentifier", "orders");
		
		return "user/orders";
	}
	
}
