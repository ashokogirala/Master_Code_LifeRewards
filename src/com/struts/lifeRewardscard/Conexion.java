package com.struts.lifeRewardscard;

import java.sql.Connection;
import java.sql.DriverManager;

public class Conexion {

    static Connection getConnection() throws Exception {

        String url = "jdbc:oracle:thin:@ivserver-260-u.blil.co.bw:1664:THITOB";        
        String driver = "oracle.jdbc.driver.OracleDriver";
        String userName = "lifesystem";
        String password = "lifesystempwd";

        Class.forName(driver).newInstance();
        Connection conn = DriverManager.getConnection(url, userName,password);

        return conn;
    }
}