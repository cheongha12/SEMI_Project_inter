package kh.semi.inter.jdbc;

import javax.annotation.Resource;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class MyBatisTemplate {
	public static SqlSession getSqlSession(boolean autoCommit) {
		SqlSession session = null;
		try {
			SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(Resources.getResourceAsStream("mybatis-config.xml"));
		session = factory.openSession(autoCommit);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return session;
		}
	}

