package bbs;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import actionform.UpdateActionForm;
import actionform.writeActionForm;
import bbs.BbsBean;
import bbs.BbsDao;

public class updateAction extends Action{

	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) throws Exception{
		System.out.println("updateAction");
		request.setCharacterEncoding("UTF-8");
		UpdateActionForm up = (UpdateActionForm)(form);
		String title = up.getTitle();
		String content = up.getContent();
		int bbsID = up.getBbsID();
		System.out.println(bbsID);
		BbsBean b = new BbsBean();
		b.setBbsTitle(title);
		b.setBbsContent(content);
		b.setBbsID(bbsID);
		
		BbsDao dao = new BbsDao();
		int result = dao.update(b.getBbsID(), b.getBbsTitle(), b.getBbsContent());
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
