package Reserve;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import Login.MemberDTO;
import connection.ConnectionDAO;

public class ReserveDAO {


	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;

	public void insertReservation(ReserveDTO dto) { //reserveDTO값 dto에 대입
		try {
			conn = ConnectionDAO.getConnection();
			pstmt = conn.prepareStatement("insert into reservation values(?,?,?,?,?,?,?,sysdate)");
			pstmt.setString(1, dto.getGuest());
			pstmt.setString(2, dto.getTel());
			pstmt.setString(3, dto.getPerson_no());
			pstmt.setString(4, dto.getReservation_date());
			pstmt.setString(5, dto.getReservation_time());
			pstmt.setString(6, dto.getFloor());
			pstmt.setString(7, dto.getOpt());
			
			
			pstmt.executeUpdate();
			
			}catch(Exception e) {
				e.printStackTrace();
				
			}finally {
				ConnectionDAO.close(rs, pstmt, conn);
			}		
	}
	public ReserveDTO Reserveinfo(String guest) {  //마이페이지 메소드 정보불러오기 
		ReserveDTO dto = new ReserveDTO();
		try {
		conn = ConnectionDAO.getConnection();  // 1/2단계 메서드 호출
		pstmt = conn.prepareStatement("select * from member where id=?");
		pstmt.setString(1, guest);
		rs = pstmt.executeQuery();
		if(rs.next()) {
			pstmt.setString(1, dto.getGuest());
			pstmt.setString(2, dto.getTel());
			pstmt.setString(3, dto.getPerson_no());
			pstmt.setString(4, dto.getReservation_date());
			pstmt.setString(5, dto.getReservation_time());
			pstmt.setString(6, dto.getFloor());
			pstmt.setString(7, dto.getOpt());
			}
		}catch(Exception e) {
			e.printStackTrace();
			
		}finally {
			ConnectionDAO.close(rs, pstmt, conn);
		}
		return dto;
		}
	
}
	