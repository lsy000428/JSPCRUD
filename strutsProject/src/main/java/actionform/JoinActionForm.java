package actionform;

import javax.servlet.http.*;

import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;

public class JoinActionForm extends ActionForm{
	private String id;
	private String pw;
	private String name;
	private int age;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}


	
	/*유효성 검사,id와 password에 값이 들어있지 않을 때 에러 발생*/
	public ActionErrors validate(ActionMapping mapping, HttpServletRequest request) {
		System.out.println("validate 호출");
		
		if(id==null || id.length()==0) {
			System.out.println("사용자 아이디를 입력하세요");
		}else if(pw==null ||pw.length()==0) {
			System.out.println("비밀번호를 입력하세요");
		}else if(name==null || name.length()==0) {
			System.out.println("이름을 입력하세요");
		}
		System.out.println("오류");
		return null;
	}
	
	//세션에 저장되어있는 LoginActionForm을 초기화한다.
	public void reset(ActionMapping mapping, HttpServletRequest request) {
		this.id=null;
		this.pw=null;
	}
}
