package kr.or.kosta.Service.NoticeBoard;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.kosta.Action.Action;
import kr.or.kosta.Action.ActionForward;
import kr.or.kosta.Dao.NoticeBoard.NoticeBoardDAO;
import kr.or.kosta.Dto.NoticeBoard.NoticeBoardDTO;

public class NoPagingService implements Action {

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response) throws SQLException {
		System.out.println("pagingService Start");
		String currentpage = request.getParameter("cp");
		String pagesize = request.getParameter("ps");
		System.out.println(currentpage+"/"+pagesize);
		
        if(pagesize == null || pagesize.trim().equals("")){
        	pagesize = "10";
        }
        
        if(currentpage == null || currentpage.trim().equals("")){
        	currentpage= "1";
        }
      
        int ps= Integer.parseInt(pagesize);  //10
        int cp = Integer.parseInt(currentpage);     //1
        int pagecount = 0;
        
        NoticeBoardDAO nbdao = new NoticeBoardDAO();
        int totalboardCount = nbdao.totalboardCount();
        
        System.out.println("totalboardCount : "+totalboardCount);
        
  		if(totalboardCount % ps ==0){
            pagecount = totalboardCount/ps;
        }else{
            pagecount = (totalboardCount/ps) + 1;
        }

        
        List<NoticeBoardDTO> list =null;
        try {
			list = nbdao.list(cp, ps);
			System.out.println("NOTICE : "+list.size());
		} catch (Exception e) {
			e.printStackTrace();
		}
        
		
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("/notice_board/board_list.jsp");
		
		return forward;
	}

}
