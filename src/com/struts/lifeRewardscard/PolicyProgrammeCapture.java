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

public class PolicyProgrammeCapture extends ActionSupport implements ModelDriven {
	PolicyCaptureForm captureForm = new PolicyCaptureForm();

	public String execute() throws Exception {
		HttpServletRequest request = ServletActionContext.getRequest();
		if(captureForm.getProduct().equalsIgnoreCase("Card Holder")){
		String prgmid = setPolicyDetails();		
		if(prgmid != null){
			request.setAttribute("progId", prgmid);
			return "success";
			}else
			{
			return "same";
			}
		}else
		{
			String prgmid = setPolicyDetails();		
			if(prgmid != null){
				request.setAttribute("progId", prgmid);
				return "success";
				}else
				{
				return "covered";
				}
		}

	}
	
	public String setPolicyDetails() {

		Connection c = null;
		String prgm_no = null;
		try {
			c = Conexion.getConnection();
			CallableStatement cst = c
					.prepareCall("{call P_SET_POLICY_PROGRAM(?,?,?,?,?,?,?,?,?)}");
			cst.setString(1, captureForm.getClientNo());	
			cst.setString(2,captureForm.getCompanyName());
			cst.setString(3, captureForm.getLifewardsCard());
			cst.setString(4, captureForm.getPolicyCode());
			cst.setString(5, captureForm.getDoc());
			cst.setString(6, captureForm.getProduct());
			cst.setString(7, captureForm.getExpiryDate());
			cst.setString(8,captureForm.getPremium());
			cst.registerOutParameter(9, OracleTypes.NUMBER);
			cst.executeUpdate();
			prgm_no=cst.getString(9);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return prgm_no;
	}

	@Override
	public Object getModel() {
		return captureForm;
	}

	public PolicyCaptureForm getPsform() {
		return psform;
	}

	public void setPsform(PolicyCaptureForm psform) {
		this.psform = psform;
	}

	private PolicyCaptureForm psform;

}
