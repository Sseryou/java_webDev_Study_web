package action;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class SetCookieAction
 */
@WebServlet("/cookie.do")
public class SetCookieAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Cookie cookie = new Cookie("param", "아무거나");
		response.addCookie(cookie);
		//쿠키 유효시간 설정하기
		cookie.setMaxAge(60*60*24*7); //일주일
		//cookie.setMaxAge(0);
		
		Cookie[] cookies = request.getCookies();
		for(Cookie cookie2 : cookies) {
			System.out.println("쿠키 이름 : " + cookie2.getName());
			System.out.println("쿠키 내용 : " + cookie2.getValue());
			System.out.println("==============================");
		}
		
		
		
		response.sendRedirect("ex01_Cookie.jsp");
		
	}

}
