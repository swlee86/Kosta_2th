package kr.or.kosta.Service.Custermer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.kosta.Action.Action;
import kr.or.kosta.Action.ActionForward;

public class IndexmoveService implements Action {
	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("/WEB-INF/index.jsp");
		return forward;
	}

}
