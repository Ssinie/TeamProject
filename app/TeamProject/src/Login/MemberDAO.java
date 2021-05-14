package Login;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import connection.ConnectionDAO;

public class MemberDAO{
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	public void insertMember(MemberDTO dto) { //inserMember 메소드에 dto에 잇는 값들을 대입
		try {
			conn = ConnectionDAO.getConnection(); //1,2단계 메소드 호출
			pstmt = conn.prepareStatement("insert into member values(?,?,?,?,?,?,?,?,?,?,sysdate)");
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getPw1());
			pstmt.setString(3, dto.getPw2());
			pstmt.setString(4, dto.getName());
			pstmt.setString(5, dto.getYear());
			pstmt.setString(6, dto.getMonth());
			pstmt.setString(7, dto.getDay());
			pstmt.setString(8, dto.getGender());
			pstmt.setString(9, dto.getEmail());
			pstmt.setString(10, dto.getPhone());
			
			pstmt.executeUpdate();
			
			}catch(Exception e) {
				e.printStackTrace();
				
			}finally {
				ConnectionDAO.close(rs, pstmt, conn);
			}
	}
	
	/*
	 * public boolean PwCheck(String id , String pw1, String pw2) { boolean result =
	 * false; try { conn = ConnectionDAO.getConnection(); // 1/2단계 메서드 호출 pstmt =
	 * conn.prepareStatement("select * from member where id=? and pw1=? and pw2=?");
	 * pstmt.setString(1, id); pstmt.setString(2, pw1); pstmt.setString(3, pw2); rs
	 * = pstmt.executeQuery();
	 * 
	 * if(rs.next()) { result = true; } }catch(Exception e) { e.printStackTrace();
	 * }finally { ConnectionDAO.close(rs, pstmt, conn); } return result; }
	 */
	
	
	
	public boolean loginCheck(String id , String pw1) {
		boolean result = false;
		try {
			conn = ConnectionDAO.getConnection();  // 1/2단계 메서드 호출
			pstmt = conn.prepareStatement("select * from member where id=? and pw1=?");            
			pstmt.setString(1, id);
			pstmt.setString(2, pw1);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result = true;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			ConnectionDAO.close(rs, pstmt, conn);
		}
		return result;
	}
	
	
	public MemberDTO getMember(String id) {
		MemberDTO dto = new MemberDTO();
		try {
		conn = ConnectionDAO.getConnection();  // 1/2단계 메서드 호출
		pstmt = conn.prepareStatement("select * from member where id=?");
		pstmt.setString(1, id);
		rs = pstmt.executeQuery();
		if(rs.next()) {
			dto.setPw1(rs.getString("PW1"));
			dto.setId(rs.getString("ID"));
			dto.setName(rs.getString("NAME"));
			dto.setYear(rs.getInt("YEAR")+"");
			dto.setMonth(rs.getInt("MONTH")+"");
			dto.setDay(rs.getInt("DAY")+"");
			dto.setReg(rs.getTimestamp("REG"));
			dto.setGender(rs.getString("GENDER"));
			dto.setEmail(rs.getString("EMAIL"));
			dto.setPhone(rs.getString("PHONE"));
			return dto;
			}
		}catch(Exception e) {
			e.printStackTrace();
			
		}finally {
			ConnectionDAO.close(rs, pstmt, conn);
		}
		return null;
		}
	
	
//  boolean , int , String , DTO , void
	
	public void updateMember(MemberDTO dto) {
		try {
			conn = ConnectionDAO.getConnection();
			String sql = "update Member set pw1=?, pw2=?, name=?,year=?, month=?,day=?,email=?,phone=? where id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getPw1());
			pstmt.setString(2, dto.getPw2());
			pstmt.setString(3, dto.getName());
			pstmt.setString(4, dto.getYear());
			pstmt.setString(5, dto.getMonth());
			pstmt.setString(6, dto.getDay());
			pstmt.setString(7, dto.getEmail());
			pstmt.setString(8, dto.getPhone());
			pstmt.setString(9, dto.getId());
						
			pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
			
		}finally {
			ConnectionDAO.close(rs, pstmt, conn);
		}
	}
	
	public void statusChange(String id) {
		try {
			conn = ConnectionDAO.getConnection();  // 1/2단계 메서드 호출
			pstmt = conn.prepareStatement("update member set status=3 where id=?");
			pstmt.setString(1,id);
			pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			ConnectionDAO.close(rs, pstmt, conn);
		}
	}
	
	public MemberDTO getUserinfo(String id) {  //마이페이지 메소드 정보불러오기 
		MemberDTO dto = new MemberDTO();
		try {
		conn = ConnectionDAO.getConnection();  // 1/2단계 메서드 호출
		pstmt = conn.prepareStatement("select * from member where id=?");
		pstmt.setString(1, id);
		rs = pstmt.executeQuery();
		if(rs.next()) {
			dto.setId(rs.getString("id"));
			dto.setName(rs.getString("name"));
			dto.setYear(rs.getInt("year")+"");
			dto.setMonth(rs.getInt("month")+"");
			dto.setDay(rs.getInt("day")+"");
			dto.setReg(rs.getTimestamp("reg"));
			dto.setGender(rs.getString("gender"));
			dto.setEmail(rs.getString("email"));
			dto.setPhone(rs.getString("phone"));
			}
		}catch(Exception e) {
			e.printStackTrace();
			
		}finally {
			ConnectionDAO.close(rs, pstmt, conn);
		}
		return dto;
		}
}
