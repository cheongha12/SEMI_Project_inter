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

@WebServlet("/myPage")
public class MyPageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public MyPageServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {  
		
		MemberDTO loginInfo = (MemberDTO) request.getSession().getAttribute("loginedInfo");
		
		String email = loginInfo.getEmail();
		String[] emailArr = email.split("@"); // cgm@namer.com
		String email1 = emailArr[0]; // cgm
		String email2 = "@" + emailArr[1]; // @namer.com
		
		request.setAttribute("loginInfo",loginInfo);
		request.setAttribute("email1",email1);
		request.setAttribute("email2",email2);
		
		request.getRequestDispatcher("/WEB-INF/view/memberUpdate.jsp").forward(request, response);   
	}
	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		request.getRequestDispatcher("/WEB-INF/view/memberUpdate.jsp").forward(request, response);
	}

}
