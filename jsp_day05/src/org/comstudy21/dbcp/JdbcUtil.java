package org.comstudy21.dbcp;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import org.h2.tools.Server;

public class JdbcUtil {
	static String url = "jdbc:h2:tcp://localhost/~/test"; //DB H2주소
	static String user = "sa";
	static String password = "4197";
	static Connection conn = null;
	
	// 자바와 DB연결, JDBC, CONNECTION
	// getConnection 메소드는 javax.sql.DataSource 인터페이스의 getConnection 메서드에 의해 지정됩니다.
	// Connection - 데이터베이스와 연결하는 객체.
	public static Connection getConnection() {
		try {
			// 서버연결
			Server server = Server.createTcpServer(null).start();
			Class.forName("org.h2.Driver");
			System.out.println("드라이버 검색 성공!");
			conn = DriverManager.getConnection(url, user, password);
			// System.out.println(conn);
		} catch (ClassNotFoundException e) {
			System.out.println("드라이버 검색 실패!");
			e.printStackTrace();
		} catch (SQLException e) {
			System.out.println("접속 실패!");
			e.printStackTrace();
		}
		return conn;
	}

	public static void close(Connection conn) {
		try {
			if (conn != null)
				conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public static void close(Statement stmt) {
		try {
			if (stmt != null)
				stmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public static void close(ResultSet rs) {
		try {
			if (rs != null)
				rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public static void close(Connection conn, Statement stmt, ResultSet rs) {
		close(rs);
		close(stmt);
		close(conn);
	}
}
