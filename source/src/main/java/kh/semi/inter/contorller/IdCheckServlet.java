package kh.semi.inter.contorller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kh.semi.inter.Service.MemberService;
import kh.semi.inter.model.DAO.MemberDAO;

@WebServlet("/idCheckServlet")
public class IdCheckServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String loginId = request.getParameter("loginId");

        MemberDAO dao = new MemberDAO();
        boolean isExist = dao.checkIdExist(loginId);

        if (isExist) {
            response.getWriter().write("No"); // 중복된 경우
        } else {
            response.getWriter().write("YES"); // 중복되지 않은 경우
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
