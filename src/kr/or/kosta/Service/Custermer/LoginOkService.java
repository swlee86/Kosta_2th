package kr.or.kosta.Service.Custermer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import kr.or.kosta.Action.Action;
import kr.or.kosta.Action.ActionForward;
import kr.or.kosta.Dao.Custumer.CustermerDAO;
import kr.or.kosta.Dto.Custumer.CustermerDTO;

public class LoginOkService implements Action {

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)  {
		int result = 0;
		String msg ="";
		
		String member_id = request.getParameter("id");
		String member_pw = request.getParameter("pswd");
		System.out.println(member_id + "/" + member_pw);

		CustermerDTO cdto = new CustermerDTO(member_id, member_pw);
		CustermerDAO cdao = new CustermerDAO();
		result = cdao.loginOk(cdto);
		System.out.println("result : " + result);
		if(result>0){
			HttpSession session = request.getSession(true);
			session.setAttribute("session_login", member_id);
			session.setAttribute("grade", cdto.getmember_grade());

			msg = session.getAttribute("session_login")+" 님 환영합니다. 로그인에 성공하셨습니다.";
		}else if(result==0){
			msg = "로그인 실패... 다시 한 번 시도해 주새요";
		}else if(result==-1){
			msg = "로그인 권한이 없습니다. 관리자에게 문의하세요(010-0000-0000)";
		}
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("/WEB-INF/register/redirect.jsp");
		
		request.setAttribute("msg", msg);
		return forward;
	}

}
