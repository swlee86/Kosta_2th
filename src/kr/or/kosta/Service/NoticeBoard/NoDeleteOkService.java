package kr.or.kosta.Service.NoticeBoard;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.kosta.Action.Action;
import kr.or.kosta.Action.ActionForward;
import kr.or.kosta.Dao.NoticeBoard.NoticeBoardDAO;

public class NoDeleteOkService implements Action {

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response) throws SQLException {
		System.out.println("DELETE 서비스 시작");
		String board_number = request.getParameter("board_number");
		NoticeBoardDAO ndao = new NoticeBoardDAO();
		int result = ndao.deleteContent(board_number);
		String msg="";
		if(result>0){
			msg="삭제 성공";
		}else{
			msg="삭제 실패";
		}
		System.out.println("처리 값 : " + result);
		request.setAttribute("msg", msg);
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("/redirect/notice_redirect.jsp");
		return forward;
	}

}
