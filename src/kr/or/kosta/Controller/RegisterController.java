package kr.or.kosta.Controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import kr.or.kosta.Action.Action;
import kr.or.kosta.Action.ActionForward;
import kr.or.kosta.Service.Admin.ShopRegister_Serv;
import kr.or.kosta.Service.Custermer.LoginOkService;
import kr.or.kosta.Service.Custermer.RegisterOkService;

@WebServlet("*.reg")
public class RegisterController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public RegisterController() {
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
		
		if(Url_Command.equals("/register.reg")){
			action = new RegisterOkService();
			try{
				forward = action.excute(request, response);
			}catch(Exception e){
				
			}
		}
		
		if(Url_Command.equals("/loginok.reg")){
			System.out.println("loginok Strat!");
			action = new LoginOkService();
			try{
				forward = action.excute(request, response);
			}catch(Exception e){
				
			}
		}
		
		 if(Url_Command.equals("/InfoAdd.reg")){
			 System.out.println("InfoAdd.reg Strat!");
			 action = new ShopRegister_Serv();
			try{
				forward = action.excute(request, response);
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
