package org.comstudy21.dbcp;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import org.h2.tools.Server;

public class JdbcUtil {
	static String url = "jdbc:h2:tcp://localhost/~/test"; //DB H2�ּ�
	static String user = "sa";
	static String password = "4197";
	static Connection conn = null;
	
	// �ڹٿ� DB����, JDBC, CONNECTION
	// getConnection �޼ҵ�� javax.sql.DataSource �������̽��� getConnection �޼��忡 ���� �����˴ϴ�.
	// Connection - �����ͺ��̽��� �����ϴ� ��ü.
	public static Connection getConnection() {
		try {
			// ��������
			Server server = Server.createTcpServer(null).start();
			Class.forName("org.h2.Driver");
			System.out.println("����̹� �˻� ����!");
			conn = DriverManager.getConnection(url, user, password);
			// System.out.println(conn);
		} catch (ClassNotFoundException e) {
			System.out.println("����̹� �˻� ����!");
			e.printStackTrace();
		} catch (SQLException e) {
			System.out.println("���� ����!");
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