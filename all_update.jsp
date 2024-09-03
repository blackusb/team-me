<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
	<html>
	<head>
		<meta charset="UTF-8">
		<title>회원수정 처리기</title>
	</head>
	<body>
		<%
			request.setCharacterEncoding("utf-8");

			String m_num=request.getParameter("m_num");
			String name=request.getParameter("name");
			String phone=request.getParameter("phone");
			String email=request.getParameter("email");
			String address=request.getParameter("address");
			
			String sql="update member set phone=?, email=?, address=? where m_num=?;";		
			
			Connection conn=null;
			PreparedStatement pstmt=null;
			
			String url="jdbc:mysql://127.0.0.1:3306/team";	
			String db_id="root";
			String db_pw="iotiot";

			try{
				Class.forName("com.mysql.cj.jdbc.Driver");
				conn=DriverManager.getConnection(url, db_id, db_pw);	//매개변수가 3개인 메서드.

				pstmt=conn.prepareStatement(sql);
	            pstmt.setString(1, phone);
	            pstmt.setString(2, email);
	            pstmt.setString(3, address);
	            pstmt.setString(4, m_num);
	            pstmt.executeUpdate();
	            
				response.sendRedirect("all.jsp");
			}catch(Exception e){
				System.out.println("all_update.jsp 접속 중 오류발생 : "+e);
			}finally{
				try{
					if(pstmt!=null)pstmt.close();
					if(conn!=null)conn.close();
				}catch(Exception ex){
					System.out.println("all_update.jsp 접속 해제 중 오류발생 : "+ex);
				}
			}
		%>
	</body>
</html>