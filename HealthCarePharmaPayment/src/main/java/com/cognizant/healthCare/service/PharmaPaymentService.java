package com.cognizant.healthCare.service;

import java.io.IOException;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cognizant.healthCare.dao.AdminDetailsDaoSql;
import com.cognizant.healthCare.dao.CustomerDetailsDaoSql;
import com.cognizant.healthCare.dao.MedicineDetailsDaoSql;
import com.cognizant.healthCare.dao.NotificationDaoSql;
import com.cognizant.healthCare.model.orderedMedicineDetails;

@Service
public class PharmaPaymentService {

	@Autowired
	AdminDetailsDaoSql adminDao;
	@Autowired
	CustomerDetailsDaoSql customerDao;
	@Autowired
	MedicineDetailsDaoSql medicineDao;
	@Autowired
	NotificationDaoSql notificationDao;

	public boolean checkUserNameAndPasswordAdmin(String userName, String password)
			throws ClassNotFoundException, SQLException, IOException {
		Map<String, String> adminIdAndPassword = new HashMap<>();
		adminIdAndPassword = adminDao.getAdminIdAndPassword();
		if (adminIdAndPassword.keySet().contains(userName)) {
			if (adminIdAndPassword.get(userName).equals(password)) {
				return true;
			}
		}
		return false;
	}

	public boolean checkUserNameAndPasswordCustomer(String userName, String password)
			throws ClassNotFoundException, SQLException, IOException {
		Map<String, String> customerIdAndPassword = new HashMap<>();
		customerIdAndPassword = customerDao.getCustomerIdAndPassword();
		if (customerIdAndPassword.keySet().contains(userName)) {
			if (customerIdAndPassword.get(userName).equals(password)) {
				return true;
			}
		}
		return false;

	}

	public boolean updateQuantity(orderedMedicineDetails medicine) throws ClassNotFoundException, SQLException, IOException {
		int originalStock=medicineDao.getStockDetails(medicine.getMedicine());
		int presentStock= originalStock-(medicine.getQuantity());
		medicineDao.updateStockDetails(medicine.getMedicine(), presentStock);
		String notification= medicine.getMedicine()+" is low in Stock";
		if(presentStock<=50) {
			notificationDao.updateNotification(notification);
		}
		return true;
	}
	
	public boolean checkSecurityQuestionAdmin(String userName, String password,String securityQuestion,String securityAnswer)
			throws ClassNotFoundException, SQLException, IOException {
		Map<String, String> securityQuestionAnswer = new HashMap<>();
		securityQuestionAnswer = adminDao.getSecurityQuestionAndAnswer(userName);
		if (securityQuestionAnswer.keySet().contains(securityQuestion)) {
			if (securityQuestionAnswer.get(securityQuestion).equals(securityAnswer)) {
				adminDao.updatePassword(userName, password);
				return true;
			}
		}
		return false;
	}
	
	public boolean checkSecurityQuestionCustomer(String userName, String password,String securityQuestion,String securityAnswer)
			throws ClassNotFoundException, SQLException, IOException {
		Map<String, String> securityQuestionAnswer = new HashMap<>();
		securityQuestionAnswer = customerDao.getSecurityQuestionAndAnswer(userName);
		if (securityQuestionAnswer.keySet().contains(securityQuestion)) {
			if (securityQuestionAnswer.get(securityQuestion).equals(securityAnswer)) {
				customerDao.updatePassword(userName, password);
				return true;
			}
		}
		return false;
	}


}
