<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>전체사원 조회</title>
		<link rel="stylesheet" href="css/header.css">
		<style>
			table, th, td{
				border: 1px solid black;
				border-collapse: collapse;
			}
			th, td{
				padding: 10px;			
			}
			tr:hover{
				background: rgba(0,0,0,0.7);
				color: #fff;
			}
			tr:first-child:hover{
				background: #fff;
				color: #000;
			}
			span{
				display: inline-block;
				width: 90px;			
			}
			.button{
				cursor: pointer;
			}
			
			/* 팝업 */
			#wrap{
				/*position: relative;*/
			}
			.popup{
				width: 400px;
				height: 430px;
				background: #eee;
				border-radius: 20px;
				padding: 20px;
				position: absolute;
				top: 50%;
				left: 50%;
				transform: translate(-50%, -50%);
				display: none;
			}
		</style>
	</head>
	<body>
		<div id="wrap">
			<jsp:include page="header.jsp"></jsp:include>
			<div class="contents">
				<div class="title">
					<h2>전체사원 조회</h2>
				</div>
				<div>
					<%
						Connection conn=null;
						Statement stmt=null;
						ResultSet rs=null;
						
						String url="jdbc:mysql://127.0.0.1:3306/team";
						String db_id="root";
						String db_pw="iotiot";
						
						try{
							Class.forName("com.mysql.cj.jdbc.Driver");
							conn=DriverManager.getConnection(url, db_id, db_pw);
							String sql="select * from member;";
							stmt=conn.createStatement();
							System.out.println(sql);
							rs=stmt.executeQuery(sql);
							%>
								<div id="inner_wrap">
									<table>
										<tr>
											<th>사번</th>
											<th>이름</th>
											<th>입사일</th>
											<th>연락처</th>
											<th>이메일</th>
											<th>주소</th>
											<th>수정</th>
											<th>삭제</th>
										</tr>
							<%
							while(rs.next()){
								String m_num=rs.getString("m_num");
								String name=rs.getString("name");
								String join_date=rs.getString("join_date");
								String phone=rs.getString("phone");
								String email=rs.getString("email");
								String address=rs.getString("address");
							%>			<tr class="tr_length">
											<td><%=m_num %></td>
											<td><%=name %></td>
											<td><%=join_date %></td>
											<td class="phone"><%=phone %></td>
											<td class="email"><%=email %></td>
											<td><%=address %></td>
											<td>												
												<form method="post" action="all_modify.jsp">
													<input type="hidden" value="<%=m_num %>" name="m_num" class="m_num">
													<input type="submit" value="수정" class="modify">
												</form>
											</td>
											<td>
												<form method="post" action="all_delete.jsp">
													<input type="hidden" value="<%=m_num %>" name="delete">
													<input type="submit" value="삭제" class="delete">
												</form>
											</td>
										</tr>	
								<%
							}
							%>
									</table>
								</div>
							<%
						}catch(Exception e){
							System.out.println("접속 중 오류 발생 : "+e);
						}finally{	
							try{	
								if(rs!=null)rs.close();
								if(stmt!=null)stmt.close();
								if(conn!=null)conn.close();
							}catch(Exception ex){	
								System.out.println("접속 해제 중 오류 발생 : "+ex);
							}
						}
					%>
				</div>
				
				

				
			</div><!-- 컨텐츠 끝 -->
			

			
			<script>
				
				<%--
				//테이블의 class=".tr_length"인 행의 갯수.
				let tr=document.querySelectorAll(".tr_length");
				let tr_length=tr.length;
				console.log("행의 갯수 : "+tr_length);
				

				for(let i=0; i<tr_length; i++){
					document.getElementsByClassName("phone")[i].addEventListener("dblclick", function(){

						//phone
						//부모노드 가져와서 변수에 담기
						let phone=document.getElementsByClassName("phone")[i];
						let phoneValue=phone.innerHTML;
						console.log(phoneValue);
						
						//td안의 글자 지우기
						phone.innerHTML="";
						
						//input type="text" 만들기
						let input=document.createElement("input");
						input.type="text";
						input.value=phoneValue;
						
						//부모노드에 자식노드 붙이기
						phone.append(input);

					})
					
				}
				--%>
				
				
				
				
				

			</script>
		</div>
	</body>
</html>