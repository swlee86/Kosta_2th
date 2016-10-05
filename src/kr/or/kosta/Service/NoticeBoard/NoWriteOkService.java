package kr.or.kosta.Service.NoticeBoard;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.kosta.Action.Action;
import kr.or.kosta.Action.ActionForward;
import kr.or.kosta.Dao.NoticeBoard.NoticeBoardDAO;
import kr.or.kosta.Dto.NoticeBoard.NoticeBoardDTO;

public class NoWriteOkService implements Action {
	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response) throws SQLException {
		System.out.println("noticewriteok 서비스");
		String writer = request.getParameter("writer");
		String subject = request.getParameter("subject");
		String content = request.getParameter("content");
		String filename = request.getParameter("filename");

		NoticeBoardDTO bdto = new NoticeBoardDTO(writer, subject, content, filename);
		NoticeBoardDAO bdao = new NoticeBoardDAO();
		
		int result = bdao.NoticeWriteOk(bdto);
		String msg ="";
		if(result>0){
			msg = "글 등록에 성공하였습니다";
		}else{
			msg = "글 등록에 실패하였습니다";
		}
		
		request.setAttribute("msg", msg);
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("/redirect/notice_redirect.jsp");
		return forward;
	}

}
