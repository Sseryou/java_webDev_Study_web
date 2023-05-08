package action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.BoardDAO;
import vo.BoardVO;

/**
 * Servlet implementation class BoardViewAction
 */
@WebServlet("/view.do")
public class BoardViewAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		int idx = Integer.parseInt(request.getParameter("idx"));
		
		//상세보기, 조회수 증가를 위해 DB에 두번 접근하기 위해 DAO를 미리 생성해놓는다.
		BoardDAO dao = BoardDAO.getInstance();
		
		BoardVO vo = dao.selectOne(idx);
		
		HttpSession session = request.getSession();
		
		//우리는 session에 set를 해준적이 없기 때문에
		//get을 해도 null값을 반환할 것이다.
		String show = (String)session.getAttribute("show");
		//최초 1회 실행시는 null이 들어갈 것이다.
		if(show == null) {
			int res = dao.update_readhit(idx);
			session.setAttribute("show", "0");
		}
		//문자열 아무거나 넣어서, 더이상 조회수를 늘리지 못하게 한다.아무튼 뭔가 있게.	
		
		
		//바인딩
		request.setAttribute("vo", vo);
		
		//포워딩
		RequestDispatcher disp = request.getRequestDispatcher("board_view.jsp");
		disp.forward(request, response);
		
	}

}
