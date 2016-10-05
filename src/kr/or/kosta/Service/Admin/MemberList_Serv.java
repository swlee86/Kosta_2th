package kr.or.kosta.Service.Admin;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.kosta.Action.Action;
import kr.or.kosta.Action.ActionForward;
import kr.or.kosta.Dao.Admin.AdminDAO;
import kr.or.kosta.Dto.Custumer.CustermerDTO;

public class MemberList_Serv implements Action {

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response) throws SQLException {
		AdminDAO adao = new AdminDAO();
		List<CustermerDTO> list = adao.mainlist();
		System.out.println("list 사이즈 : " + list.size());
		
		request.setAttribute("list", list);
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("/WEB-INF/view/memberlist.jsp");
		return forward;
	}

}
