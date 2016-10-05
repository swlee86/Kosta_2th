package kr.or.kosta.Service.Admin;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.kosta.Action.Action;
import kr.or.kosta.Action.ActionForward;
import kr.or.kosta.Dao.Admin.AdminDAO;
import kr.or.kosta.Dto.Custumer.CustermerDTO;

public class ModifyService implements Action {

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response) throws SQLException {	
		String id = request.getParameter("id");
		System.out.println("수정할 대상 : " + id);
		List<CustermerDTO> list = new ArrayList<CustermerDTO>();
		AdminDAO adao = new AdminDAO();
		list=adao.modify(id);
		
		request.setAttribute("modifylist", list);
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("/WEB-INF/view/modify.jsp");
		return forward;
	}

}
