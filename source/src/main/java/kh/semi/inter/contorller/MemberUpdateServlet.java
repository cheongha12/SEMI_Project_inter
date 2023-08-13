package kh.semi.inter.contorller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kh.semi.inter.Service.MemberService;
import kh.semi.inter.model.DAO.MemberDAO;
import kh.semi.inter.model.DTO.MemberDTO;

@WebServlet("/memberupdate")
public class MemberUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public MemberUpdateServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String msg = (String) request.getSession().getAttribute("msg");
		if (msg != null) {
			request.getSession().removeAttribute("msg");
			request.setAttribute("msg", msg);
		}
		request.getRequestDispatcher("/WEB-INF/view/memberUpdate.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String loginId = request.getParameter("loginId");
		String loginPw = request.getParameter("loginPw");
		String name = request.getParameter("name");
		String email1 = request.getParameter("email1");
		String email2 = request.getParameter("email2");

		String email = email1 + email2;

		String phone = request.getParameter("phone");
		MemberDTO dto = new MemberDTO(loginId, loginPw, name, email, phone);

		MemberService service = new MemberService();
		int result = service.update(dto);

		
		if (dto != null) {
			request.getSession().setAttribute("loginedInfo", dto);
			
			// 경고창 띄우기 위한 방법 -1
			request.getSession().setAttribute("msg", loginId+"님 회원정보수정에 성공하였습니다.");
			
			response.sendRedirect(request.getContextPath() + "/main");// 로그인 성공 시 메인페이지로 이동

		} else {
			// 경고창 띄우기 위한 방법 -1
			request.getSession().setAttribute("msg", "회원정보수정에 실패 하였습니다.");
			
			response.sendRedirect(request.getContextPath() + "/login"); // 로그인 실패 시 로그인 페이지로 이동
		}
	}

		/*
		 * request.getRequestDispatcher("/WEB-INF/view/memberUpdate.jsp").forward(
		 * request, response);
		 */

	}


