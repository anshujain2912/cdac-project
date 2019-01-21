package com.config;

import java.sql.SQLException;
import java.sql.Connection;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextListener;
import javax.servlet.ServletContextEvent;
import javax.servlet.annotation.WebListener;

@WebListener
public class AppContextListner implements ServletContextListener{
	public void contextInitialized(ServletContextEvent servletContextEvent) {
		ServletContext ctx=servletContextEvent.getServletContext();
		String url=ctx.getInitParameter("dbUrl");
		String user=ctx.getInitParameter("dbUser");
		String password=ctx.getInitParameter("dbPassword");
		try {
			DBConnectionManager connectionManager=new DBConnectionManager(url,user,password);
			ctx.setAttribute("DBConnection", connectionManager.getConnection());
		}
		catch(ClassNotFoundException e) {
			e.printStackTrace();
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
	}
	public void connectionDestroyed(ServletContextEvent servletContextEvent) {
		Connection con=(Connection)servletContextEvent.getServletContext().getAttribute("DBConnection");
		try {
			con.close();
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
	}
}
