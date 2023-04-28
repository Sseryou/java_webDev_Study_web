package action;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.SawonDAO;
import vo.SawonVO;

/**
 * Servlet implementation class SawonListAction
 */
@WebServlet("/sawon_list.do")
public class SawonListAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		//sawon_list.do?deptno=10
		int deptno = 0;
		
		
		String str_deptno = request.getParameter("deptno");
		System.out.println(str_deptno);
		//파라미터를 String으로 받은이유
		//최초로 시작하면 deptno는 null이 넘어오기때문에 int로 형변환을 하면 에러가 난다.
		
		//sawon_list.do
		//sawon_list.do? --> null
		//sawon_list.do?deptno=  --> empty
		List<SawonVO> list = null;
		
		
		if(str_deptno != null && !str_deptno.isEmpty()) {
			//파라미터가 없거나 비어있는 상태가 아닌 정상적으로 값이 넘어왔다면
			//실제 정수로 바꿔준다.
			deptno = Integer.parseInt(str_deptno);
		}
		
		if(deptno == 0) {
			 	list = SawonDAO.getInstance().select();	
		} else {
				list = SawonDAO.getInstance().select(deptno); //메서드 오버로드
		}
		
		
		
		
		request.setAttribute("list", list);
		RequestDispatcher disp = request.getRequestDispatcher("sawon_list.jsp");
		disp.forward(request, response);
	}

}
