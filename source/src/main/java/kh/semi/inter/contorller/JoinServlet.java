package kh.semi.inter.contorller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kh.semi.inter.Service.MemberService;
import kh.semi.inter.model.DTO.MemberDTO;

/**
 * Servlet implementation class JoinServlet
 */
@WebServlet("/join")
public class JoinServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public JoinServlet() {
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

		request.getRequestDispatcher("/WEB-INF/view/join.jsp").forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("진짜 회원가입누르면 -");
		String loginId = request.getParameter("loginId");
		String loginPw = request.getParameter("loginPw");
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		MemberDTO dto = new MemberDTO(loginId, loginPw, name, email, phone);
		int result = new MemberService().join(dto);
		if (result > 0) {
			System.out.println("회원가입성공");
			// 경고창 띄우기 위한 방법 -1
			request.getSession().setAttribute("msg", "회원가입에 성공했습니다. " + loginId + "님 반갑습니다. 로그인해주세요.");

			response.sendRedirect(request.getContextPath() + "/login"); // doGet() 호출
		} else {
			System.out.println("회원가입실패");
			// 경고창 띄우기 위한 방법 -1
			request.getSession().setAttribute("msg", "회원가입에 실패했습니다. 다시 입력해주세요.");

			response.sendRedirect(request.getContextPath() + "/join"); // doGet() 호출
		}
	}

}
