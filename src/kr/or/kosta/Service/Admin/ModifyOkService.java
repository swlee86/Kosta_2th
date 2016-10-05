package kr.or.kosta.Service.Admin;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.kosta.Action.Action;
import kr.or.kosta.Action.ActionForward;
import kr.or.kosta.Dao.Admin.AdminDAO;
import kr.or.kosta.Dto.Custumer.CustermerDTO;

public class ModifyOkService implements Action {

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response) throws SQLException {
		System.out.println("modifyOkService Start");
		int result = 0;
		String msg="";
		String member_id = request.getParameter("id");
		String member_name = request.getParameter("modify_name");
		String member_phone = request.getParameter("modify_phnum");
		String m_loginok = request.getParameter("loginstate");
		int member_grade  = Integer.parseInt(request.getParameter("grade"));
		String SHOP_CODE  = request.getParameter("modify_market");
		System.out.println("수정내역");
		System.out.println("수정 데이터 받은 내역 : " + member_id +"/"+member_name+"/"+member_phone+"/"+m_loginok+"/"+member_grade+"/"+SHOP_CODE);
		
		AdminDAO adao = new AdminDAO();
		CustermerDTO cdto = new CustermerDTO();
		cdto.setmember_id(member_id);
		cdto.setmember_name(member_name);
		cdto.setmember_phone(member_phone);
		cdto.setm_loginok(m_loginok);
		cdto.setmember_grade(member_grade);
		cdto.setSHOP_CODE(SHOP_CODE);
		result = adao.ModifyOk(cdto);
		
		if(result>0){
			msg = "수정 완료";
		}
		
		request.setAttribute("msg", msg);
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("/redirect/member_redirect.jsp");
		
		return forward;
	}

}
