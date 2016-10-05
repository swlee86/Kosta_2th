package kr.or.kosta.Service.Admin;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.kosta.Action.Action;
import kr.or.kosta.Action.ActionForward;
import kr.or.kosta.Dao.Admin.AdminDAO;

public class ShopRegister_Serv implements Action {

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response) throws SQLException {
		String SHOP_CODE  = request.getParameter("SHOP_CODE ");
		String SHOP_NAME  = request.getParameter("SHOP_NAME ");
		String SHOP_ADDR_1 = request.getParameter("SHOP_ADDR_1");
		String SHOP_ADDR_2 = request.getParameter("SHOP_ADDR_2");
		String SHOP_ADDR = SHOP_ADDR_1+" "+SHOP_ADDR_2;
		String SHOP_REPRE = request.getParameter("SHOP_REPRE");
		String SHOP_BRN = request.getParameter("SHOP_BRN");
		String SHOP_PHONE = request.getParameter("SHOP_PHONE");

		System.out.println(SHOP_CODE+"/"+SHOP_NAME+"/"+SHOP_ADDR_1+"/"+SHOP_ADDR_2+"/"+SHOP_REPRE+"/"+SHOP_BRN+"/"+SHOP_PHONE);
		String msg = "";
		 try{ 
	        	AdminDAO adao = new AdminDAO();
	        	int result = adao.InsertShop(SHOP_CODE , SHOP_NAME , SHOP_ADDR, SHOP_REPRE, SHOP_BRN,SHOP_PHONE);
	            System.out.println("insert result : " + result);
	   	        
	        	if(result>0){ 
	        		msg="Data 등록에 성공하였습니다";
	            }else{ 
	            	msg="Data 등록에 실패하였습니다. 게속하여 등록되지 않을 경우 관리자에게 문의하세요";
	            } 
	        }catch(Exception e){ 
	           e.printStackTrace();
	        } 
		 
		 	request.setAttribute("msg", msg);
		 ActionForward forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("/redirect/ShopRegi_redirect.jsp");
			return forward;
	}

}
