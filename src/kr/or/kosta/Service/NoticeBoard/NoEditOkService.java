package kr.or.kosta.Service.NoticeBoard;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sound.midi.Synthesizer;

import kr.or.kosta.Action.Action;
import kr.or.kosta.Action.ActionForward;
import kr.or.kosta.Dao.NoticeBoard.NoticeBoardDAO;
import kr.or.kosta.Dto.NoticeBoard.NoticeBoardDTO;

public class NoEditOkService implements Action {
	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response) throws SQLException {
		String board_number = request.getParameter("board_number");
		String board_title = request.getParameter("subject");
		String board_content = request.getParameter("content");
		String board_file = request.getParameter("board_file");
		String board_file_size = request.getParameter("board_file_size");
		int result=0;
		String msg="";
		try{
			if (board_number == null || board_number.trim().equals("")) {
				response.sendRedirect("notice.do");
				return null;
			}
			NoticeBoardDTO bdto = new NoticeBoardDTO(board_number, board_title, board_content, board_file, board_file_size);
			NoticeBoardDAO bdao = new NoticeBoardDAO();
			result = bdao.NoticeEditOk(bdto);
			
			if(result>0){
				msg = "글이 정상적으로 수정되었습니다";
			}else{
				msg = "글 수정에 실패하였습니다. 잠시 후 다시 시도해 주세요";
			};
		}catch(Exception e){
			
		}finally{
			
		}
		request.setAttribute("msg", msg);	
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("/WEB-INF/register/redirect.jsp");
		
		return forward;
	}

}
