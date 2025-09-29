package com.cognizant.healthCare.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.cognizant.healthCare.Util.DateUtil;
import com.cognizant.healthCare.dao.AdminDetailsDaoSql;
import com.cognizant.healthCare.dao.CartDetalsDaoSql;
import com.cognizant.healthCare.dao.CustomerDetailsDaoSql;
import com.cognizant.healthCare.dao.MedicineDetailsDaoSql;
import com.cognizant.healthCare.dao.OrderDetailsDaoSql;
import com.cognizant.healthCare.dao.OrderedMedicineDaoSql;
import com.cognizant.healthCare.dao.helpDetailsDaoSql;
import com.cognizant.healthCare.model.CartDetails;
import com.cognizant.healthCare.model.CustomerDetails;
import com.cognizant.healthCare.model.MedicineDetails;
import com.cognizant.healthCare.model.helpDetails;
import com.cognizant.healthCare.model.orderDetails;
import com.cognizant.healthCare.model.orderedMedicineDetails;
import com.cognizant.healthCare.service.PharmaPaymentService;

@Controller
public class CustomerController {
	
	@Autowired
	PharmaPaymentService paymentService;
	@Autowired
	AdminDetailsDaoSql adminDao;
	@Autowired
	CustomerDetailsDaoSql customerDao;
	@Autowired
	MedicineDetailsDaoSql medicineDao;
	@Autowired
	OrderDetailsDaoSql orderDao;
	@Autowired
	OrderedMedicineDaoSql orderedMedicineDao;
	@Autowired
	CartDetalsDaoSql cartDao;
	@Autowired
	DateUtil date;
	@Autowired
	helpDetailsDaoSql helpDao;
	
	
	
	@GetMapping("/customer")
	public String customerRegistration(ModelMap model) {
		model.addAttribute("customer", new CustomerDetails());
		return "customerRegistrationPage";
	}
	
	@GetMapping("/customerRegistration")
	public String registerCustomerDetails(ModelMap model,
			@ModelAttribute("customer") CustomerDetails customerDetails)
			throws ClassNotFoundException, SQLException, IOException, ParseException {
		customerDao.updateCustomerDetails(customerDetails);
		model.addAttribute("message", "Your details are submitted successfully! Please login to continue.");
		return "customerRegistrationPage";
	}

	@GetMapping("/customerLoginPage")
	public String customerLogin(ModelMap model) {
		return "customerLoginPage";
	}

	@PostMapping("/customerLogin")
	public String customerLogin(ModelMap model, @RequestParam String userName, @RequestParam String password)
			throws ClassNotFoundException, SQLException, IOException, ParseException {
		boolean message = paymentService.checkUserNameAndPasswordCustomer(userName, password);
		if (message) {
			model.addAttribute("customerName", userName);
			List<MedicineDetails> medicine=new ArrayList<>();
			medicine=medicineDao.getMedicineDetails();
			model.addAttribute("medicineDetails", medicine);
			return "customerHomePage";
		}

		else {
			model.addAttribute("errorMessage", "Invalid User ID (or) Incorrect Password");
			return "customerLoginPage";
		}
	}
	
	@GetMapping("/resetPasswordCustomer")
	public String adminPasswordReset(ModelMap model) {
		return "customerForgetPassword";
	}
	
	@PostMapping("/updatePasswordCustomer")
	public String adminResetPassword(ModelMap model, @RequestParam String userName,@RequestParam String securityQuestion,@RequestParam String securityAnswer, @RequestParam String password)
			throws ClassNotFoundException, SQLException, IOException, ParseException {
		boolean message = paymentService.checkSecurityQuestionCustomer(userName, password, securityQuestion, securityAnswer);
		if (message) {
			model.addAttribute("message", "Password Updated Successfully, Please login to continue!");
			return "customerForgetPassword";
		}

		else {
			model.addAttribute("errorMessage", "Invalid Security Question (or) Incorrect Security Answer");
			return "customerForgetPassword";
		}
	}

	
	@GetMapping("/customerHomePage")
	public String customerhomePage(ModelMap model, @RequestParam String customerName) throws ClassNotFoundException, SQLException, IOException, ParseException {
		List<MedicineDetails> medicine=new ArrayList<>();
		medicine=medicineDao.getMedicineDetails();
		model.addAttribute("medicineDetails", medicine);
		model.addAttribute("customerName", customerName);
		return "customerHomePage";
	}
	
	@GetMapping("/sortBasedOn")
	public String homePageSorting(ModelMap model, @RequestParam String customerName, @RequestParam String type) throws ClassNotFoundException, SQLException, IOException, ParseException {
		List<MedicineDetails> medicine=new ArrayList<>();
		medicine=medicineDao.getMedicineDetailsBySorting(type);
		model.addAttribute("medicineDetails", medicine);
		model.addAttribute("customerName", customerName);
		return "customerHomePage";
	}
	
	
	
	@GetMapping("/orderPage")
	public String customerOrderPage(ModelMap model, @RequestParam String customerName) throws ClassNotFoundException, SQLException, IOException, ParseException {
		String todayDate=date.todayDate();
		model.addAttribute("date", todayDate);
		model.addAttribute("order", new orderDetails());
		model.addAttribute("customerName", customerName);
		return "orderPage";
	}
	
	@GetMapping("/orderDetails")
	public String updateOrderDetails(ModelMap model, @ModelAttribute("order") orderDetails orderDetails) throws ClassNotFoundException, SQLException, IOException, ParseException {
		orderDao.updateOrderDetails(orderDetails);
		int orderId=orderDao.getOrderId(orderDetails.getCustomerName());
		String todayDate=date.todayDate();
		model.addAttribute("date", todayDate);
		model.addAttribute("orderId", orderId);
		model.addAttribute("message", "Patients Details Updated successfully!");
		return "orderPage";
	}
	
	@GetMapping("/addMedicines")
	public String addMedicines(ModelMap model, @RequestParam int orderId) throws ClassNotFoundException, SQLException, IOException, ParseException {
		model.addAttribute("orderedMedicine", new orderedMedicineDetails());
		model.addAttribute("orderId", orderId);
		return "medicinePage";
	}
	
	@GetMapping("/saveAddedMedicines")
	public String saveAddedMedicines(ModelMap model,@ModelAttribute("orderedMedicine") orderedMedicineDetails orderedMedicineDetails) throws ClassNotFoundException, SQLException, IOException, ParseException {
		model.addAttribute("orderedMedicine", new orderedMedicineDetails());
		orderedMedicineDao.updateOrderedMedicines(orderedMedicineDetails);
		paymentService.updateQuantity(orderedMedicineDetails);
		model.addAttribute("orderId", orderedMedicineDetails.getOrderId());
		return "medicinePage";
	}
	
	@GetMapping("/viewCart")
	public String viewCart(ModelMap model, @RequestParam int orderId) throws ClassNotFoundException, SQLException, IOException, ParseException {
		List<CartDetails> cart=new ArrayList<>();
		cart=cartDao.getCartDetails(orderId);
		double amount=cartDao.amountOfOrderedItems(cart);
		model.addAttribute("amount", amount);
		model.addAttribute("cart", cart);
		model.addAttribute("orderId", orderId);
		return "viewCart";
	}
	
	@GetMapping("/removeMedicineFromCart")
	public String removeMedicineFromCart(ModelMap model, @RequestParam int orderId,@RequestParam String medicine) throws ClassNotFoundException, SQLException, IOException, ParseException {
		cartDao.removeOrderItem(orderId, medicine);
		List<CartDetails> cart=new ArrayList<>();
		cart=cartDao.getCartDetails(orderId);
		double amount=cartDao.amountOfOrderedItems(cart);
		model.addAttribute("amount", amount);
		model.addAttribute("cart", cart);
		model.addAttribute("message", "Medicine removed successfully!");
		model.addAttribute("orderId", orderId);
		return "viewCart";
	}
	
	@GetMapping("/debitCard")
	public String makePayment(ModelMap model, @RequestParam double amount) {
		model.addAttribute("amount", amount);
		return "makePayment";
	}
	
	@GetMapping("/netBanking")
	public String netBanking(ModelMap model, @RequestParam double amount) {
		model.addAttribute("amount", amount);
		return "netBanking";
	}
	
	
	@GetMapping("/viewOrderHistory")
	public String viewOrderHistory(ModelMap model, @RequestParam String customerName) throws ClassNotFoundException, SQLException, IOException, ParseException {
		List<orderDetails> orders = new ArrayList<>();
		orders=orderDao.getOrderDetails();
		List<HashMap<String, Integer>> medicineList = new ArrayList<HashMap<String, Integer>>();
		medicineList=orderDao.getorderedMedicines(orders);
		model.addAttribute("order", orders);
		model.addAttribute("medicineList", medicineList);
		model.addAttribute("customerName", customerName);
		return "viewOrderHistory";
	}
	
	@GetMapping("/help")
	public String helpPage(ModelMap model, @RequestParam String customerName) throws ClassNotFoundException, SQLException, IOException, ParseException {
		model.addAttribute("customerName", customerName);
		model.addAttribute("help", new helpDetails());
		model.addAttribute("date", date.todayDate());
		return "help";
	}
	
	@GetMapping("/saveRaisedTicket")
	public String updateHelp(ModelMap model,@ModelAttribute("help") helpDetails help) throws ClassNotFoundException, SQLException, IOException, ParseException {
		helpDao.updatehelpDetails(help);
		model.addAttribute("customerName", help.getCustomerName());
		model.addAttribute("date", date.todayDate());
		model.addAttribute("message", "Ticket Raised Successfully!");
		return "help";
	}
	
	@GetMapping("/viewRaisedTicket")
	public String viewRaisedTicket(ModelMap model, @RequestParam String customerName) throws ClassNotFoundException, SQLException, IOException, ParseException {
		List<helpDetails> helps = new ArrayList<>();
		helps=helpDao.getHelpDetails();
		model.addAttribute("customerName", customerName);
		model.addAttribute("help",helps);
		return "viewRaisedTicket";
	}
	
	
	@ModelAttribute("medicineList")
	public List<String> getMedicines() throws ClassNotFoundException, SQLException, IOException, ParseException {
		List<String> medicineList = new ArrayList<String>();
		List<MedicineDetails> medicine=new ArrayList<>();
		medicine=medicineDao.getMedicineDetails();
		for(MedicineDetails med:medicine) {
			medicineList.add(med.getMedicineName());
		}
		return medicineList;
	}
}
