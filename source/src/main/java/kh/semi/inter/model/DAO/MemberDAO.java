package kh.semi.inter.model.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import kh.semi.inter.jdbc.JdbcTemplate;
import kh.semi.inter.model.DTO.MemberDTO;

public class MemberDAO {
	public MemberDTO login(Connection conn, String loginId, String loginPw) {
		System.out.println("[MemberDAO login ] loginId:"+loginId+", loginPw:"+ loginPw);
		MemberDTO member = null;

		String query = "SELECT * FROM MEMBER WHERE LOGINID = ? AND LOGINPW = ?";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, loginId);
			pstmt.setString(2, loginPw);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				member = new MemberDTO(rs.getString("LOGINID"), rs.getString("LOGINPW"));
			}

		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			JdbcTemplate.close(rs);
			JdbcTemplate.close(pstmt);
		}
		System.out.println("[MemberDAO login ] return: "+member);
		return member;
	}
}
