<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
	<html>
	<head>
		<meta charset="UTF-8">
		<title>회원 정보 수정</title>
		<link rel="stylesheet" href="css/header.css">
		<style>
			
		</style>
	</head>
	<body>
		<div id="wrap">
			<jsp:include page="header.jsp"></jsp:include>
			<div class="contents">
				<div class="title">
					<h2>회원 정보 수정</h2>
				</div>		
				<%		
						String m_num=request.getParameter("m_num");

						Connection conn=null;
						Statement stmt=null;
						ResultSet rs=null;
						
						String url="jdbc:mysql://127.0.0.1:3306/team";
						String db_id="root";
						String db_pw="iotiot";
						
						Class.forName("com.mysql.cj.jdbc.Driver");
						conn=DriverManager.getConnection(url, db_id, db_pw);				
						String sql="select * from member where m_num ='"+m_num+"'";
						stmt=conn.createStatement();
						System.out.println(sql);
						rs=stmt.executeQuery(sql);
						
						String name="";
						String join_date="";
						String phone="";
						String email="";
						String address="";
						
						if(rs.next()){
							name=rs.getString("name");
							join_date=rs.getString("join_date");
							phone=rs.getString("phone");
							email=rs.getString("email");
							address=rs.getString("address");
						}
					%>
					
			<form name="modify" method="post" action="all_update.jsp">	
				
				<div class="data">
					<span>사&nbsp;&nbsp;&nbsp;&nbsp;번</span><input type="text" name="m_num" value=<%=m_num %>><br>
					<span>이&nbsp;&nbsp;&nbsp;&nbsp;름</span><input type="text" name="name" value=<%=name %>><br>
					<span>비밀번호</span><input type="text" name="pw"><br>
					<span>입&nbsp;사&nbsp;일</span><input type="text" name="join_date" value=<%=join_date %>><br>
				    <span>연&nbsp;락&nbsp;처</span><input type="text" name="phone" value=<%=phone %>><br>
					<span>이&nbsp;메&nbsp;일</span><input type="email" name="email" name="email" value=<%=email %>><br> 
					<span>주&nbsp;&nbsp;&nbsp;&nbsp;소</span><input type="text" name="address" value=<%=address %>><br>
				</div>
				<div class="btn">
					<input type="reset" value="초기화">
					<input type="submit" value="수정">
					<a href="all.jsp">
						<input type="button" value="전체사원목록">
					</a>
				</div>
			</form>
				
			</div><!-- 컨텐츠 끝 -->
		</div><!-- wrap 끝 -->
	</body>
</html>