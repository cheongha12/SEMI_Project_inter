package kh.semi.inter.model.DAO;



	import java.sql.Connection;
	import java.sql.PreparedStatement;
	import java.sql.ResultSet;

import kh.semi.inter.model.DTO.MemberDTO;

	public class MemberDAO {
	    private Connection conn; // 데이터베이스 연결을 위한 Connection 객체

	    // 생성자에서 Connection 객체 초기화
	    
	    public MemberDTO login(String loginId, String loginPw) {
	        MemberDTO member = null;
	        
	        String query = "SELECT * FROM tb_MEMBER WHERE LOGINID = ? AND LOGINPW = ?";
	        PreparedStatement pstmt = null;
	        ResultSet rs = null;
	        try  {
	        	pstmt = conn.prepareStatement(query);
	        	pstmt.setString(1, loginId);
	        	pstmt.setString(2, loginPw);
	            rs = pstmt.executeQuery();
	        
	            
	                if (rs.next()) {
	                    member = new MemberDTO();
	                    member.setLoginId(rs.getString("LOGINID"));
	                    member.setLoginPw(rs.getString("LOGINPW"));
	                    member.setName(rs.getString("NAME"));
	                    member.setEmail(rs.getString("EMAIL"));
	                    member.setPhone(rs.getString("PHONE"));
	                }
	            
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	        
	        return member;
	    }
	}


