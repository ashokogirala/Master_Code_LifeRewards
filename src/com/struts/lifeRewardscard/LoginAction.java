package com.struts.lifeRewardscard;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings("serial")
public class LoginAction extends ActionSupport {
	private String username;
	private String password;

	public String execute() {
		String user = this.username;
		String pwd = this.password;
		Boolean passOrFail = verifyUser(user, pwd);
		if (passOrFail) {
			return "success";
		} else {
			return "error";
		}
		/*
		 * if (this.username.equals("admin")) { if
		 * (this.password.equals("admin123")) {
		 * addActionMessage("You are valid user!"); return "success"; } else {
		 * addActionError("please enter correct password"); return "error"; } }
		 * else { addActionError("I don't know you, dont try to hack me!");
		 * return "error"; }
		 */
	}

	public Boolean verifyUser(String user, String pwd) {
		Boolean b = false;
		Connection c = null;
		try {
			c = Conexion.getConnection();
			Statement statement = c.createStatement();
			String s = "select count(*) passOrFail from t_user where user_name = '" + user+"'";
			System.out.println(s);
			ResultSet rs = statement.executeQuery(s);
			int g = 0;
			while (rs.next()) {
				g = rs.getInt("passOrFail");
			}
			if (g != 0) {
				b = true;
			} else {
				b = false;
			}
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return b;

	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
}