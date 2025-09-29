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
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.cognizant.healthCare.dao.AdminDetailsDaoSql;
import com.cognizant.healthCare.dao.CartDetalsDaoSql;
import com.cognizant.healthCare.dao.CustomerDetailsDaoSql;
import com.cognizant.healthCare.dao.MedicineDetailsDaoSql;
import com.cognizant.healthCare.dao.NotificationDaoSql;
import com.cognizant.healthCare.dao.OrderDetailsDaoSql;
import com.cognizant.healthCare.dao.OrderedMedicineDaoSql;
import com.cognizant.healthCare.dao.helpDetailsDaoSql;
import com.cognizant.healthCare.model.AdminDetails;
import com.cognizant.healthCare.model.MedicineDetails;
import com.cognizant.healthCare.model.helpDetails;
import com.cognizant.healthCare.model.orderDetails;
import com.cognizant.healthCare.service.PharmaPaymentService;

@Controller
public class AdminController {
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
	helpDetailsDaoSql helpDao;
	@Autowired
	NotificationDaoSql notificationDao;
	

	@GetMapping("/home")
	public String homePage(ModelMap model) {
		return "homePage";
	}

	@GetMapping("/admin")
	public String adminRegistration(ModelMap model) {
		model.addAttribute("admin", new AdminDetails());
		return "adminRegistrationPage";
	}

	@GetMapping("/adminRegistration")
	public String registerAdminDetails(ModelMap model, @ModelAttribute("admin") AdminDetails adminDetails,BindingResult result)
			throws ClassNotFoundException, SQLException, IOException, ParseException {
		adminDao.updateAdminDetails(adminDetails);
		model.addAttribute("message", "Your details are submitted successfully! Please login to continue.");
		return "adminRegistrationPage";
	}

	@GetMapping("/adminLoginPage")
	public String adminLoginPage(ModelMap model) {
		return "adminLoginPage";
	}

	@PostMapping("/adminLogin")
	public String adminLogin(ModelMap model, @RequestParam String userName, @RequestParam String password)
			throws ClassNotFoundException, SQLException, IOException, ParseException {
		boolean message = paymentService.checkUserNameAndPasswordAdmin(userName, password);
		if (message) {
			List<String> list=notificationDao.getNotifications();
			if(list.isEmpty());
			else {
				model.addAttribute("value", 100);
				model.addAttribute("notification", list);
			}
			model.addAttribute("username", userName);
			return "adminHomePage";
		}

		else {
			model.addAttribute("errorMessage", "Invalid User ID (or) Incorrect Password");
			return "adminLoginPage";
		}
	}
	
	@GetMapping("/resetPasswordAdmin")
	public String adminPasswordReset(ModelMap model) {
		return "adminForgetPassword";
	}
	
	@PostMapping("/updatePassword")
	public String adminResetPassword(ModelMap model, @RequestParam String userName,@RequestParam String securityQuestion,@RequestParam String securityAnswer, @RequestParam String password)
			throws ClassNotFoundException, SQLException, IOException, ParseException {
		boolean message = paymentService.checkSecurityQuestionAdmin(userName, password, securityQuestion, securityAnswer);
		if (message) {
			model.addAttribute("message", "Password Updated Successfully, Please login to continue!");
			return "adminForgetPassword";
		}

		else {
			model.addAttribute("errorMessage", "Invalid Security Question (or) Incorrect Security Answer");
			return "adminForgetPassword";
		}
	}

	
	@GetMapping("/adminHomePage")
	public String adminhomePage(ModelMap model) throws ClassNotFoundException, SQLException, IOException {
		notificationDao.truncateNotification();
		return "adminHomePage";
	}

		
	@GetMapping("/medicineInformation")
	public String addMedicine(ModelMap model) throws ClassNotFoundException, SQLException, IOException, ParseException {
		List<MedicineDetails> medicine=new ArrayList<>();
		medicine=medicineDao.getMedicineDetails();
		model.addAttribute("medicineDetails", medicine);
		return "MedicineInformation";
	}
	
	@GetMapping("/editMedicineInformation")
	public String getMenuItem(ModelMap model, @RequestParam int medicineId) throws ClassNotFoundException, SQLException, IOException, ParseException {
		model.addAttribute("medicine", medicineDao.getMedicineDetailsById(medicineId));
		model.addAttribute("medicineDetails", new MedicineDetails());
		return"editMedicineInformation";
	}
	
	@GetMapping("/saveEditedMedicineInformation")
	public String editMenuItem(ModelMap model, @ModelAttribute("medicineDetails") MedicineDetails medicineDetails) throws ClassNotFoundException, SQLException, IOException, ParseException {
		medicineDao.updateMedicineDetails(medicineDetails);
		model.addAttribute("message","Saved Successfully!!!!");
		return "editMedicineInformation";
	}
	
	
	@GetMapping("/removeMedicineInformation")
	public String removeMedicineInformation(ModelMap model, @RequestParam int medicineId) throws ClassNotFoundException, SQLException, IOException, ParseException {
		medicineDao.deleteMedicineInformation(medicineId);
		model.addAttribute("message","Medicine Removed Successfully!");
		List<MedicineDetails> medicine=medicineDao.getMedicineDetails();
		model.addAttribute("medicineDetails", medicine);
		return"MedicineInformation";
	}
	
	@GetMapping("/addNewMedicine")
	public String addNewMedicine(ModelMap model) throws ClassNotFoundException, SQLException, IOException, ParseException {
		model.addAttribute("medicine", new MedicineDetails());
		return "addNewMedicinePage";
	}
	
	@GetMapping("/submitAddedMedicine")
	public String saveNewMedicine(ModelMap model, @ModelAttribute("medicine") MedicineDetails medicineDetails ) throws ClassNotFoundException, SQLException, IOException, ParseException {
		medicineDao.addMedicineDetails(medicineDetails);
		model.addAttribute("message", "Added Successfully!");
		return "addNewMedicinePage";
	}

	@GetMapping("/updateStock")
	public String updateStock(ModelMap model) throws ClassNotFoundException, SQLException, IOException, ParseException {
		List<MedicineDetails> medicine=new ArrayList<>();
		medicine=medicineDao.getMedicineDetails();
		model.addAttribute("medicineDetails", medicine);
		return "updateStock";
	}
	
	@GetMapping("/editStock")
	public String editStockPage(ModelMap model, @RequestParam String medicineName) throws ClassNotFoundException, SQLException, IOException, ParseException {
		int stock=medicineDao.getStockDetails(medicineName);
		model.addAttribute("medicineName", medicineName);
		model.addAttribute("stock", stock);
		return "stockEditPage";
	}
	
	@PostMapping("/saveEditedStock")
	public String editMedicineStock(ModelMap model, @RequestParam String medicineName,@RequestParam int stock) throws ClassNotFoundException, SQLException, IOException, ParseException {
		medicineDao.updateStockDetails(medicineName, stock);
		List<MedicineDetails> medicine=new ArrayList<>();
		medicine=medicineDao.getMedicineDetails();
		model.addAttribute("medicineDetails", medicine);
		model.addAttribute("message", "Stock Updated successfully!!");
		return "updateStock";
	}
	@GetMapping("/viewStock")
	public String viewStock(ModelMap model) throws ClassNotFoundException, SQLException, IOException, ParseException {
		List<MedicineDetails> medicine=new ArrayList<>();
		medicine=medicineDao.getMedicineDetails();
		model.addAttribute("medicineDetails", medicine);
		return "viewStock";
	}
	
	
	@GetMapping("/searchByType")
	public String viewStockbasedOnType(ModelMap model,@RequestParam String type) throws ClassNotFoundException, SQLException, IOException, ParseException {
		List<MedicineDetails> medicine=new ArrayList<>();
		medicine=medicineDao.getMedicineDetails(type);
		model.addAttribute("medicineDetails", medicine);
		return "viewStock";
	}
	
	
	@GetMapping("/viewOrder")
	public String viewOrders(ModelMap model) throws ClassNotFoundException, SQLException, IOException, ParseException {
		List<orderDetails> orders = new ArrayList<>();
		orders=orderDao.getOrderDetails();
		List<HashMap<String, Integer>> medicineList = new ArrayList<HashMap<String, Integer>>();
		medicineList=orderDao.getorderedMedicines(orders);
		model.addAttribute("order", orders);
		model.addAttribute("medicineList", medicineList);
		return "viewOrder";
	}
	
	@GetMapping("/updateStatus")
	public String updateStatus(ModelMap model, @RequestParam int orderId) throws ClassNotFoundException, SQLException, IOException, ParseException {
		model.addAttribute("orderId", orderId);
		return "updateStatusPage";
	}
	
	@PostMapping("/saveUpdatedStatus")
	public String saveUpdatedStatus(ModelMap model, @RequestParam int orderId,@RequestParam String status) throws ClassNotFoundException, SQLException, IOException, ParseException {
		orderDao.updateStatus(orderId, status);
		model.addAttribute("message", "Status Updated successfully!!");
		return "updateStatusPage";
	}
	
	@GetMapping("/generateReport")
	public String generateReport(ModelMap model) throws ClassNotFoundException, SQLException, IOException, ParseException {
		List<MedicineDetails> medicine=new ArrayList<>();
		medicine=medicineDao.getMedicineDetails();
		model.addAttribute("medicineDetails", medicine);
		return "generateReport";
	}
	
	@GetMapping("/brandReport")
	public String brandWise(ModelMap model) throws ClassNotFoundException, SQLException, IOException, ParseException {
		List<MedicineDetails> medicine=new ArrayList<>();
		medicine=medicineDao.getMedicineDetails();
		model.addAttribute("medicineDetails", medicine);
		return "brandReport";
	}
	
	@GetMapping("/dateReport")
	public String dateWise(ModelMap model) throws ClassNotFoundException, SQLException, IOException, ParseException {
		List<MedicineDetails> medicine=new ArrayList<>();
		medicine=medicineDao.getMedicineDetails();
		model.addAttribute("medicineDetails", medicine);
		return "dateReport";
	}
	
	@GetMapping("/diseaseReport")
	public String diseaseWise(ModelMap model) throws ClassNotFoundException, SQLException, IOException, ParseException {
		List<MedicineDetails> medicine=new ArrayList<>();
		medicine=medicineDao.getMedicineDetails();
		model.addAttribute("medicineDetails", medicine);
		return "diseaseReport";
	}
	
	@GetMapping("/helpRequest")
	public String viewHelp(ModelMap model) throws ClassNotFoundException, SQLException, IOException, ParseException {
		List<helpDetails> help = new ArrayList<>();
		help=helpDao.getHelpDetails();
		model.addAttribute("help", help);
		return "viewHelp";
	}
	
	@GetMapping("/replyHelp")
	public String replyHelp(ModelMap model,@RequestParam int ticketId) throws ClassNotFoundException, SQLException, IOException, ParseException {
		model.addAttribute("id", ticketId);
		return "replyHelp";
	}
	
	@PostMapping("/saveReply")
	public String saveReply(ModelMap model, @RequestParam int ticketId,@RequestParam String reply) throws ClassNotFoundException, SQLException, IOException, ParseException {
		helpDao.updateHelp(ticketId, reply);
		model.addAttribute("message", "Status Updated successfully!!");
		return "replyHelp";
	}
	
	

}
