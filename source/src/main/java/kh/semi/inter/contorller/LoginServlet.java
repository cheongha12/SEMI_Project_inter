package kh.semi.inter.contorller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kh.semi.inter.Service.MemberService;
import kh.semi.inter.model.DAO.MemberDAO;
import kh.semi.inter.model.DTO.MemberDTO;

@WebServlet("/login")

public class LoginServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
       
    public LoginServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 경고창 띄우기 위한 방법 -2
		/*
		 * String msg = (String)request.getSession().getAttribute("msg"); if(msg !=
		 * null) { request.getSession().removeAttribute("msg");
		 * request.getSession().setAttribute("msg", msg); }
		 */
		
		request.getRequestDispatcher("/WEB-INF/view/login.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String loginId = request.getParameter("loginId");
        String loginPw = request.getParameter("loginPw");
        MemberService service = new MemberService();
        MemberDTO member = service.login(loginId, loginPw);

        if (member != null) {
            request.setAttribute("member", member);
            response.sendRedirect(request.getContextPath()+"/main");
//           request.getRequestDispatcher("/WEB-INF/view/main.jsp").forward(request, response); // 로그인 성공 시 환영 페이지로 이동
        } else {
        	response.sendRedirect(request.getContextPath()+"/login");
//        	request.getRequestDispatcher("/WEB-INF/view/login.jsp").forward(request, response); // 로그인 실패 시 로그인 페이지로 이동
        }
    }
	}


