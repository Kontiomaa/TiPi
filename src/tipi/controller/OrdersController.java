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
import tipi.bean.OrdersCount;
import tipi.service.OrdersGetService;

@Controller
@RequestMapping(value = "/admin")
@SessionAttributes({"orderInformation", "pageIdentifier", "ordersCount"})
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
		OrdersCount ordersCount = ordersGetService.getOrdersCount();
		model.addAttribute("ordersCount", ordersCount);
		model.addAttribute("orders", orders);
		model.addAttribute("pageIdentifier", "orders");
		return "admin/newOrders";
	}

	@RequestMapping(value = "/accepted", method = RequestMethod.GET)
	public String acceptedOrders(Model model) {
		model.addAttribute("orderPage", "accepted");
		int statusOfOrder = 2;
		List<OrderForm> orders = ordersGetService
				.getOrderListFromDAO(statusOfOrder);
		OrdersCount ordersCount = ordersGetService.getOrdersCount();
		model.addAttribute("ordersCount", ordersCount);
		model.addAttribute("orders", orders);
		model.addAttribute("pageIdentifier", "orders");
		return "admin/acceptedOrders";
	}

	@RequestMapping(value = "/taken", method = RequestMethod.GET)
	public String takenOrders(Model model) {
		model.addAttribute("orderPage", "taken");
		int statusOfOrder = 3;
		List<OrderForm> orders = ordersGetService
				.getOrderListFromDAO(statusOfOrder);
		OrdersCount ordersCount = ordersGetService.getOrdersCount();
		model.addAttribute("ordersCount", ordersCount);
		model.addAttribute("orders", orders);
		model.addAttribute("pageIdentifier", "orders");
		return "admin/takenOrders";
	}


	@RequestMapping(value = "/completed", method = RequestMethod.GET)
	public String completedOrders(Model model) {
		model.addAttribute("orderPage", "completed");
		int statusOfOrder = 4;
		List<OrderForm> orders = ordersGetService
				.getOrderListFromDAO(statusOfOrder);
		OrdersCount ordersCount = ordersGetService.getOrdersCount();
		model.addAttribute("ordersCount", ordersCount);
		model.addAttribute("orders", orders);
		model.addAttribute("pageIdentifier", "orders");
		return "admin/completedOrders";
	}

	@RequestMapping(value = "/billed", method = RequestMethod.GET)
	public String billedOrders(Model model) {
		model.addAttribute("orderPage", "billed");
		int statusOfOrder = 5;
		List<OrderForm> orders = ordersGetService
				.getOrderListFromDAO(statusOfOrder);
		OrdersCount ordersCount = ordersGetService.getOrdersCount();
		model.addAttribute("ordersCount", ordersCount);
		model.addAttribute("orders", orders);
		model.addAttribute("pageIdentifier", "orders");
		return "admin/billedOrders";
	}

	@RequestMapping(value = "/orderInformation", method = RequestMethod.POST)
	public String orderInformation(Model model, HttpServletRequest req) {
		OrderForm orderInformation = new OrderFormImpl();
		orderInformation = ordersGetService.getOrderFromDAO(Integer
				.parseInt(req.getParameter("orderID")));
		model.addAttribute("orderInformation", orderInformation);
		model.addAttribute("pageIdentifier", "orders");
		
		if (orderInformation.getStatusOfOrder() == 1) {
			model.addAttribute("changeStatusButton", "Kuittaa");
		} else if (orderInformation.getStatusOfOrder() == 2) {
			model.addAttribute("changeStatusButton", "Toimita");
		} else if (orderInformation.getStatusOfOrder() == 3) {
			model.addAttribute("changeStatusButton", "Palauta");
		} else if (orderInformation.getStatusOfOrder() == 4) {
			model.addAttribute("changeStatusButton", "Laskuta");
		} else {
			model.addAttribute("changeStatusButton", "------");
		}
		
		return "admin/orderInformation";
	}

	@RequestMapping(value = "/changeOrderStatus", method = RequestMethod.POST)
	public String changeOrderStatus(Model model, HttpServletRequest req) {
		int orderStatus = Integer.parseInt(req.getParameter("statusOfOrder"));
		boolean hasNewDestination = false;
		if(req.getParameter("hasNewDestination") != null)
		hasNewDestination = Boolean.parseBoolean(req.getParameter("hasNewDestination"));
		if(orderStatus == 2 && hasNewDestination == false) {
			orderStatus+=2;
		} else {
			orderStatus++;
		}
		
		ordersGetService.updateOrderStatus(
				Integer.parseInt(req.getParameter("orderID")), orderStatus);
		if (Integer.parseInt(req.getParameter("statusOfOrder")) == 1) {
			return "redirect:/admin/new";
		} else if (Integer.parseInt(req.getParameter("statusOfOrder")) == 2) {
			return "redirect:/admin/accepted";
		} else if (Integer.parseInt(req.getParameter("statusOfOrder")) == 3) {
			return "redirect:/admin/taken";
		} else if (Integer.parseInt(req.getParameter("statusOfOrder")) == 4) {
			return "redirect:/admin/completed";
		} else if (Integer.parseInt(req.getParameter("statusOfOrder")) == 5) {
			return "redirect:/admin/billed";
		}

		return "redirect:/admin/new";
	}
	
	@RequestMapping(value = "/returnPreviousOrderStatus", method = RequestMethod.POST)
	public String returnPreviousOrderStatus(Model model, HttpServletRequest req) {
		int orderStatus = Integer.parseInt(req.getParameter("statusOfOrder"));
		boolean hasNewDestination = false;
		if(req.getParameter("hasNewDestination") != null)
		hasNewDestination = Boolean.parseBoolean(req.getParameter("hasNewDestination"));
		if(orderStatus == 4 && hasNewDestination == false) {
			orderStatus-=2;
		} else {
			orderStatus--;
		}
		
		ordersGetService.updateOrderStatus(
				Integer.parseInt(req.getParameter("orderID")), orderStatus);
		if (Integer.parseInt(req.getParameter("statusOfOrder")) == 1) {
			return "redirect:/admin/new";
		} else if (Integer.parseInt(req.getParameter("statusOfOrder")) == 2) {
			return "redirect:/admin/accepted";
		} else if (Integer.parseInt(req.getParameter("statusOfOrder")) == 3) {
			return "redirect:/admin/taken";
		} else if (Integer.parseInt(req.getParameter("statusOfOrder")) == 4) {
			return "redirect:/admin/completed";
		} else if (Integer.parseInt(req.getParameter("statusOfOrder")) == 5) {
			return "redirect:/admin/billed";
		}

		return "redirect:/admin/new";
	}

}