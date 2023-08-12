package kh.semi.inter.Service;

import static kh.semi.inter.jdbc.JdbcTemplate.close;
import static kh.semi.inter.jdbc.JdbcTemplate.getConnection;

import java.sql.Connection;
import java.util.List;

import kh.semi.inter.jdbc.JdbcTemplate;
import kh.semi.inter.model.DAO.MemberDAO;
import kh.semi.inter.model.DTO.MemberDTO;


public class MemberService {
	 private MemberDAO dao = new MemberDAO();

	    public int join(MemberDTO dto) {
	    	Connection conn = JdbcTemplate.getConnection();
	        int result = dao.join(conn, dto);
	        JdbcTemplate.close(conn);
	        return result;
	    }
	    
	    public MemberDTO login(String loginId, String loginPw) {
	    	Connection conn = JdbcTemplate.getConnection();
	        MemberDTO member = dao.login(conn, loginId, loginPw);
	        JdbcTemplate.close(conn);
	        return member;
	    }
	    
	    public List<MemberDTO> selectList(){
			List<MemberDTO> result = null;
			Connection conn = getConnection();
			result = dao.selectList(conn);
			close(conn);
			return result;
		}
	    

		public int update(MemberDTO dto) {
			int result = -1;
			Connection conn = getConnection();
			result = dao.update(conn,dto);
			close(conn);
			return result;
		}
		public int delete(MemberDTO dto){
			int result = 0;
			Connection conn = getConnection();
			result = dao.delete(conn, dto);
			close(conn);
			return result;
		}
}
