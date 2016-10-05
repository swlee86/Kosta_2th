package kr.or.kosta.Dao.Custumer;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import kr.or.kosta.Dto.Custumer.CustermerDTO;

public class CustermerDAO {
	static DataSource ds;
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;

	static {
		InitialContext ctx;
		try {
			ctx = new InitialContext();
			Context envCtx = (Context) ctx.lookup("java:comp/env");
			ds = (DataSource) envCtx.lookup("/jdbc/oracle");
			System.out.println("DataSource loading success !");
		} catch (NamingException e) {
			System.out.println("lookup Fail : " + e.getMessage());
		}
	}
	
	public int registerOk(CustermerDTO dto) throws SQLException{
		int row=0;
		try{
			conn=ds.getConnection();
			String sql = "INSERT INTO member(member_id, member_pw, member_name, member_phone, m_loginok, member_redate, member_grade, SHOP_CODE)  VALUES(?,?,?,?,'n',sysdate,?,?)";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, dto.getmember_id());
			pstmt.setString(2, dto.getmember_pw());
			pstmt.setString(3, dto.getmember_name());
			pstmt.setString(4, dto.getmember_phone());
			pstmt.setInt(5, dto.getmember_grade());
			pstmt.setString(6, dto.getSHOP_CODE());
			row=pstmt.executeUpdate();
			
			if(row<0){
				return -1;
			}
		}catch(Exception e){
			System.out.println(e.getMessage());
		}finally{
			if (pstmt != null) pstmt.close();
			if (conn != null) conn.close();
		}
		
		return row;
	}
	
	public int loginOk(CustermerDTO dto){
		int row = 0;
		String m_loginok= null;
		try{
			conn=ds.getConnection();
			System.out.println("로그인 가능여부 체크 시작");
			
			String sql1="SELECT m_loginok from member where member_id=?";
			pstmt = conn.prepareStatement(sql1);
			pstmt.setString(1, dto.getmember_id());
			rs=pstmt.executeQuery();
			System.out.println("rs Data : " + rs);
			 while(rs.next()){
				 m_loginok=rs.getString("m_loginok");
				 System.out.println("m_loginok 값 : " + m_loginok);
		 		}

					if(m_loginok.equals("y")){
						String sql2 = "SELECT member_id, member_pw from member where member_id=? and member_pw=?";
						pstmt = conn.prepareStatement(sql2);
						pstmt.setString(1, dto.getmember_id());
						pstmt.setString(2, dto.getmember_pw());
						row = pstmt.executeUpdate();
					
						if(row>0){
							System.out.println("Login Success!");
							String sql3 = "SELECT member_grade FROM member where member_id=?";
							pstmt = conn.prepareStatement(sql3);
							pstmt.setString(1, dto.getmember_id());
							rs=pstmt.executeQuery();
							while(rs.next()){
								dto.setmember_grade(rs.getInt(1));
							}
							
						}else if(row==0){
							System.out.println("Login fail...please retry...");
						}
						}else{
							System.out.println("아이디 로그인 가능 여부 체크시 로그인 불가");
							row = -1;
						}
						

		}catch(Exception e){
			System.out.println(e.getMessage());
		}finally {
				try {
					if (pstmt != null) pstmt.close();
					if (conn != null) conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
		}
		System.out.println("최종 row : " + row);
		return row;
	}
	
}
