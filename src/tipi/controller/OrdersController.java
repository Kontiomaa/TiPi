package tipi.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import tipi.bean.OrderForm;
import tipi.bean.OrderFormImpl;
import tipi.service.OrdersGetService;

@Controller
@RequestMapping(value="/admin")
@SessionAttributes("orderInformation")
public class OrdersController{
	
	@Inject
	private OrdersGetService ordersGetService;
	
	public OrdersGetService ordersGetService() {
		return ordersGetService;
	}

	public void setFormSendService(OrdersGetService ordersGetService) {
		this.ordersGetService = ordersGetService;
	}
	
	@RequestMapping(value = "/new", method = RequestMethod.GET)
	public String newOrders(Model model) {
		int statusOfOrder = 1;
		List<OrderForm> orders = ordersGetService.getOrderListFromDAO(statusOfOrder);
		model.addAttribute("orders", orders);
		return "admin/newOrders";
	}
	
	@RequestMapping(value = "/accepted", method = RequestMethod.GET)
	public String acceptedOrders(Model model) {
		int statusOfOrder = 2;
		List<OrderForm> orders = ordersGetService.getOrderListFromDAO(statusOfOrder);
		model.addAttribute("orders", orders);
		return "admin/acceptedOrders";
	}
	
	@RequestMapping(value = "/collected", method = RequestMethod.GET)
	public String collectedOrders(Model model) {
		int statusOfOrder = 3;
		List<OrderForm> orders = ordersGetService.getOrderListFromDAO(statusOfOrder);
		model.addAttribute("orders", orders);
		return "admin/collectedOrders";
	}
	
	@RequestMapping(value = "/taken", method = RequestMethod.GET)
	public String takenOrders(Model model) {
		int statusOfOrder = 4;
		List<OrderForm> orders = ordersGetService.getOrderListFromDAO(statusOfOrder);
		model.addAttribute("orders", orders);
		return "admin/takenOrders";
	}
	
	@RequestMapping(value = "/returned", method = RequestMethod.GET)
	public String returnedOrders(Model model) {
		int statusOfOrder = 5;
		List<OrderForm> orders = ordersGetService.getOrderListFromDAO(statusOfOrder);
		model.addAttribute("orders", orders);
		return "admin/returnedOrders";
	}
	
	@RequestMapping(value = "/completed", method = RequestMethod.GET)
	public String completedOrders(Model model) {
		int statusOfOrder = 6;
		List<OrderForm> orders = ordersGetService.getOrderListFromDAO(statusOfOrder);
		model.addAttribute("orders", orders);
		return "admin/completedOrders";
	}
	
	@RequestMapping(value = "/orderInformation", method = RequestMethod.POST)
	public String orderInformation(Model model, HttpServletRequest req) {
		OrderForm orderInformation = new OrderFormImpl();
		orderInformation = ordersGetService.getOrderFromDAO(Integer.parseInt(req.getParameter("orderID")));
		model.addAttribute("orderInformation", orderInformation);
		return "admin/orderInformation";
	}
	
	@RequestMapping(value = "/changeOrderStatus", method = RequestMethod.POST)
	public String changeOrderStatus(Model model, HttpServletRequest req) {
		ordersGetService.updateOrderStatus(Integer.parseInt(req.getParameter("orderID")), Integer.parseInt(req.getParameter("statusOfOrder")));
		return "redirect:/admin/new";
	}
	
}