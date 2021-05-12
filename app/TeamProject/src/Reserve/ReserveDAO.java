package Reserve;

import java.sql.*;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

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
	
	
	public ReserveDTO Reserveinfo(String guest) { 
		ReserveDTO dto = new ReserveDTO();
		try {
		conn = ConnectionDAO.getConnection(); 
		pstmt = conn.prepareStatement("select * from member where id=?");
		pstmt.setString(1, guest);
		rs = pstmt.executeQuery();
		if(rs.next()) {
			dto.setGuest(rs.getString("guest"));
			dto.setTel(rs.getString("tell"));
			dto.setPerson_no(rs.getString("person_no"));
			dto.setReservation_date(rs.getString("reservation_date"));
			dto.setReservation_time(rs.getString("reservation_time"));
			dto.setFloor(rs.getString("floor"));
			dto.setOpt(rs.getString("opt"));
			}
		}catch(Exception e) {
			e.printStackTrace();
			
		}finally {
			ConnectionDAO.close(rs, pstmt, conn);
		}
		return dto;
		}
	
}
	