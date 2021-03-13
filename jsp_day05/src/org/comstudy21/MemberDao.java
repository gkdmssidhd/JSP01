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
	// 멤버 전체를 검색해서 띄우는거
	static String SELECT_ALL = "SELECT * FROM MEMBER";
	// 멤버에 값들 ?,?,?,? 넣는거
	static String INSERT = "INSERT INTO MEMBER VALUES(?,?,?,?)";
	// 멤버안에 no에 있는 값을 검색하는거
	static String SELECT = "SELECT * FROM MEMBER WHERE NO=?";
	// 멤버안에있는 no값들만 검색
	static String SELECT_NO = "SELECT NO FROM MEMBER";
	/**
	 * Member 고객정보 저장
	 * @param vo
	 */
	
	// 추가
	public static void insert(MemberVo vo) {
		conn = JdbcUtil.getConnection();							// DB 연결
		int maxNo = 0;
		// try catch 에러가 없으면 try 안의 마지막줄까지 다 실행되고 catch는 건너뛴다.
		// 에러가 있으면 try 안 코드의 실행이 중단되고 catch(err)블록으로 제어 흐름 넘어감
		try {
			stmt = conn.createStatement();							// stmt 생성
			rs = stmt.executeQuery(SELECT_NO);						// stmt.executeQuery 로 쿼리 실행하고 rs에 결과 담음
			while(rs.next()) {										// rs.next >> 결과를 한줄한줄 출력
				// Integer은 (wrapper클래스-객체) 
				// 			래퍼클래스->기본타입에 해당하는 데이터를 객체로 포장해주는거 			
				// null값 처리가 용이해서 SQL과 연동할 경우 처리가 용이
				// DB에서 자료형이 정수형이지만 null값이 필요한 경우
				// VO에서 Integer를 사용할 수 있다.
				if(Integer.parseInt(rs.getString("no")) > maxNo) {
					maxNo = Integer.parseInt(rs.getString("no"));
				}
			}
		} catch (SQLException e2) { // 예외처리
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
	// 목록
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
	// 상세보기
	public static MemberVo selectOne(MemberVo vo) {
		MemberVo member = null;
		// DB연결해서
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
	// 삭제
	public static void delete(MemberVo vo) {
		String DELETE = "DELETE FROM MEMBER WHERE no=?";
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
	// 수정
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
	// 1001부터 시작
	public static void main(String[] args) {	
		MemberVo member = selectOne(new MemberVo("1001"));
		System.out.println(member);
	}
}