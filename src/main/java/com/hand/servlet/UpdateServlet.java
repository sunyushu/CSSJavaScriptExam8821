package com.hand.servlet;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;

import com.hand.sql.MysqlConnection;
import com.hand.sql.SqlQuery;

/**
 * Servlet implementation class UpdateServlet
 */
@WebServlet("/UpdateServlet")
public class UpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String line=request.getParameter("customer_id");
		String newfirst_name=request.getParameter("first_name");
		String newlast_name=request.getParameter("last_name");
		String newaddress_id=request.getParameter("address_id");
		String newemail=request.getParameter("email");
		String newlast_update=request.getParameter("last_update");

		
//		System.out.println(line+"      "+newTitle+"      "+newDescription+"      "+newLanguage);
		Connection conn;
		try {
			conn = MysqlConnection.getConnection();
			if(SqlQuery.update(conn, line, newfirst_name, newlast_name, newaddress_id,newemail,newlast_update)){
				JOptionPane.showMessageDialog(null, "更新成功");
				response.sendRedirect("admin.jsp");
			}
			else{
				JOptionPane.showMessageDialog(null, "更新失败");
				response.sendRedirect("admin.jsp");
			}
			
			
			
			
			
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}

}
