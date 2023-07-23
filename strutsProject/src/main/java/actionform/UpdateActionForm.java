package actionform;

import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.*;

public class UpdateActionForm extends ActionForm {

	private String title;
	private String content;
	private int bbsID;

	public int getBbsID() {
		return bbsID;
	}

	public void setBbsID(int bbsID) {
		this.bbsID = bbsID;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public ActionErrors validate(ActionMapping mapping, HttpServletRequest request) {
		System.out.println("validate 호출");
		System.out.println(bbsID);
		System.out.println(title);
		System.out.println(content);
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if (title == null || title.length() == 0) {
			System.out.println("제목을 입력하시오");
		} else if (content == null || content.length() == 0) {
			System.out.println("본문을 입력하시오");
		} // else if(userID ==null) {
			// System.out.println("로그인을 하세요");
			// }
		return null;
	}

}
