package kh.semi.inter.contorller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kh.semi.inter.Service.MemberService;
import kh.semi.inter.model.DTO.MemberDTO;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public LoginServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 경고창 띄우기 위한 방법 -2
		String msg = (String) request.getSession().getAttribute("msg");
		if (msg != null) {
			request.getSession().removeAttribute("msg");
			request.setAttribute("msg", msg);
		}

		request.getRequestDispatcher("/WEB-INF/view/login.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String loginId = request.getParameter("loginId");
		String loginPw = request.getParameter("loginPw");
		MemberService service = new MemberService();
		MemberDTO member = service.login(loginId, loginPw);

		if (member != null) {
			//로그인한 정보
			request.getSession().setAttribute("loginedInfo", member);
			
			// 경고창 띄우기 위한 방법 -1
			//request.getSession().setAttribute("msg", loginId+"님 반갑습니다.");
			
			response.sendRedirect(request.getContextPath() + "/main");// 로그인 성공 시 메인페이지로 이동

		} else {
			// 경고창 띄우기 위한 방법 -1
			request.getSession().setAttribute("msg", "아이디와 패스워드를 확인하고 다시 로그인 시도해주세요.");
			
			response.sendRedirect(request.getContextPath() + "/login"); // 로그인 실패 시 로그인 페이지로 이동
		}
	}
}
