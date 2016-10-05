package kr.or.kosta.Service.NoticeBoard;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.kosta.Action.Action;
import kr.or.kosta.Action.ActionForward;
import kr.or.kosta.Dao.NoticeBoard.NoticeBoardDAO;
import kr.or.kosta.Dto.NoticeBoard.NoticeBoardDTO;

public class NoListService implements Action {

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response) throws SQLException {
        String psStr = null;    //pagesize
        String cpStr = null;    //currentpage
		
        if(psStr == null || psStr.trim().equals("")){
            psStr = "3";
        }
        
        if(cpStr == null || cpStr.trim().equals("")){
            cpStr= "1";
        }
      
        int pagesize = Integer.parseInt(psStr);  //10
        int cpage = Integer.parseInt(cpStr);     //1
        int pagecount = 0;
        
        NoticeBoardDAO nbdao = new NoticeBoardDAO();
        int totalboardCount = nbdao.totalboardCount();
        
        System.out.println("totalboardCount : "+totalboardCount);
        
  		if(totalboardCount % pagesize==0){
            pagecount = totalboardCount/pagesize;
        }else{
            pagecount = (totalboardCount/pagesize) + 1;
        }

        
        List<NoticeBoardDTO> list =null;
        try {
			list = nbdao.list(cpage, pagesize);
			System.out.println("NOTICE : "+list.size());
		} catch (Exception e) {
			e.printStackTrace();
		}
        request.setAttribute("totalboardCount", totalboardCount);
        request.setAttribute("pagecount", pagecount);
        request.setAttribute("pagesize", pagesize);
        request.setAttribute("cpage", cpage);
        request.setAttribute("noticeList", list);
        
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("/notice_board/board_list.jsp");
		
		return forward;
	}
}
