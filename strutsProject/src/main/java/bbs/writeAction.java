package bbs;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import actionform.writeActionForm;
import bbs.BbsBean;
import bbs.BbsDao;

public class writeAction extends Action{
	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) throws Exception{
		System.out.println("writeAction");
		request.setCharacterEncoding("UTF-8");
		writeActionForm writeActionForm = (writeActionForm)form;
		String title = writeActionForm.getTitle();
		String content = writeActionForm.getContent();
		
		
		BbsBean b = new BbsBean();
		b.setBbsTitle(title);
		b.setBbsContent(content);
		HttpSession session = request.getSession();
		String userID = (String) session.getAttribute("user_id");
		b.setUserID(userID);
		System.out.println(b.getBbsTitle());
		System.out.println(b.getBbsContent());
		
		BbsDao dao = new BbsDao();
		int result = dao.write(b.getBbsTitle(),userID , b.getBbsContent());
		//사용자 입력 받아야함
		System.out.println(result);
		if(result==1) {
			System.out.println("성공");
			return mapping.findForward("bbs");
		}else {
			System.out.println("실패");
			return mapping.findForward("fail");
		}
	}
		
		
}
