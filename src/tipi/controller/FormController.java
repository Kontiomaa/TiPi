package tipi.controller;

import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import tipi.bean.OrderFormBeanImpl;

@Controller
@RequestMapping(value = "/user")
@SessionAttributes("orderForm")
public class FormController {

	// FORMIN TEKEMINEN
	@RequestMapping(value = "orderFormEmpty", method = RequestMethod.GET)
	public String getCreateForm(Model model) {
		model.addAttribute("orderForm", new OrderFormBeanImpl());
		return "redirect:/user/orderForm";
	}

	// FORMIN TIETOJEN VASTAANOTTO
	@RequestMapping(value = "orderForm", method = RequestMethod.POST)
	public String create(
			@ModelAttribute(value = "orderForm") @Valid OrderFormBeanImpl orderForm,
			BindingResult result) {
		System.out.println("TESTI2");
		if (result.hasErrors()) {
			return "user/orderForm";
		} else {
			System.out.println(orderForm.getCarBrand());
			return "/user/orderConfirmation";
		}
	}

	// FORMIN TEKEMINEN
	@RequestMapping(value = "orderForm", method = RequestMethod.GET)
	public String getOldForm(Model model) {
		if (!model.containsAttribute("orderForm")) {
			model.addAttribute("orderForm", new OrderFormBeanImpl());
		}

		return "/user/orderForm";
	}
}