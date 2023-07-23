package bbs;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import actionform.DeleteActionForm;
import bbs.BbsBean;
import bbs.BbsDao;

public class deleteAction extends Action {

	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		System.out.println("deleteAction");
		DeleteActionForm dl = (DeleteActionForm) (form);

		int bbsID = dl.getBbsID();
		System.out.println(bbsID);
		BbsBean b = new BbsBean();
		b.setBbsID(bbsID);

		BbsDao dao = new BbsDao();
		int result = dao.delete(b.getBbsID());
		// 사용자 입력 받아야함
		System.out.println(result);
		if (result == 1) {
			System.out.println("성공");
			return mapping.findForward("bbs");
		} else {
			System.out.println("실패");
			return mapping.findForward("fail");
		}
	}

}
