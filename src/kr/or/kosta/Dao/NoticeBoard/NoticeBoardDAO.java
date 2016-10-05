package kr.or.kosta.Dao.NoticeBoard;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import kr.or.kosta.Dto.NoticeBoard.NoticeBoardDTO;

public class NoticeBoardDAO {
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
			System.out.println("DataSource loading success!");
		} catch (NamingException e) {
			System.out.println("lookup Fail : " + e.getMessage());
		}
	}

	public List<NoticeBoardDTO> list(int cpage, int pagesize) throws Exception {
		List<NoticeBoardDTO> list = null;
		try {
			System.out.println("NoticeBoardDAO");
			conn = ds.getConnection();
			String sql = " SELECT * FROM "
					+ "( SELECT ROWNUM rn , board_number , board_writer , board_title , board_content, board_date, board_file, board_file_size "
					+ " FROM (	SELECT * FROM board_hq ORDER  BY board_number DESC  ) "
					+ " ) WHERE rn BETWEEN ? AND ? ";

			int start = cpage * pagesize - (pagesize - 1);
			int end = cpage * pagesize;

			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);

			rs = pstmt.executeQuery();

			list = new ArrayList<NoticeBoardDTO>();
			while (rs.next()) {
				String board_number = rs.getString("board_number");
				String board_writer = rs.getString("board_writer");
				String board_title = rs.getString("board_title");
				String board_content = rs.getString("board_content");
				Date board_date = rs.getDate("board_date");
				String board_file = rs.getString("board_file");
				String board_file_size = rs.getString("board_file_size");

				NoticeBoardDTO bdto = new NoticeBoardDTO(board_number, board_writer, board_title, board_content, board_date, board_file, board_file_size);
						
				list.add(bdto);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null) pstmt.close();
				if (conn != null) conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}	
		}
		return list;
	}
	
	
	
	
	
	public int totalboardCount() throws SQLException{
		int totalcount = 0;
		try{
			conn = ds.getConnection();
			String sql = "select count(*) cnt from board_hq";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()){
				totalcount = rs.getInt("cnt");
			}
		}catch(Exception e){
			
		}finally{
			if(pstmt != null)try {pstmt.close();} catch (SQLException e) {}
			if(rs != null)try {rs.close();} catch (SQLException e) {}
			if(conn != null)try {conn.close();} catch (SQLException e) {}
		}
		return totalcount;
	}
	
	
	
	
	public NoticeBoardDTO getContent(String board_number) throws SQLException{
		conn = ds.getConnection();
		String sql ="select * from board_hq where board_number=?";
	  	pstmt = conn.prepareStatement(sql);
	  	pstmt.setString(1, board_number);
		
		rs =pstmt.executeQuery();
		NoticeBoardDTO bdto = null;
		try{
		if(rs.next()){
			String board_writer = rs.getString("board_writer");
			String board_title = rs.getString("board_title");
			String board_content = rs.getString("board_content");
			Date board_date= rs.getDate("board_date");
			String board_file = rs.getString("board_file");
			String board_file_size = rs.getString("board_file_size");

			bdto = new NoticeBoardDTO(board_writer, board_title, board_content, board_date, board_file, board_file_size);
		}
			
		}catch(Exception e){
			
		}finally{
			if(pstmt != null)try {pstmt.close();} catch (SQLException e) {}
			if(rs != null)try {rs.close();} catch (SQLException e) {}
			if(conn != null)try {conn.close();} catch (SQLException e) {}
		}
		
		return bdto;
		
	}
	
	public int NoticeWriteOk(NoticeBoardDTO bdto){
		int row = 0;
		try{
			conn = ds.getConnection();
			String sql = "insert into board_hq(board_number,board_writer,board_title,board_content,board_date,board_file,board_file_size) values(BOARD_HQ_NUM.nextval,?,?,?,sysdate,?,0)";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, bdto.getboard_writer());
			pstmt.setString(2, bdto.getboard_title());
			pstmt.setString(3, bdto.getboard_content());
			pstmt.setString(4, bdto.getboard_file());
			
			row = pstmt.executeUpdate();
			
		}catch(Exception e){
			System.out.println(e.getMessage());
		}finally{
			if(pstmt != null)try {pstmt.close();} catch (SQLException e) {}
			if(rs != null)try {rs.close();} catch (SQLException e) {}
			if(conn != null)try {conn.close();} catch (SQLException e) {}
		}
			
		return row;
	}
	
	public int NoticeEditOk(NoticeBoardDTO bdto){
		int row = 0;
		try{
			conn = ds.getConnection();
			String sql = "UPDATE board_hq SET board_title = ?, board_content=?, board_file=?, board_file_size=0 WHERE board_number=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, bdto.getboard_title());
			pstmt.setString(2, bdto.getboard_content());
			pstmt.setString(3, bdto.getboard_file());
			pstmt.setString(4, bdto.getboard_number());
			
			row = pstmt.executeUpdate();
			
		}catch(Exception e){
			System.out.println(e.getMessage());
		}finally{
			if(pstmt != null)try {pstmt.close();} catch (SQLException e) {}
			if(rs != null)try {rs.close();} catch (SQLException e) {}
			if(conn != null)try {conn.close();} catch (SQLException e) {}
		}
			
		return row;
	}
	
	public int deleteContent(String board_number) throws SQLException{
		int row = 0;
		try{
			conn = ds.getConnection();
			String sql = "DELETE from board_hq WHERE board_number=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, board_number);
			row = pstmt.executeUpdate();
			
		}catch(Exception e){
			
			
		}finally{
			if(pstmt != null)try {pstmt.close();} catch (SQLException e) {}
			if(conn != null)try {conn.close();} catch (SQLException e) {}
		}
		
		return row;
	}
	
}
