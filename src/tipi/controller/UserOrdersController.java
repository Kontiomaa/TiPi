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
import tipi.service.OrdersDeleteService;
import tipi.service.OrdersGetService;
import tipi.service.OrdersTimeCheckService;
import tipi.service.OrdersUpdateService;
//import tipi.service.OrdersUpdateService;
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
	
	@Inject
	private OrdersDeleteService ordersDeleteService;

	public OrdersDeleteService getOrdersDeleteService() {
		return ordersDeleteService;
	}

	public void setOrdersDeleteService(OrdersDeleteService ordersDeleteService) {
		this.ordersDeleteService = ordersDeleteService;
	}
	
	@Inject
	private OrdersUpdateService ordersUpdateService;
	
	public OrdersUpdateService getOrdersUpdateService() {
		return ordersUpdateService;
	}
	
	public void setOrdersUpdateService(OrdersUpdateService ordersUpdateService) {
		this.ordersUpdateService = ordersUpdateService;
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
		boolean nextDestinationTimeLimit = ordersTimeCheckService.checkNextDestinationTime(orderId, 180);
		
		model.addAttribute("collectionTimeLimit", collectionTimeLimit);
		model.addAttribute("nextDestinationTimeLimit", nextDestinationTimeLimit);
		model.addAttribute("order", order);
		model.addAttribute("pageIdentifier", "orders");
		
		return "user/modifyOrder";
	}
	
	@RequestMapping(value = "/updateModifiedOrder", method = RequestMethod.POST)
	public String updateModifiedOrder(Model model, HttpServletRequest request) {
		ordersUpdateService.updateModificatedOrder(request.getParameter("carBrand"), request.getParameter("carModel"), request.getParameter("carRegister"), request.getParameter("carColor"), request.getParameter("collectionDate"), request.getParameter("collectionTime"), request.getParameter("collectionAddress"), request.getParameter("collectionPostalCode"), request.getParameter("collectionCity"), request.getParameter("destinationDate"), request.getParameter("destinationTime"), request.getParameter("destinationAddress"), request.getParameter("destinationPostalCode"), request.getParameter("destinationCity"), request.getParameter("clientFname"), request.getParameter("clientLname"), request.getParameter("clientPhoneNo"), request.getParameter("clientCompany"), request.getParameter("additionalInformation"), request.getParameter("hasNewDestination"), request.getParameter("nextDestinationCollectionDate"), request.getParameter("nextDestinationCollectionTime"), request.getParameter("nextDestinationDate"), request.getParameter("nextDestinationTime"), request.getParameter("nextDestinationAddress"), request.getParameter("nextDestinationPostalCode"), request.getParameter("nextDestinationCity"), request.getParameter("nextAdditionalInformation"), request.getParameter("orders_id"));
		
		return "redirect:/user/showOrders";
	}
	
	@RequestMapping(value = "/deleteOrder", method = RequestMethod.POST)
	public String deleteOrder(Model model, HttpServletRequest request) {
		int id = Integer.parseInt((String)request.getAttribute("orders_id"));
		ordersDeleteService.deleteOrder(id);
		return "user/orders";
	}
	
}