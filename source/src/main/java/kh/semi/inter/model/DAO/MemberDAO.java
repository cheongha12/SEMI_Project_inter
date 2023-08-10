package kh.semi.inter.model.DAO;

import static kh.semi.inter.jdbc.JdbcTemplate.*;

import java.lang.reflect.Member;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import kh.semi.inter.jdbc.JdbcTemplate;
import kh.semi.inter.model.DTO.MemberDTO;

public class MemberDAO {
    public int join(Connection conn, MemberDTO dto) {
        int result = 0;
		String query = "INSERT INTO MEMBER VALUES(?,?,?,?,?)";
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, dto.getLoginId());
			pstmt.setString(2, dto.getLoginPw());
			pstmt.setString(3, dto.getName());
			pstmt.setString(4, dto.getEmail());
			pstmt.setString(5, dto.getPhone());
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			JdbcTemplate.close(pstmt);
		}
        return result;
    }

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
	public List<MemberDTO> selectList(Connection conn) {
		System.out.println("[Member Dao selectList]");
		List<MemberDTO> result = new ArrayList<MemberDTO>();
		String query = "select * from member"; 
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement(query);
			rs = pstmt.executeQuery();

			while (rs.next() == true) {
				MemberDTO dto = new MemberDTO(
							rs.getString("loginId"),
							rs.getString("loginPw"),
							rs.getString("name"),
							rs.getString("email"),
							rs.getString("phone")
						);
				result.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		System.out.println("[Member Dao selectList] return:" + result);
		return result;
	}
}
	
	
	
	

