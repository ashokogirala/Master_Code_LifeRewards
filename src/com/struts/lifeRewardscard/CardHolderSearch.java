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

public class CardHolderSearch extends ActionSupport implements ModelDriven {
	SearchForm sform = new SearchForm();

	public String execute() throws Exception {
		HttpServletRequest request = ServletActionContext.getRequest();
		Boolean srchSuccess = getPolicyDetails(sform.getCustomerId());
		if (srchSuccess == false) {
			return "success";
		} else {
			return "same";
		}

	}

	@Override
	public Object getModel() {
		// TODO Auto-generated method stub
		return sform;
	}

	public Boolean getPolicyDetails(String customerId) {

		Connection c = null;
		Boolean empty = true;
		DateFormat inputFormat = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss.S");

		// Format date into output format
		DateFormat outputFormat = new SimpleDateFormat("dd-MMM-yyyy");
		try {
			c = Conexion.getConnection();
			CallableStatement cst = c
					.prepareCall("{call P_GET_CARDHOLDER_DETAIILS(?,?)}");
			cst.setString(1, customerId);
			cst.registerOutParameter(2, OracleTypes.CURSOR);
			cst.executeUpdate();
			ResultSet rs = (ResultSet) cst.getObject(2);
			while (rs.next()) {
				sform.setLifewardsCard(rs.getString(1));
				sform.setClientNo(rs.getString(2));
				sform.setPolicyCode(rs.getString(3));
				sform.setDoc(outputFormat.format(inputFormat.parse(rs
						.getString(4))));
				System.out.println(outputFormat.format(inputFormat.parse(rs
						.getString(4))));
				sform.setProduct(rs.getString(5));
				sform.setExpiryDate(outputFormat.format(inputFormat.parse(rs
						.getString(6))));
				System.out.println(inputFormat.parse(rs.getString(6)));
				empty = false;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return empty;
	}

}
