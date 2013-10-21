package tipi.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import tipi.bean.OrderForm;
import tipi.service.OrdersGetService;

@Controller
@RequestMapping(value="/admin")
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
}
