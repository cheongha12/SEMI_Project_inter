package kh.semi.inter.contorller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kh.semi.inter.Service.MemberService;
import kh.semi.inter.model.DTO.MemberDTO;

@WebServlet("/WithDrawal")
public class WithDrawalServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public WithDrawalServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*
		 * String loginId = request.getParameter("loginId"); String loginid = (String)
		 * request.getSession().getAttribute("loginid");
		 * 
		 * MemberService service = new MemberService(); int member =
		 * service.delete(loginId); // 회원 정보 삭제
		 * 
		 * if (loginid == null) { response.sendRedirect("login.jsp"); return; }
		 * 
		 * 
		 * 
		 * request.getSession().invalidate(); // 세션 무효화
		 * 
		 * request.getRequestDispatcher("/WEB-INF/view/memberUpdate.jsp").forward(
		 * request, response); }
		 */

	}

}
