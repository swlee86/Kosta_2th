package kr.or.kosta.Service.NoticeBoard;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.kosta.Action.Action;
import kr.or.kosta.Action.ActionForward;

public class NoWriteService implements Action {

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response) throws SQLException {
		System.out.println("noticewriteservice Start");
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("/notice_board/board_write.jsp");
		
		return forward;
	}

}
