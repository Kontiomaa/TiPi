package tipi.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import tipi.bean.OrderForm;
import tipi.bean.OrderFormImpl;
import tipi.bean.UserProfileImpl;
import tipi.service.OrdersDeleteService;
import tipi.service.OrdersGetService;
import tipi.service.OrdersTimeCheckService;
import tipi.service.OrdersUpdateService;

@Controller
@RequestMapping(value = "/user")
@SessionAttributes({"pageIdentifier", "userProfile", "searchOrders"})
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
	
	@RequestMapping(value = "/ordersEmpty", method = RequestMethod.GET)
	public String searchOrdersEmpty(Model model) {
		OrderForm searchOrders = new OrderFormImpl();
		model.addAttribute("searchOrders", searchOrders);
		return "redirect:/user/showOrders";
	}
	
	@RequestMapping(value = "/showOrders", method = RequestMethod.GET)
	public String madeOrders(Model model, @ModelAttribute(value = "userProfile") UserProfileImpl userProfile) {
		if (!model.containsAttribute("searchOrders")) {
			return "redirect:/user/ordersEmpty";
		} 
		List<OrderForm> orders = ordersGetService.getOrderListForUserFromDAO(userProfile.getUser_id(), 0, 0, 0);
				
		model.addAttribute("orders", orders);
		model.addAttribute("pageIdentifier", "orders");
		
		return "user/orders";
	}
	
	@RequestMapping(value = "/showOrders", method = RequestMethod.POST)
	public String madeOrdersPost(Model model, @ModelAttribute(value = "userProfile") UserProfileImpl userProfile, @ModelAttribute(value = "searchOrders") OrderFormImpl searchOrders) {
		if(searchOrders.getCompanyMadeOrder()!=0)
			searchOrders.setCompanyMadeOrder(userProfile.getMyCompany());

		List<OrderForm> orders = ordersGetService.getOrderListForUserFromDAO(userProfile.getUser_id(), searchOrders.getHasNewDestinationForSearchOrders(),searchOrders.getCompanyMadeOrder(), searchOrders.getStatusOfOrder());
		model.addAttribute("orders", orders);
		model.addAttribute("pageIdentifier", "orders");
		
		return "user/orders";
	}
	
	@RequestMapping(value = "/getOneOrder", method = RequestMethod.POST)
	public String showOrder(Model model, HttpServletRequest request) {
		int orderId = Integer.parseInt(request.getParameter("orderId"));
		OrderForm order = ordersGetService.getOrderForUserFromDAO(orderId);
		boolean collectionTimeLimit = ordersTimeCheckService.checkCollectionTime(orderId, 180);
		boolean nextDestinationTimeLimit = ordersTimeCheckService.checkNextDestinationTime(orderId, 180);
		
		model.addAttribute("collectionTimeLimit", collectionTimeLimit);
		model.addAttribute("nextDestinationTimeLimit", nextDestinationTimeLimit);
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
	public String updateModifiedOrder(Model model, HttpServletRequest request, @ModelAttribute(value = "order") @Valid OrderFormImpl order, BindingResult result,
			 @ModelAttribute(value = "userProfile") UserProfileImpl profile) {
		
		boolean collectionTimeLimit = ordersTimeCheckService.checkCollectionTime(order.getOrders_id(), 180);
		boolean nextDestinationTimeLimit = ordersTimeCheckService.checkNextDestinationTime(order.getOrders_id(), 180);
		order.setCompanyMadeOrder(profile.getMyCompany());
		order.setUserMadeOrder(profile.getUser_id());
		System.out.println(order.toString());
		
		model.addAttribute("collectionTimeLimit", collectionTimeLimit);
		model.addAttribute("nextDestinationTimeLimit", nextDestinationTimeLimit);
		model.addAttribute("order", order);
		model.addAttribute("pageIdentifier", "orders");
		
		if (result.hasErrors()) { 
			return "user/modifyOrder";
		} else {
			ordersUpdateService.updateModificatedOrder(order, collectionTimeLimit, nextDestinationTimeLimit);
			return "redirect:/user/showOrders";
		}
	}
	
	@RequestMapping(value = "/deleteOrder", method = RequestMethod.POST)
	public String deleteOrder(Model model, HttpServletRequest request) {
		int id = Integer.parseInt((String)request.getAttribute("orders_id"));
		ordersDeleteService.deleteOrder(id);
		return "user/orders";
	}
	
}