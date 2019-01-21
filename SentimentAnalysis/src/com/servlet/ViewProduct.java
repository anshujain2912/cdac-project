package com.servlet;



import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.objects.Product;

/**
 * Servlet implementation class DummyServlet
 */
@WebServlet("/ViewServlet")
public class ViewProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public ViewProduct() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		Connection con=(Connection)getServletContext().getAttribute("DBConnection");
		PreparedStatement ps=null;
		ResultSet rs=null;
		try {
		ps=con.prepareStatement("select title,description,image_url,creator_id from product where id=1");
		rs=ps.executeQuery();
		while(rs!=null && rs.next()) {
			Product product1=new Product(rs.getString("title"),rs.getString("description"),rs.getInt("creator_id"),rs.getString("image_url"));
			System.out.println(product1.toString());
			HttpSession session=request.getSession();
			session.setAttribute("Product", product1);
			response.sendRedirect("ViewProduct.jsp");
		}
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
