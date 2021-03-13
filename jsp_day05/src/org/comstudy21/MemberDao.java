package org.comstudy21;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import org.comstudy21.dbcp.JdbcUtil;

public class MemberDao {
	/**
	 * Connection conn			: Database ����
	 * Statement stmt 			: �Ķ���Ͱ� ���� �Ϲ� select ������ ���� ��� [executeQuery]
	 * PreparedStatement pstmt	: �Ķ���Ͱ� �ִ� ������(insert, update, delete) ��� [executeUpdate]
	 * ResultSet rs 			: ���� ��� ����
	 */
	private static Connection conn = null;
	private static Statement stmt = null;
	private static PreparedStatement pstmt = null;
	private static ResultSet rs = null;
	
	// ������ ������ ����
	// ��� ��ü�� �˻��ؼ� ���°�
	static String SELECT_ALL = "SELECT * FROM MEMBER";
	// ����� ���� ?,?,?,? �ִ°�
	static String INSERT = "INSERT INTO MEMBER VALUES(?,?,?,?)";
	// ����ȿ� no�� �ִ� ���� �˻��ϴ°�
	static String SELECT = "SELECT * FROM MEMBER WHERE NO=?";
	// ����ȿ��ִ� no���鸸 �˻�
	static String SELECT_NO = "SELECT NO FROM MEMBER";
	/**
	 * Member ������ ����
	 * @param vo
	 */
	
	// �߰�
	public static void insert(MemberVo vo) {
		conn = JdbcUtil.getConnection();							// DB ����
		int maxNo = 0;
		// try catch ������ ������ try ���� �������ٱ��� �� ����ǰ� catch�� �ǳʶڴ�.
		// ������ ������ try �� �ڵ��� ������ �ߴܵǰ� catch(err)������� ���� �帧 �Ѿ
		try {
			stmt = conn.createStatement();							// stmt ����
			rs = stmt.executeQuery(SELECT_NO);						// stmt.executeQuery �� ���� �����ϰ� rs�� ��� ����
			while(rs.next()) {										// rs.next >> ����� �������� ���
				// Integer�� (wrapperŬ����-��ü) 
				// 			����Ŭ����->�⺻Ÿ�Կ� �ش��ϴ� �����͸� ��ü�� �������ִ°� 			
				// null�� ó���� �����ؼ� SQL�� ������ ��� ó���� ����
				// DB���� �ڷ����� ������������ null���� �ʿ��� ���
				// VO���� Integer�� ����� �� �ִ�.
				if(Integer.parseInt(rs.getString("no")) > maxNo) {
					maxNo = Integer.parseInt(rs.getString("no"));
				}
			}
		} catch (SQLException e2) { // ����ó��
			e2.printStackTrace();
		}
		
		try {
			pstmt = conn.prepareStatement(INSERT);
			pstmt.setString(1, ""+ (maxNo+1));
			pstmt.setString(2, vo.getName());
			pstmt.setString(3, vo.getEmail());
			pstmt.setString(4, vo.getPhone());
			int cnt = pstmt.executeUpdate();
			if(cnt > 0) {
				//System.out.println("���� �Ϸ�!");
				conn.commit();
			} else {
				System.out.println("���� ����!");
				conn.rollback();
			}
		} catch (SQLException e) {
			System.out.println("���� ����!");
			try {
				conn.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn, pstmt, rs);
			JdbcUtil.close(stmt);
		}
	}
	// ���
	public static List<MemberVo> selectAll() {
		List<MemberVo> list = new ArrayList<MemberVo>();
		conn = JdbcUtil.getConnection();
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(SELECT_ALL);
			while(rs.next()) {
				MemberVo member = new MemberVo();
				member.setNo(rs.getString(1));
				member.setName(rs.getString(2));
				member.setEmail(rs.getString(3));
				member.setPhone(rs.getString(4));
				list.add(member);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn, stmt, rs);
		}
		
		return list;
	}
	// �󼼺���
	public static MemberVo selectOne(MemberVo vo) {
		MemberVo member = null;
		// DB�����ؼ�
		conn = JdbcUtil.getConnection();
		try {
			pstmt = conn.prepareStatement(SELECT);
			pstmt.setString(1, vo.getNo());
			rs = pstmt.executeQuery();
			if(rs.next()) {
				member = new MemberVo();
				member.setNo(rs.getString(1));
				member.setName(rs.getString(2));
				member.setEmail(rs.getString(3));
				member.setPhone(rs.getString(4));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn, pstmt, rs);
		}
		return member;
	}
	// ����
	public static void delete(MemberVo vo) {
		String DELETE = "DELETE FROM MEMBER WHERE no=?";
		conn = JdbcUtil.getConnection();
		try {
			pstmt = conn.prepareCall(DELETE);
			pstmt.setString(1, vo.getNo());
			int cnt = pstmt.executeUpdate();
			if(cnt > 0) {
				System.out.println("���� �Ϸ�!");
				conn.commit();
			} else {
				System.out.println("���� ����!");
				conn.rollback();
			}
		} catch (SQLException e) {
			try {
				conn.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn, pstmt, rs);
		}
	}
	// ����
	public static void modify(MemberVo vo) {
		String MODIFY = "UPDATE MEMBER SET NAME=?, EMAIL=?, PHONE=? WHERE NO=?";
		conn = JdbcUtil.getConnection();
		try {
			pstmt = conn.prepareStatement(MODIFY);
			pstmt.setString(1, vo.getName());
			pstmt.setString(2, vo.getEmail());
			pstmt.setString(3, vo.getPhone());
			pstmt.setString(4, vo.getNo());
			int cnt  = pstmt.executeUpdate();
			if(cnt > 0) {
				System.out.println("���� �Ϸ�!");
				conn.commit();
			} else {
				System.out.println("���� ����!");
				conn.rollback();
			}
		} catch (SQLException e) {
			e.printStackTrace();
			try {
				System.out.println("���� ����!");
				conn.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
		} finally {
			JdbcUtil.close(conn, pstmt, rs);
		}
	}
	// 1001���� ����
	public static void main(String[] args) {	
		MemberVo member = selectOne(new MemberVo("1001"));
		System.out.println(member);
	}
}