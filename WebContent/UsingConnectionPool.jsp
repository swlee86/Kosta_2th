<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.Context"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TomcatPool 설정 확인하기</title>
</head>
<body>
	<h3>Tomcat dbcp</h3>
	<%
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		///// context.xml 기술된 connection pool 사용
		Context context = new InitialContext();
		//약속된 표현 : (java:comp/env)
		//context.xml Resource > name=jdbc/oracle";
		DataSource datasource = (DataSource)context.lookup("java:comp/env/jdbc/oracle");
		conn = datasource.getConnection();
		/////////////////////////////////////////
		//나머지 코드는 기존과 동일
		//out.print("DB 연결 여부 : " + conn.isClosed()+"<br>");
		//conn.close();
		//out.print("close 후 연결 : " + conn.isClosed());
		
		if(conn.isClosed()==false){
			out.print("상태 메세지 : DB 연결 완료 !! 이제 작업하세요~!!"+"<br><br>");
		}
		
		out.print("...서버 연결 종료하는 중..."+"<br><br>");
		conn.close();
		
		if(conn.isClosed()==true){
			out.print("상태 메세지 : DB연결 테스트를 종료합니다."+"<br>");
		}
		
	%>
</body>
</html>