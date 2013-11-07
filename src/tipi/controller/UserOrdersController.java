package tipi.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import tipi.bean.OrderForm;
import tipi.service.OrdersGetService;
import tipi.service.OrdersTimeCheckService;
import tipi.util.PasswordRecoverHashGenerator;

@Controller
@RequestMapping(value = "/user")
@SessionAttributes({"pageIdentifier"})
public class UserOrdersController {

	@Inject
	private OrdersGetService ordersGetService;

	public OrdersGetService getOrdersGetService() {
		return ordersGetService;
	}

	public void setOrdersGetService(OrdersGetService ordersGetService) {
		this.ordersGetService = ordersGetService;
	}
	
	@Inject
	private OrdersTimeCheckService ordersTimeCheckService;

	public OrdersTimeCheckService getOrdersTimeCheckService() {
		return ordersTimeCheckService;
	}

	public void setOrdersTimeCheckService(OrdersTimeCheckService ordersTimeCheckService) {
		this.ordersTimeCheckService = ordersTimeCheckService;
	}
	
	@RequestMapping(value = "/showOrders", method = RequestMethod.GET)
	public String madeOrders(Model model) {
		UserDetails userDetails = (UserDetails)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String userEmail = userDetails.getUsername();
				
		List<OrderForm> orders = ordersGetService.getOrderListForUserFromDAO(userEmail);
				
		model.addAttribute("orders", orders);
		model.addAttribute("pageIdentifier", "orders");
		
		return "user/orders";
	}
	
	@RequestMapping(value = "/getOneOrder", method = RequestMethod.POST)
	public String showOrder(Model model, HttpServletRequest request) {
		int orderId = Integer.parseInt(request.getParameter("orderId"));
		OrderForm order = ordersGetService.getOrderForUserFromDAO(orderId);
		
		model.addAttribute("order", order);
		model.addAttribute("pageIdentifier", "orders");
		
		return "user/oneOrder";
	}
	
	@RequestMapping(value = "/getModificateOrder", method = RequestMethod.POST)
	public String showOrderForModification(Model model, HttpServletRequest request) {
		int orderId = Integer.parseInt(request.getParameter("orderId"));
		OrderForm order = ordersGetService.getOrderForUserFromDAO(orderId);
		boolean collectionTimeLimit = ordersTimeCheckService.checkCollectionTime(orderId, 180);
		
		model.addAttribute("collectionTimeLimit", collectionTimeLimit);
		model.addAttribute("order", order);
		model.addAttribute("pageIdentifier", "orders");
		
		return "user/modifyOrder";
	}
	
}
