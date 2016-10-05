package kr.or.kosta.Service.Custermer;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.kosta.Action.Action;
import kr.or.kosta.Action.ActionForward;
import kr.or.kosta.Dao.Custumer.CustermerDAO;
import kr.or.kosta.Dto.Custumer.CustermerDTO;

public class RegisterOkService implements Action {

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response) throws SQLException {
		String email = request.getParameter("id");
		String pswd = request.getParameter("pswd");
		String name = request.getParameter("name");
		String market = request.getParameter("market");
		String phnum = request.getParameter("phnum");
		int grade = Integer.parseInt(request.getParameter("grade"));
		
		CustermerDTO cdto = new CustermerDTO(email, pswd, name, phnum, market, grade);
		int result = 0;
		String msg = "";
		CustermerDAO cdao = new CustermerDAO();
		result=cdao.registerOk(cdto);
		System.out.println("result data : " + result);
		
		if(result>0){
			msg = email + " 님 가입을 축하합니다. 아이디 승인까지는 최대 24시간이 소요 됩니다. 만약 승인이 지연될 경우 매장 담당 본사 관리자에게 문의하세요";
		}else{
			msg = "가입 실패... 만약 동일 오류가 반복될 경우 관리자에게 문의해 주세요 (관리자 : 000-0000-0000)";
		}
		
		request.setAttribute("msg", msg);
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("/WEB-INF/register/redirect.jsp");
		
		return forward;
	}

}
