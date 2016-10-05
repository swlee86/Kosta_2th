package kr.or.kosta.Service.Custermer;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.kosta.Action.Action;
import kr.or.kosta.Action.ActionForward;
import kr.or.kosta.Dao.Custumer.CustermerDAO;
import kr.or.kosta.Dto.Shop.ShopData_Dto;

public class ShopSearch_Serv implements Action {

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response) throws SQLException {
		List<ShopData_Dto> slist = new ArrayList<ShopData_Dto>();
		CustermerDAO cdao = new CustermerDAO();
		slist = cdao.shoplist();
		
		request.setAttribute("slist", slist);
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("/WEB-INF/register/register.jsp");
		return forward;
	}

}
