package kr.or.kosta.Service.Admin;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.kosta.Action.Action;
import kr.or.kosta.Action.ActionForward;

public class trade_list_Service implements Action {

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response) throws SQLException {
		System.out.println("TradeList Service Start");
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("/WEB-INF/view/trade_list.jsp");
		return forward;
	}

}
