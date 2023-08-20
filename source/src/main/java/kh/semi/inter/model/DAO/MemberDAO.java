package kh.semi.inter.model.DAO;

import static kh.semi.inter.jdbc.JdbcTemplate.*;

import java.lang.reflect.Member;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.spi.DirStateFactory.Result;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import kh.semi.inter.jdbc.JdbcTemplate;
import kh.semi.inter.model.DTO.MemberDTO;
import oracle.jdbc.proxy.annotation.Pre;

public class MemberDAO {
	
	
/*	public int join(SqlSession session, MemberDTO dto )
	{
		int result = 0;
		result = session.insert("memberResultMap1.inter",dto);
		return result;
	}	*/
	
	public int join (SqlSession session , MemberDTO dto) {
		int result = 0 ;
		result = session.insert("memberResultMap1.inter",dto);
		return result;
	}
	/*
	 * public int join(Connection conn, MemberDTO dto) { int result = 0; String
	 * query = "INSERT INTO MEMBER VALUES(?,?,?,?,?)"; PreparedStatement pstmt =
	 * null; try { pstmt = conn.prepareStatement(query); pstmt.setString(1,
	 * dto.getLoginId()); pstmt.setString(2, dto.getLoginPw()); pstmt.setString(3,
	 * dto.getName()); pstmt.setString(4, dto.getEmail()); pstmt.setString(5,
	 * dto.getPhone()); result = pstmt.executeUpdate(); } catch (Exception e) {
	 * e.printStackTrace(); }finally { JdbcTemplate.close(pstmt); } return result; }
	 */
	public int update(SqlSession session, MemberDTO dto) {
		int result = -1;
		result = session.update("memberResultMap1.inter1",dto);
		return result;
	}
	
 /*   public int update(Connection conn, MemberDTO dto) {
		PreparedStatement pstmt = null;
		String qurey = "update MEMBER set loginPw=?, name=?, email=?, phone=? where loginId=?";
		ResultSet rs = null;
		int result = -1;
		
		try {
			pstmt = conn.prepareStatement(qurey);
			pstmt.setString(1, dto.getLoginPw());
			pstmt.setString(2, dto.getName());
			pstmt.setString(3, dto.getEmail());
			pstmt.setString(4, dto.getPhone());
			pstmt.setString(5, dto.getLoginId());
			
			result = pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			JdbcTemplate.close(pstmt);
		}
		
		return result;
	}   */
    
    
    public int delete(Connection conn, MemberDTO dto) {
		System.out.println("[Member Dao delete] bno:" + dto.getLoginId());
		String qurey = "DELETE FROM MEMBER WHERE loginId = ? ";
		PreparedStatement pstmt = null;
		
		int result = 0;
		try {
			pstmt = conn.prepareStatement(qurey);
			pstmt.setString(1, dto.getLoginId());
			result = pstmt.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			
			close(pstmt);
		}
		System.out.println(dto.getLoginId()+ "를 삭제했습니다.");
		
		// 회원탈퇴 성공시 result = 1
		// 실패시 0 or -1
		return result;
	} 

    public boolean checkIdExist(String loginId) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        boolean isExist = false;

        try {
            conn = getConnection(); // 데이터베이스 연결
            String query = "SELECT COUNT(*) FROM member WHERE loginid = ?";
            pstmt = conn.prepareStatement(query);
            pstmt.setString(1, loginId);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                int count = rs.getInt(1);
                isExist = (count > 0);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close(rs);
            close(pstmt);
            close(conn);
        }

        return isExist;
    }
    
    private SqlSessionFactory sqlSessionFactory;
    
    public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
        this.sqlSessionFactory = sqlSessionFactory;
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
				member = new MemberDTO(rs.getString("LOGINID"),
						rs.getString("LOGINPW"),
						rs.getString("name"),
						rs.getString("email"),
						rs.getString("phone")
						);
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
	
	
	
	

