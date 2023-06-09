package service;

import java.sql.Connection;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class DBService {
	
	// single-ton pattern: 
	// 객체1개만생성해서 지속적으로 서비스하자
	static DBService single = null;

	public static DBService getInstance() {
		//생성되지 않았으면 생성
		//생성되는 순간, single에는 DBService 객체가 포함되게 된다.
		//두 번째 메서드 호출 순간에, single을 확인한다.
		//하지만 static single에는 이미 객체정보가 있으므로,
		//이미 있는 객체를 반환하게 된다.
		if (single == null)
			single = new DBService();
		//생성된 객체정보를 반환
		return single;
	}
	
	DataSource ds;
	
	public DBService() {
		try {
			InitialContext ic = new InitialContext();
			Context ctx = (Context)ic.lookup("java:comp/env");
			ds = (DataSource)ctx.lookup("jdbc/oracle_test");
		} catch (NamingException e) {
			
			e.printStackTrace();
		}	
	}
	
	
	public Connection getConnection() {
		Connection conn = null;
		try {
			conn = ds.getConnection();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return conn;
	}
	
	 
	
	
}
