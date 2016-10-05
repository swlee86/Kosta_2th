package kr.or.kosta.Service.Admin;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.kosta.Action.Action;
import kr.or.kosta.Action.ActionForward;

public class Req_inv_Service implements Action {

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response) throws SQLException {
		
		
		//아래는 마지막에 주석 푸시고 return null은 삭제해 주세용!!!
		
	/*	ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("");
		return forward;
		
	*/
		return null;
		
	}

}
