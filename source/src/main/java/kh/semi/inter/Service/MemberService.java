package kh.semi.inter.Service;

import kh.semi.inter.model.DAO.MemberDAO;
import kh.semi.inter.model.DTO.MemberDTO;

public class MemberService {
	 private MemberDAO dao = new MemberDAO();

	    public MemberDTO login(String loginId, String loginPw) {
	        MemberDTO member = dao.login(loginId, loginPw);
	        return member;
	    }
}
