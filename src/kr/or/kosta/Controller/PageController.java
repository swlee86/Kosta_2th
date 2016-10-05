
package kr.or.kosta.Controller;


import kr.or.kosta.Action.Action;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.kosta.Action.ActionForward;
import kr.or.kosta.Service.Admin.Info_Delete_Service;
import kr.or.kosta.Service.Admin.ModifyOkService;
import kr.or.kosta.Service.Admin.ModifyService;
import kr.or.kosta.Service.Admin.Req_inv_Service;
import kr.or.kosta.Service.Admin.RequestManage_Serv;
import kr.or.kosta.Service.Admin.MemberList_Serv;
import kr.or.kosta.Service.Admin.trade_list_Service;
import kr.or.kosta.Service.Custermer.IndexmoveService;
import kr.or.kosta.Service.Custermer.LogoutOkService;
import kr.or.kosta.Service.NoticeBoard.NoContentService;
import kr.or.kosta.Service.NoticeBoard.NoDeleteOkService;
import kr.or.kosta.Service.NoticeBoard.NoEditOkService;
import kr.or.kosta.Service.NoticeBoard.NoEditService;
import kr.or.kosta.Service.NoticeBoard.NoListService;
import kr.or.kosta.Service.NoticeBoard.NoPagingService;
import kr.or.kosta.Service.NoticeBoard.NoWriteOkService;
import kr.or.kosta.Service.NoticeBoard.NoWriteService;

@WebServlet("*.do")
public class PageController extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
    public PageController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			request.setCharacterEncoding("UTF-8");
			response.setContentType("text/plain;charset=UTF-8");
			doProcess(request, response);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			request.setCharacterEncoding("UTF-8");
			response.setContentType("text/plain;charset=UTF-8");
			doProcess(request, response);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	private void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/plain;charset=UTF-8");
		String RequestURI = request.getRequestURI();
		String ContextPath = request.getContextPath();
		String Url_Command = RequestURI.substring(ContextPath.length());
		
		System.out.println("URl_Command Data : " +Url_Command);
		
		ActionForward forward = null;
		Action action = null;
		
		if(Url_Command.equals("/index.do")){
			System.out.println("index.do Strat!");
			action = new IndexmoveService();
			
			try{
				forward = action.excute(request, response);
			}catch(Exception e){
				
			}

		}
		
		if(Url_Command.equals("/modify.do")){
			System.out.println("modify.do Strat!");
				action = new ModifyService();
			try{
				forward = action.excute(request, response);
			}catch(Exception e){
				
			}

		}
		
		if(Url_Command.equals("/modifyOk.do")){
			System.out.println("modifyOk.do Strat!");
				action = new ModifyOkService();
			try{
				forward = action.excute(request, response);
			}catch(Exception e){
				
			}

		}
		
			if(Url_Command.equals("/logoutConfirm.do")){
				System.out.println("logout.do Strat!");
				forward = new ActionForward();
				action = new LogoutOkService();
				
				try{
					forward = action.excute(request, response);
				}catch(Exception e){
					
				}
				
			}
			
			if(Url_Command.equals("/notice.do")){
				System.out.println("notice.do Strat!");
				action = new NoListService();
				
				try{
					forward = action.excute(request, response);
				}catch(Exception e){
					
				}

			}	
			
			if(Url_Command.equals("/board_content.do")){
				System.out.println("boardcontents.do Strat!");
				action = new NoContentService();
				
				try{
					forward = action.excute(request, response);
				}catch(Exception e){
					
				}

			}	
			
			if(Url_Command.equals("/notice_board/board_content.do")){
				System.out.println("boardcontents.do Strat!");
				action = new NoContentService();
				
				try{
					forward = action.excute(request, response);
				}catch(Exception e){
					
				}

			}	
			
			if(Url_Command.equals("/boardwrite.do")){
				System.out.println("boardwrite.do Strat!");
				action = new NoWriteService();
				
				try{
					forward = action.excute(request, response);
				}catch(Exception e){
					
				}

			}	
			
			if(Url_Command.equals("/notice_board/boardwrite.do")){
				System.out.println("boardwrite.do Strat!");
				action = new NoWriteService();
				
				try{
					forward = action.excute(request, response);
				}catch(Exception e){
					
				}

			}	
			
			if(Url_Command.equals("/board_writeok.do")){
				System.out.println("boardwriteok.do Strat!");
				action = new NoWriteOkService();
				try{
					forward = action.excute(request, response);
				}catch(Exception e){
					
				}

			}	
			
			if(Url_Command.equals("/notice_board/board_writeok.do")){
				System.out.println("boardwriteok.do Strat!");
				action = new NoWriteOkService();
				try{
					forward = action.excute(request, response);
				}catch(Exception e){
					
				}

			}	
			
			if(Url_Command.equals("/noticeedit.do")){
				System.out.println("noticeedit.do Strat!");
				action = new NoEditService();
				try{
					forward = action.excute(request, response);
				}catch(Exception e){
					
				}

			}
			
			if(Url_Command.equals("/noticeeditOk.do")){
				System.out.println("noticeeditOk.do Strat!");
				action = new NoEditOkService();
				try{
					forward = action.excute(request, response);
				}catch(Exception e){
					
				}

			}
			
			if(Url_Command.equals("/pagemove.do")){
				System.out.println("pagemove.do Strat!");
				action = new NoPagingService();
				try{
					forward = action.excute(request, response);
				}catch(Exception e){
					
				}

			}
			
			if(Url_Command.equals("/memberlist.do")){
				System.out.println("memberlist.do Strat!");
				action = new MemberList_Serv();
				try{
					forward = action.excute(request, response);
				}catch(Exception e){
					
				}

			}
			
			if(Url_Command.equals("/request_manage.do")){
				System.out.println("request_manage.do Strat!");
				action = new RequestManage_Serv();
				try{
					forward = action.excute(request, response);
				}catch(Exception e){
					
				}

			}
			
			
			if(Url_Command.equals("/infodelete.do")){
				System.out.println("infodelete.do Strat!");
				action = new Info_Delete_Service();
				try{
					forward = action.excute(request, response);
				}catch(Exception e){
					
				}

			}
			
			if(Url_Command.equals("/deleteOk.do")){
				System.out.println("deleteOk.do Strat!");
				action = new NoDeleteOkService();
				try{
					forward = action.excute(request, response);
				}catch(Exception e){
					
				}

			}
			
			if(Url_Command.equals("/notice_board/deleteOk.do")){
				System.out.println("/notice_board/deleteOk.do Strat!");
				action = new NoDeleteOkService();
				try{
					forward = action.excute(request, response);
				}catch(Exception e){
					
				}

			}
		
			if(Url_Command.equals("/request_inv.do")){
				System.out.println("request_inv.do Strat!");
				action = new Req_inv_Service();
				try{
					forward = action.excute(request, response);
				}catch(Exception e){
					
				}
			}
			
			if(Url_Command.equals("/trade_list.do")){
				System.out.println("trade_list.do Strat!");
				action = new trade_list_Service();
				try{
					forward = action.excute(request, response);
				}catch(Exception e){
					
				}
			}
			
			if(Url_Command.equals("/inv_status.do")){
				System.out.println("inv_status.do Strat!");
				action = new trade_list_Service();
				try{
					
				}catch(Exception e){
					
				}
			}
			
			if(Url_Command.equals("/status_order.do")){
				System.out.println("status_order.do Strat!");

				try{
					
				}catch(Exception e){
					
				}
			}
			
			if(Url_Command.equals("/ware_register.do")){
				System.out.println("ware_register.do Strat!");

				try{
					
				}catch(Exception e){
					
				}
			}
			
			if(Url_Command.equals("/ware_mul_register.do")){
				System.out.println("ware_mul_register.do Strat!");

				try{
					
				}catch(Exception e){
					
				}
			}
		
			
		if(forward!=null){
			if(forward.isRedirect()){
				response.sendRedirect(forward.getPath());
			}else{
				RequestDispatcher dis = request.getRequestDispatcher(forward.getPath());
				dis.forward(request, response);
			}
		}
	}
}
