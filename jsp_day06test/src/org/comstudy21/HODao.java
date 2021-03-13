package org.comstudy21;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import org.comstudy21.dbcp.JdbcUtil;

public class HODao {

	/**
	 * Connection conn			: Database 연결
	 * Statement stmt 			: 파라미터가 없는 일반 select 쿼리문 실행 담당 [executeQuery]
	 * PreparedStatement pstmt	: 파라미터가 있는 쿼리문(insert, update, delete) 담당 [executeUpdate]
	 * ResultSet rs 			: 쿼리 결과 저장
	 */
	private static Connection conn = null;
	private static Statement stmt = null;
	private static PreparedStatement pstmt = null;
	private static ResultSet rs = null;
	
	// 실행할 쿼리문 정의
	static String SELECT_ALL = "SELECT * FROM HO";
	static String INSERT = "INSERT INTO HO VALUES(?,?,?,?)";
	static String SELECT = "SELECT * FROM HO WHERE NO=?";
	static String SELECT_NO = "SELECT NO FROM HO";

	/**
	 * Member 고객정보 저장
	 * @param vo
	 */
	public static void insert(HOVo vo) {
		conn = JdbcUtil.getConnection();							// DB 연결
		int maxNo = 0;
		try {
			stmt = conn.createStatement();							// stmt 생성
			rs = stmt.executeQuery(SELECT_NO);						// stmt.executeQuery 로 쿼리 실행하고 rs에 결과 담음
			while(rs.next()) {										// rs.next >> 결과를 한줄한줄 출력
				if(Integer.parseInt(rs.getString("no")) > maxNo) {
					maxNo = Integer.parseInt(rs.getString("no"));
				}
			}
		} catch (SQLException e2) {
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
				//System.out.println("저장 완료!");
				conn.commit();
			} else {
				System.out.println("저장 실패!");
				conn.rollback();
			}
		} catch (SQLException e) {
			System.out.println("저장 실패!");
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
	
	public static List<HOVo> selectAll() {
		List<HOVo> list = new ArrayList<HOVo>();
		conn = JdbcUtil.getConnection();
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(SELECT_ALL);
			while(rs.next()) {
				HOVo HO = new HOVo();
				HO.setNo(rs.getString(1));
				HO.setName(rs.getString(2));
				HO.setEmail(rs.getString(3));
				HO.setPhone(rs.getString(4));
				list.add(HO);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn, stmt, rs);
		}
		
		return list;
	}
	
	public static HOVo selectOne(HOVo vo) {
		HOVo HO = null;
		
		conn = JdbcUtil.getConnection();
		try {
			pstmt = conn.prepareStatement(SELECT);
			pstmt.setString(1, vo.getNo());
			rs = pstmt.executeQuery();
			if(rs.next()) {
				HO = new HOVo();
				HO.setNo(rs.getString(1));
				HO.setName(rs.getString(2));
				HO.setEmail(rs.getString(3));
				HO.setPhone(rs.getString(4));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn, pstmt, rs);
		}
		return HO;
	}
	
	public static void delete(HOVo vo) {
		String DELETE = "DELETE FROM HO WHERE no=?";
		conn = JdbcUtil.getConnection();
		try {
			pstmt = conn.prepareCall(DELETE);
			pstmt.setString(1, vo.getNo());
			int cnt = pstmt.executeUpdate();
			if(cnt > 0) {
				System.out.println("삭제 완료!");
				conn.commit();
			} else {
				System.out.println("삭제 실패!");
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
	
	public static void modify(HOVo vo) {
		String MODIFY = "UPDATE HO SET NAME=?, EMAIL=?, PHONE=? WHERE NO=?";
		conn = JdbcUtil.getConnection();
		try {
			pstmt = conn.prepareStatement(MODIFY);
			pstmt.setString(1, vo.getName());
			pstmt.setString(2, vo.getEmail());
			pstmt.setString(3, vo.getPhone());
			pstmt.setString(4, vo.getNo());
			int cnt  = pstmt.executeUpdate();
			if(cnt > 0) {
				System.out.println("수정 완료!");
				conn.commit();
			} else {
				System.out.println("수정 실패!");
				conn.rollback();
			}
		} catch (SQLException e) {
			e.printStackTrace();
			try {
				System.out.println("수정 실패!");
				conn.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
		} finally {
			JdbcUtil.close(conn, pstmt, rs);
		}
	}
	
	public static void main(String[] args) {
		//insert(new MemberVo("1004", "TEST", "test@a.com", "010-1111-2222"));
		
//		List<MemberVo> list = selectAll();
//		for(MemberVo vo : list) {
//			System.out.println(vo);
//		}
		
		HOVo HO = selectOne(new HOVo("1001"));
		System.out.println(HO);
	}
}