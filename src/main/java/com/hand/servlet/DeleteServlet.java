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
 * Servlet implementation class DeleteServlet
 */
@WebServlet("/DeleteServlet")
public class DeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteServlet() {
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
		String line=(String) request.getSession().getAttribute("line");
		Connection conn;
		try {
			
			conn = MysqlConnection.getConnection();
			if(SqlQuery.delete(conn, line)){
				JOptionPane.showMessageDialog(null, "删除成功");
				response.sendRedirect("admin.jsp");
			}
			else{
				JOptionPane.showMessageDialog(null, "删除失败");
				response.sendRedirect("admin.jsp");
			}
			
			
			
			
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}

}
