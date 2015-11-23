package com.struts.lifeRewardscard;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Map;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.SessionAware;

import oracle.jdbc.driver.OracleTypes;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.struts.lifeRewardscard.CardHolderForm;

public class CardHolderRegistration extends ActionSupport implements ModelDriven{
	
	CardHolderForm cardform=new CardHolderForm();
	public String execute() throws Exception{
		String clientId=null;
		HttpServletRequest request = ServletActionContext.getRequest();
		clientId=saveCardHolderDetails();
		if(clientId != null){
		request.setAttribute("clientId", clientId);
		return "success";
		}else
		{
		return "same";
		}
	}

	@Override
	public Object getModel() {
		// TODO Auto-generated method stub
		return cardform;
	}
	public String saveCardHolderDetails() {
		
		Connection c = null;
		String clientId=null;
		String gender=null;
		if(cardform.getGender().equalsIgnoreCase("male"))
		{
			gender="M";
		}else
		{
			gender="F";
		}
		
		try {
			c = Conexion.getConnection();
            CallableStatement cst = 
                    c.prepareCall("{call p_ins_card_holder(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}");
            cst.setString(1,cardform.getCustIdNum());
            cst.setString(2, cardform.getPassport());
            cst.setString(3,cardform.getCountry());
            cst.setString(4, cardform.getFirstName());
            cst.setString(5, cardform.getMiddleName());
            cst.setString(6, cardform.getLastName());             
            cst.setString(7,cardform.getDob());            
            cst.setString(8,gender);
            cst.setString(9,cardform.getOfficeNo());
            cst.setString(10,cardform.getMobileNo());
            cst.setString(11, cardform.getHomeNo());
            cst.setString(12,cardform.getEmail());
            cst.setString(13,cardform.getPostalId());
            cst.setString(14,cardform.getCity());
            cst.setString(15,cardform.getAddress());
            cst.setString(16,cardform.getState());
            cst.registerOutParameter(17, OracleTypes.VARCHAR);
            cst.executeUpdate();
			
            clientId=cst.getString(17);

            cardform.setClientNo(clientId);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return clientId;
	}	
	
}
