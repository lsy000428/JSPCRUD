package actionform;

import javax.servlet.http.*;
import org.apache.struts.action.*;
import org.apache.struts.action.ActionForm;

public class LoginActionForm extends ActionForm{
	private String id;
	private String passwd;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPasswd() {
		return passwd;
	}
	public void setPasswd(String passwd) {
		this.passwd = passwd;	
	}
	
	/*유효성 검사,id와 password에 값이 들어있지 않을 때 에러 발생*/
	public ActionErrors validate(ActionMapping mapping, HttpServletRequest request) {
		System.out.println("validate 호출");
		
		if(id==null || id.length()==0) {
			System.out.println("사용자 아이디를 입력하세요");
		}else if(passwd==null ||passwd.length()==0) {
			System.out.println("비밀번호를 입력하세요");
		}
		return null;
	}
	
	//세션에 저장되어있는 LoginActionForm을 초기화한다.
	public void reset(ActionMapping mapping, HttpServletRequest request) {
		this.id=null;
		this.passwd=null;
	}
}
