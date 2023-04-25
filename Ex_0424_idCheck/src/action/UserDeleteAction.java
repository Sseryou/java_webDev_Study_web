package action;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import dao.UserDAO;

/**
 * Servlet implementation class UserDeleteAction
 */
@WebServlet("/user_del.do")
public class UserDeleteAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		int idx = Integer.parseInt(request.getParameter("idx"));
		int res = UserDAO.getInstance().delete(idx);
		
		String param = "no";
		
		if(res > 0) {
			param = "yes";
		}
		String result = String.format("[{'res' : '%s'}]", param);
		response.getWriter().print(result);
	}

}
