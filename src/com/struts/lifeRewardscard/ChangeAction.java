package com.struts.lifeRewardscard;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.text.DateFormat;
import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;

import oracle.jdbc.driver.OracleTypes;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class ChangeAction extends ActionSupport implements ModelDriven {
	CardStatusForm cardSform=new CardStatusForm();
	public String execute() throws Exception{
		String clientId=null;
		HttpServletRequest request = ServletActionContext.getRequest();
		getCardDetails();		
		return "success";
		
	}
	public String update() throws Exception{
		String clientId=null;
		HttpServletRequest request = ServletActionContext.getRequest();
		setCardDetails();		
		return "success";
		
	}

	private void setCardDetails() {
		Connection c = null;
		Boolean empty = true;
		
		try {
			c = Conexion.getConnection();
			CallableStatement cst = c
					.prepareCall("{call P_SET_CARD_DETAILS(?,?,?,?)}");
			cst.setString(1, cardSform.getClientNo());
			cst.setString(2, null);
			cst.setString(3, null);
			cst.setInt(4, cardSform.getStatus());
			
			cst.executeUpdate();
			

		} catch (Exception e) {
			e.printStackTrace();
		}

		
	}
	private void getCardDetails() {
		Connection c = null;
		Boolean empty = true;
		DateFormat inputFormat = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss.S");

		// Format date into output format
		DateFormat outputFormat = new SimpleDateFormat("dd-MMM-yyyy");
		try {
			c = Conexion.getConnection();
			CallableStatement cst = c
					.prepareCall("{call P_GET_CARD_DETAIILS(?,?)}");
			cst.setString(1, cardSform.getCustId());
			cst.registerOutParameter(2, OracleTypes.CURSOR);
			cst.executeUpdate();
			ResultSet rs = (ResultSet) cst.getObject(2);
			while (rs.next()) {
				cardSform.setLifewardsCard(rs.getString(1));
				cardSform.setClientNo(rs.getString(2));
				if(rs.getString(3).equalsIgnoreCase("active"))
				{
					cardSform.setStatus(1);
				}else
				{
					cardSform.setStatus(2);
				}
				
				cardSform.setCustName(rs.getString(4));
				cardSform.setCardExpiryDate(rs.getString(5));
				System.out.println(inputFormat.parse(rs.getString(6)));
				empty = false;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		
	}
	

	@Override
	public Object getModel() {
		// TODO Auto-generated method stub
		return cardSform;
	}
}
