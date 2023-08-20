package kh.semi.inter.jdbc;

import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class MyBatisTemplate {
	
	/*	public static SqlSession getSqlSession() {
		String resource = "mybatis-config.xml";
		SqlSession session = null;
		try {
			InputStream is = Resources.getResourceAsStream(resource);
			SqlSessionFactoryBuilder builder = new SqlSessionFactoryBuilder();
			SqlSessionFactory factory = builder.build(is);
			session = factory.openSession(false);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return session;

	}*/
	public static SqlSession getSqlSession() {
		String resourece = "mybatis-config.xml";
		SqlSession session = null;
		try {
			InputStream is = Resources.getResourceAsStream(resourece);
			SqlSessionFactoryBuilder builder = new SqlSessionFactoryBuilder();
			SqlSessionFactory factory = builder.build(is);
			session = factory.openSession(false);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return session;
	}
 } 

