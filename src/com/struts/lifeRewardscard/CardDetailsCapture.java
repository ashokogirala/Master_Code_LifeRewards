package com.struts.lifeRewardscard;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.text.DateFormat;
import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class CardDetailsCapture extends ActionSupport implements ModelDriven {
	CardDetailsForm cardDetForm=new CardDetailsForm();
	public String execute() throws Exception {
		HttpServletRequest request = ServletActionContext.getRequest();
		
		Boolean Success= setCardDetails();
		if(Success){
			request.setAttribute("regSuccess", Success);
		}
		return "success";

	}

	private Boolean setCardDetails() {
		Connection c = null;
		Boolean card = false;
		try {
					
			DateFormat inputFormat = new SimpleDateFormat("dd-MMM-yyyy");

			// Format date into output format
			DateFormat outputFormat = new SimpleDateFormat("MMyyyy");
			c = Conexion.getConnection();
			CallableStatement cst = c
					.prepareCall("{call P_SET_CARD_DETAILS(?,?,?,?)}");
			cst.setString(1, cardDetForm.getClientNo());	
			cst.setString(2,cardDetForm.getLifewardsCard());
			System.out.println(outputFormat.format(inputFormat.parse(cardDetForm.getCardExpiryDate())));
			cst.setString(3, outputFormat.format(inputFormat.parse(cardDetForm.getCardExpiryDate())));
			cst.setString(4, cardDetForm.getStatus());
		
			cst.executeUpdate();
			card=true;
		} catch (Exception e) {
			e.printStackTrace();
		}

		return card;
	}

	@Override
	public Object getModel() {
		// TODO Auto-generated method stub
		return cardDetForm;
	}
}
