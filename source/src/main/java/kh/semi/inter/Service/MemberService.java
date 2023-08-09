package kh.semi.inter.Service;

import java.sql.Connection;

import kh.semi.inter.jdbc.JdbcTemplate;
import kh.semi.inter.model.DAO.MemberDAO;
import kh.semi.inter.model.DTO.MemberDTO;

public class MemberService {
	 private MemberDAO dao = new MemberDAO();

	    public MemberDTO login(String loginId, String loginPw) {
	    	Connection conn = JdbcTemplate.getConnection();
	        MemberDTO member = dao.login(conn, loginId, loginPw);
	        JdbcTemplate.close(conn);
	        return member;
	    }
}
