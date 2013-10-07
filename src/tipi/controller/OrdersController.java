package tipi.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value="/admin")

public class OrdersController{
	@RequestMapping(value = "/new", method = RequestMethod.GET)
	public String uudet(Model model) {
		return "admin/newOrders";
	}
	
	@RequestMapping(value = "/accepted", method = RequestMethod.GET)
	public String kuitatut(Model model) {
		return "admin/acceptedOrders";
	}
	
	@RequestMapping(value = "/collected", method = RequestMethod.GET)
	public String haetut(Model model) {
		return "admin/collectedOrders";
	}
	
	@RequestMapping(value = "/taken", method = RequestMethod.GET)
	public String viedyt(Model model) {
		return "admin/takenOrders";
	}
	
	@RequestMapping(value = "/returned", method = RequestMethod.GET)
	public String palautetut(Model model) {
		return "admin/returnedOrders";
	}
	
	@RequestMapping(value = "/completed", method = RequestMethod.GET)
	public String valmiit(Model model) {
		return "admin/completedOrders";
	}
}