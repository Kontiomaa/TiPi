package tipi.controller;

import javax.inject.Inject;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import tipi.bean.OrderFormImpl;
import tipi.service.FormSendService;

@Controller
@RequestMapping(value = "/user")
@SessionAttributes("orderForm")
public class FormController {
	
	
	@Inject
	private FormSendService formSendService;
	
	public FormSendService getFormSendService() {
		return formSendService;
	}

	public void setFormSendService(FormSendService formSendService) {
		this.formSendService = formSendService;
	}

	// FORMIN TEKEMINEN
	@RequestMapping(value = "orderFormEmpty", method = RequestMethod.GET)
	public String getCreateForm(Model model) {
		model.addAttribute("orderForm", new OrderFormImpl());
		return "redirect:/user/orderForm";
	}

	// FORMIN TIETOJEN VASTAANOTTO
	@RequestMapping(value = "orderForm", method = RequestMethod.POST)
	public String create(
			@ModelAttribute(value = "orderForm") @Valid OrderFormImpl orderForm,
			BindingResult result) {
		if (result.hasErrors()) {
			return "/user/orderForm";
		} else {
			// System.out.println(orderForm.getCarBrand());
			return "/user/orderConfirmation";
		}
	}

	// FORMIN TEKEMINEN
	@RequestMapping(value = "orderForm", method = RequestMethod.GET)
	public String getOldForm(Model model) {
		if (!model.containsAttribute("orderForm")) {
			return "redirect:/user/orderFormEmpty";
		}

		return "/user/orderForm";
	}
	
	// FORMIN TALLENTAMINEN
	@RequestMapping(value = "orderSend", method = RequestMethod.POST)
	public String sendOrderForm(@ModelAttribute(value = "orderForm") @Valid OrderFormImpl orderForm,
			BindingResult result) {
		
		formSendService.sendFormToDAO(orderForm);
		
		return "redirect:/user/orderFormEmpty";
	}
	
}