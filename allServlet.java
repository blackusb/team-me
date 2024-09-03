package controller;

import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;
import DAO.MemberDAO;
import DTO.MemberDTO;
import com.oreilly.servlet.*;
import com.oreilly.servlet.multipart.*;
import java.sql.*;


@WebServlet("/all.do")
public class allServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("all.jsp").forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		process(request, response, "POST");
		
	}
	
	protected void process(HttpServletRequest request, HttpServletResponse response, String method) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/xml");
		
		String m_num=request.getParameter("m_num");
		//String phone=request.getParameter("phone");
		
		String responseText="받아온 m_num: "+m_num;
		System.out.println(responseText);
		
		
		/////////////////
		/*
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		String url="jdbc:mysql://127.0.0.1:3306/team";
		String db_id="root";
		String db_pw="iotiot";
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn=DriverManager.getConnection(url, db_id, db_pw);
			String sql="select * from member where m_num = ?";
			//String sql="update member set phone = ? where m_num = ?";
            pstmt = conn.prepareStatement(sql);
            //pstmt.setString(1, phone);
            pstmt.setString(1, m_num);
            rs=pstmt.executeQuery();
            
            PrintWriter out=response.getWriter();

            if (rs.next()) {
                // 응답을 쿼리 문자열 형태로 구성
                String responseText = "m_num=" + rs.getString("m_num") +
                                      "&name=" + rs.getString("name") +
                                      "&join_date=" + rs.getString("join_date") +
                                      "&phone=" + rs.getString("phone") +
                                      "&email=" + rs.getString("email") +
                                      "&address=" + rs.getString("address");
                out.println(responseText);
            } else {
                out.println("error=No data found");
            }
            out.close();
			
		}catch(Exception e) {
			System.out.println("all 서블릿 접속 중 오류 발생 : "+e);
		}finally {
			try {
				if(rs!=null)rs.close();
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
			}catch(Exception ex) {
				System.out.println("all 접속 해제 중 오류 발생 : "+ex);
			}
		}
		*/
		
		
		
		
		

		PrintWriter out=response.getWriter();
		out.println(responseText);
		out.close();

	}

}
