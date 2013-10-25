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
@RequestMapping(value = "/admin")
@SessionAttributes({ "orderInformation", "orderPage" })
public class OrdersController {

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
		model.addAttribute("orderPage", "new");
		int statusOfOrder = 1;
		List<OrderForm> orders = ordersGetService
				.getOrderListFromDAO(statusOfOrder);
		model.addAttribute("orders", orders);
		return "admin/newOrders";
	}

	@RequestMapping(value = "/accepted", method = RequestMethod.GET)
	public String acceptedOrders(Model model) {
		model.addAttribute("orderPage", "accepted");
		int statusOfOrder = 2;
		List<OrderForm> orders = ordersGetService
				.getOrderListFromDAO(statusOfOrder);
		model.addAttribute("orders", orders);
		return "admin/acceptedOrders";
	}

	@RequestMapping(value = "/collecting", method = RequestMethod.GET)
	public String collectedOrders(Model model) {
		model.addAttribute("orderPage", "collecting");
		int statusOfOrder = 3;
		List<OrderForm> orders = ordersGetService
				.getOrderListFromDAO(statusOfOrder);
		model.addAttribute("orders", orders);
		return "admin/collectingOrders";
	}

	@RequestMapping(value = "/taken", method = RequestMethod.GET)
	public String takenOrders(Model model) {
		model.addAttribute("orderPage", "taken");
		int statusOfOrder = 4;
		List<OrderForm> orders = ordersGetService
				.getOrderListFromDAO(statusOfOrder);
		model.addAttribute("orders", orders);
		return "admin/takenOrders";
	}

	@RequestMapping(value = "/returning", method = RequestMethod.GET)
	public String returnedOrders(Model model) {
		model.addAttribute("orderPage", "returning");
		int statusOfOrder = 5;
		List<OrderForm> orders = ordersGetService
				.getOrderListFromDAO(statusOfOrder);
		model.addAttribute("orders", orders);
		return "admin/returningOrders";
	}

	@RequestMapping(value = "/completed", method = RequestMethod.GET)
	public String completedOrders(Model model) {
		model.addAttribute("orderPage", "completed");
		int statusOfOrder = 6;
		List<OrderForm> orders = ordersGetService
				.getOrderListFromDAO(statusOfOrder);
		model.addAttribute("orders", orders);
		return "admin/completedOrders";
	}

	@RequestMapping(value = "/billed", method = RequestMethod.GET)
	public String billedOrders(Model model) {
		model.addAttribute("orderPage", "billed");
		int statusOfOrder = 7;
		List<OrderForm> orders = ordersGetService
				.getOrderListFromDAO(statusOfOrder);
		model.addAttribute("orders", orders);
		return "admin/billedOrders";
	}

	@RequestMapping(value = "/orderInformation", method = RequestMethod.POST)
	public String orderInformation(Model model, HttpServletRequest req) {
		OrderForm orderInformation = new OrderFormImpl();
		orderInformation = ordersGetService.getOrderFromDAO(Integer
				.parseInt(req.getParameter("orderID")));
		model.addAttribute("orderInformation", orderInformation);
		return "admin/orderInformation";
	}

	@RequestMapping(value = "/changeOrderStatus", method = RequestMethod.POST)
	public String changeOrderStatus(Model model, HttpServletRequest req) {
		int orderStatus = Integer.parseInt(req.getParameter("statusOfOrder"));
		boolean hasNewDestination = false;
		if(req.getParameter("hasNewDestination") != null)
		hasNewDestination = Boolean.parseBoolean(req.getParameter("hasNewDestination"));
		if(orderStatus == 3 && hasNewDestination == false) {
			orderStatus+=3;
		} else {
			orderStatus++;
		}
		
		ordersGetService.updateOrderStatus(
				Integer.parseInt(req.getParameter("orderID")), orderStatus);
		if (1 == Integer.parseInt(req.getParameter("statusOfOrder"))) {
			return "redirect:/admin/new";
		} else if (2 == Integer.parseInt(req.getParameter("statusOfOrder"))) {
			return "redirect:/admin/accepted";
		} else if (3 == Integer.parseInt(req.getParameter("statusOfOrder"))) {
			return "redirect:/admin/collecting";
		} else if (4 == Integer.parseInt(req.getParameter("statusOfOrder"))) {
			return "redirect:/admin/taken";
		} else if (5 == Integer.parseInt(req.getParameter("statusOfOrder"))) {
			return "redirect:/admin/returning";
		} else if (6 == Integer.parseInt(req.getParameter("statusOfOrder"))) {
			return "redirect:/admin/completed";
		} else if (7 == Integer.parseInt(req.getParameter("statusOfOrder"))) {
			return "redirect:/admin/billed";
		}

		return "redirect:/admin/new";
	}

}