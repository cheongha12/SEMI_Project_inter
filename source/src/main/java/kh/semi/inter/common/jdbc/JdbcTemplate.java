package kh.semi.inter.common.jdbc;

import java.io.BufferedReader;
import java.io.FileReader;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Properties;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class JdbcTemplate {
	private static DataSource ds = null; // DataSource ds는 아파치톰캣(WAS)가 제공하는 DBCP(DB Connection Pool) 이다.
	public static Connection getConnection() {
		Connection conn = null;
		try {
			Context initCtxt = new InitialContext(); 
			Context envCtxt = (Context)initCtxt.lookup("java:/comp/env");
			DataSource ds = (DataSource)envCtxt.lookup("jdbc/inter");
			conn = ds.getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
		if(conn != null) System.out.println("DBCP 연결성공");
		else System.out.println("DBCP 연결실패");
		return conn;
	}
//	private static Connection conn = null;
//	Singleton
//	public static Connection getConnection() {
//		Properties prop = new Properties();
//		try {
//			String currentPath = JdbcTemplate.class.getResource("./").getPath();
//			prop.load(new BufferedReader(new FileReader(currentPath+"driver.properties")));
//			
//			Class.forName(prop.getProperty("driver"));
//			conn = DriverManager.getConnection(prop.getProperty("url"), prop.getProperty("username"), prop.getProperty("password"));
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		if(conn != null) System.out.println("DB 연결성공");
//		else System.out.println("DB 연결실패");
//		return conn;
//	}
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
