package kh.semi.inter.contorller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import static kh.semi.inter.jdbc.JdbcTemplate.*;

import kh.semi.inter.Service.MemberService;
import kh.semi.inter.model.DTO.MemberDTO;

@WebServlet("/WithDrawal")
public class WithDrawalServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public WithDrawalServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String msg = (String) request.getSession().getAttribute("msg");
		if (msg != null) {
			request.getSession().removeAttribute("msg");
			request.setAttribute("msg", msg);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String loginId = request.getParameter("loginId");
		MemberDTO dto = new MemberDTO();
		dto.setLoginId(loginId);
		
		MemberService service = new MemberService();
		// 성공 시 1
		int result = service.delete(dto);
		
		if(result < 1) { // 실패
			// 회원탈퇴 기능 in 마이페이지
			// 알림 탈퇴실패 메시지 - 구현
			request.getSession().setAttribute("msg", loginId+"님 회원탈퇴에 실패하였습니다.");
			request.getRequestDispatcher("/WEB-INF/view/memberUpdate.jsp").forward(request, response); 
		} else {// 탈퇴 성공
			// 회원탈퇴시 -> 세션 로그인(회원)정보 삭제
			request.getSession().setAttribute("msg", loginId+"님 회원탈퇴에 성공하였습니다.");
			request.getSession().removeAttribute("loginedInfo");
			
			// 알림 탈퇴성공 메시지 - 구현
			// 메인페이지 이동
			response.sendRedirect(request.getContextPath()+"/main");	 		
		}

	}

}
