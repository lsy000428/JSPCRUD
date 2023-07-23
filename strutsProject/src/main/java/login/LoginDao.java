package login;

import javax.sql.*;
import java.sql.*;
import javax.naming.*;
public class LoginDao {
	private Connection conn;
	private DataSource ds;
	private ResultSet rs;
	private Statement stmt;
	private PreparedStatement pstmt;
	
	public LoginDao() {
		 try {
	         String dbURL = "jdbc:mysql://localhost:3306/strutsDB"; // MySQL 서버 주소 + BBS DB접속
	         //mysql.url=jdbc:mysql://localhost:3306/BBS?useUnicode=true&characterEncoding=UTF-8
	         String dbID = "root";
	         String dbPassword = "Dltkddyd428*";
	         Class.forName("com.mysql.cj.jdbc.Driver"); // MySQL 접속 매개체(라이브러리)
	         conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
	      } catch (Exception e) {
	         System.out.println("UserDAO 오류");
	         e.printStackTrace();
	      }
	   }
	   /* Connection conn=null;

	    Context init;
		try {
			init = new InitialContext();
		    DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/mysql");
		    conn = ds.getConnection();
		    System.out.println(conn);
		    conn.close();
		} catch (NamingException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}*/
	public int login(String id, String pw) {
		System.out.println("DAO에 있는것");
		System.out.println(id);
		System.out.println(pw);
		String SQL= "SELECT pw FROM USER WHERE id =?";
		
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, id);
			rs =pstmt.executeQuery();
			if(rs.next()) {
				System.out.println("dfaef"+rs.getString(1));
				if(rs.getString(1).equals(pw)) {
					return 1;
				}
				else 
					return 0;
			}
			return -1;
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return -2;
	}
	
	public int join(String id, String pw, String name, int age) {
		String SQL= "INSERT INTO USER VALUES (?, ?, ?, ?)";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1,id);
			pstmt.setString(2,pw);
			pstmt.setString(3,name);
			pstmt.setInt(4,age);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return -1;
	}
	
	
}
