package kr.or.kosta.Service.Custermer;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.kosta.Action.Action;
import kr.or.kosta.Action.ActionForward;

public class LogoutOkService implements Action {

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response) throws SQLException {
		String msg = "";
		HttpSession session = request.getSession(true);
		session.removeAttribute("session_login");
		session.removeAttribute("grade");
		msg = "정상적으로 로그아웃 되셨습니다.";
		request.setAttribute("msg", msg);
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("/WEB-INF/register/redirect.jsp");
		return forward;
	}

}
