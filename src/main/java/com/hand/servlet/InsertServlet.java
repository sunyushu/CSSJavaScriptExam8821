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
 * Servlet implementation class insertServlet
 */
@WebServlet("/insertServlet")
public class InsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertServlet() {
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
		String newTitle=request.getParameter("title");
		String newDescription=request.getParameter("description");
		int newLanguage_id=Integer.parseInt(request.getParameter("language"));
		System.out.println(newTitle+"   "+newDescription+"    "+newLanguage_id);
		Connection conn;
		try {
			
			conn = MysqlConnection.getConnection();
			if(SqlQuery.insert(conn, newTitle,newDescription,newLanguage_id)){
				JOptionPane.showMessageDialog(null, "插入成功");
				response.sendRedirect("select.jsp");
			}
			else{
				JOptionPane.showMessageDialog(null, "插入失败");
				response.sendRedirect("select.jsp");
			}
			
			
			
			
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
