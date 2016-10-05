package kr.or.kosta.Dao.Admin;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import kr.or.kosta.Dto.Custumer.CustermerDTO;

public class AdminDAO {
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
	
	public List<CustermerDTO> mainlist(){
		System.out.println("메인리스트 DAO단 시작합니다");
		List<CustermerDTO> list=null;

		try{
			conn = ds.getConnection();
			String sql="SELECT member_id, member_name, member_phone, m_loginok, member_redate, member_grade, member_okdate, SHOP_CODE FROM member";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			list=new ArrayList<CustermerDTO>();
			
			while(rs.next()){
				System.out.println("데이터 담기 시작");
				String member_id = rs.getString("member_id");
				String member_name= rs.getString("member_name");
				String member_phone = rs.getString("member_phone");
				String m_loginok =	rs.getString("m_loginok");
				String member_okdate = rs.getString("member_okdate");
				String member_redate = rs.getString("member_redate");
				int member_grade = rs.getInt("member_grade");
				String SHOP_CODE = rs.getString("SHOP_CODE");
				
				CustermerDTO cdto = new CustermerDTO(member_id, member_name, member_phone, m_loginok, member_redate, member_okdate, member_grade, SHOP_CODE);
				list.add(cdto);
			}

		}catch(Exception e){
			System.out.println(e.getMessage());
		}finally{
			try {
				if (rs != null) rs.close();
				if (pstmt != null) pstmt.close();
				if (conn != null) conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}	
		}
		return list;
	}
	
	public List<CustermerDTO> modify(String id){
		List<CustermerDTO> list=new ArrayList<CustermerDTO>();
		try{
			conn = ds.getConnection();
			String sql="SELECT member_id, member_name, member_phone, m_loginok, member_redate, member_grade, SHOP_CODE FROM member WHERE member_id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				String member_id  = rs.getString("member_id");
				String member_name= rs.getString("member_name");
				String member_phone = rs.getString("member_phone");
				String m_loginok =	rs.getString("m_loginok");
				String member_redate = rs.getString("member_redate");
				int member_grade = rs.getInt("member_grade");
				String SHOP_CODE = rs.getString("SHOP_CODE");
				
				CustermerDTO cdto = new CustermerDTO(member_id, member_name, member_phone, m_loginok, member_redate, member_grade, SHOP_CODE);
				list.add(cdto);
			}

			
		}catch(Exception e){
			
		}finally{
			try {
				if (rs != null) rs.close();
				if (pstmt != null) pstmt.close();
				if (conn != null) conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}	
		}
		System.out.println("수정할 아이템 사이즈 : " + list.size());
		return list;
	}
	
	
	public int ModifyOk(CustermerDTO dto) throws SQLException{
		int row=0;
		try{
			conn=ds.getConnection();
			String sql = "update member set member_name=?, member_phone=?, m_loginok=?, member_grade=?, SHOP_CODE=?, member_okdate=sysdate, member_okid ='admin' WHERE member_id=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, dto.getmember_name());
			pstmt.setString(2, dto.getmember_phone());
			pstmt.setString(3, dto.getm_loginok());
			pstmt.setInt(4, dto.getmember_grade());
			pstmt.setString(5, dto.getSHOP_CODE());
			pstmt.setString(6, dto.getmember_id());
			
			row=pstmt.executeUpdate();
			System.out.println("반영된 row : " + row);
			
			if(row<0){
				return -1;
			}
		}catch(Exception e){
			System.err.println(e.getMessage());
		}finally{
			if (pstmt != null) pstmt.close();
			if (conn != null) conn.close();
		}
		
		return row;
	}
	
	public int InsertShop(String SHOP_CODE , String SHOP_NAME, String SHOP_ADDR ,String SHOP_REPRE	,String SHOP_BRN, String SHOP_PHONE){
		int resultrow = 0;
		 try{
			conn=ds.getConnection();
	        String sql = "Insert into shop(SHOP_CODE,SHOP_NAME,SHOP_ADDR,SHOP_REPRE,SHOP_BRN,SHOP_PHONE,SHOP_REDATE) values(?,?,?,?,?,?,sysdate)"; 
	        pstmt = conn.prepareStatement(sql); 
	        pstmt.setString(1,SHOP_CODE); 
	        pstmt.setString(2,SHOP_NAME); 
	        pstmt.setString(3,SHOP_ADDR);
	        pstmt.setString(4,SHOP_REPRE); 
	        pstmt.setString(5,SHOP_BRN);   
	        pstmt.setString(6,SHOP_PHONE); 
	        
	        resultrow =pstmt.executeUpdate(); 
	        
	        //[5] 자원 반납 
	        if(pstmt!=null) pstmt.close(); 
		 }catch(Exception e){ 
			 System.out.println("오류"+e.getMessage());
		 } 
		 return resultrow;
		 
	}
	        
 
	            
	        
	
	
	
}
