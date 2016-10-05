package kr.or.kosta.Service.NoticeBoard;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.kosta.Action.Action;
import kr.or.kosta.Action.ActionForward;
import kr.or.kosta.Dao.NoticeBoard.NoticeBoardDAO;
import kr.or.kosta.Dto.NoticeBoard.NoticeBoardDTO;

public class NoEditService implements Action {

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response) throws SQLException {
		String board_number = request.getParameter("board_number");
		System.out.println(board_number);
		
		if(board_number==null || board_number.trim().equals("")){
			System.exit(0);
			return null;
		}
		board_number = board_number.trim();
		NoticeBoardDAO bdao = new NoticeBoardDAO();
		NoticeBoardDTO bdto = bdao.getContent(board_number);
		
		request.setAttribute("board_number", board_number);
		request.setAttribute("board_content", bdto);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("/notice_board/board_edit.jsp");
		return forward;
	}
}
