package login;

import javax.servlet.http.*;
import javax.servlet.http.HttpServlet;

import org.apache.struts.action.*;

import actionform.LoginActionForm;

public class LoginAction extends Action {
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		System.out.println("LoginAction");

		LoginActionForm f = (LoginActionForm) form;// 파라미터 값 저장
		String id = f.getId();
		String passwd = f.getPasswd();

		LoginBean b = new LoginBean();
		b.setId(id);
		b.setPw(passwd);
		LoginDao dao = new LoginDao();
		int result = dao.login(b.getId(), b.getPw());
		System.out.println(b.getId());
		System.out.println(b.getPw());
		System.out.println(result);
		String user_id = b.getId(); // 세션에 넣을 값
		System.out.println(user_id + "dfaefa");
		if (result == 1) {
			System.out.println("성공");
			HttpSession session = request.getSession();
			session.setAttribute("user_id", user_id);
			return mapping.findForward("bbs");

		} else {
			System.out.println("실패");
			return mapping.findForward("fail");
		}
		/*
		 * if(result) { return mapping.findForward("logon"); } else { return
		 * mapping.findForward("fail"); }
		 */

	}
}
