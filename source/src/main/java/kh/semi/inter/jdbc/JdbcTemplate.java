package kh.semi.inter.jdbc;

import java.io.BufferedReader;
import java.io.FileReader;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class JdbcTemplate {
	
	public static Connection getConnection() {
		Connection conn = null;
		Statement stmt = null;
		PreparedStatement pstmt = null;
		try {
			// 1. driver 있다면 로딩함. // 없다면 ClassNotFoundException 오류 발생
			Class.forName("oracle.jdbc.driver.OracleDriver");
			// 2. Connection 객체 생성 // dbms와 연결
			conn = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521:xe", "inter", "inter1");
			if(conn != null) {
				System.out.println("DB연결 성공!!!!!!!!!!");
			} else {
				System.out.println("------ DB 연결 실패------");
			}
		} catch (ClassNotFoundException e) {
			// 1. driver (ojdbc.jar) 없음
			e.printStackTrace();
		} catch (SQLException e) {
			// 2. dbms에 연결 실패
			e.printStackTrace();
		}
		return conn;
	}

	public static void close(Connection conn) {
		try {
			if(conn != null) conn.close();
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	public static void close(Statement stmt) {
		try {
			if(stmt != null) stmt.close();
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	public static void close(ResultSet rs) {
		try {
			if(rs != null) rs.close();
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	public static void setAutoCommit(Connection conn, boolean autocommit) {
		try {
			if(conn != null) conn.setAutoCommit(autocommit);
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	public static void commit(Connection conn) {
		try {
			if(conn != null) conn.commit();
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	public static void rollback(Connection conn) {
		try {
			if(conn != null) conn.rollback();
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
}
