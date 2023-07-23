package login;

import javax.servlet.http.*;
import javax.servlet.http.HttpServlet;

import org.apache.struts.action.*;

import actionform.LoginActionForm;

public class mainAction extends Action {
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
	      String code = null;
	      HttpSession session = request.getSession();
	      code = (String) request.getParameter("lang"); //언어 받아왔다고 가정 ko or en
	      if(code == null) {
	         code = "ko";
	      }else {
	         session.setAttribute("test", code);
	      }
	      return mapping.findForward("main");
	  }
}
