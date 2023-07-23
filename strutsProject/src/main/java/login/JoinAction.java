package login;

import javax.servlet.http.*;
import javax.servlet.http.HttpServlet;
import org.apache.struts.action.*;
import actionform.JoinActionForm;

public class JoinAction extends Action {

	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		System.out.println("JoinAction");
		System.out.println("오류전");

		JoinActionForm q = (JoinActionForm) form;// 파라미터 값 저장
		System.out.println("오류후");
		System.out.println(q); // null값
		String id = q.getId();
		String pw = q.getPw();
		String name = q.getName();
		int age = q.getAge();

		JoinBean b = new JoinBean();
		b.setId(id);
		b.setPw(pw);
		b.setName(name);
		b.setAge(age);

		LoginDao dao = new LoginDao();
		int result = dao.join(b.getId(), b.getPw(), b.getName(), b.getAge());
		System.out.println(result);
		System.out.println(b.getId());
		if (result == 1) {
			System.out.println("성공");
			String user_id = b.getId();
			return mapping.findForward("LoginForm");
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
