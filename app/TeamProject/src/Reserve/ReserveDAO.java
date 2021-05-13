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

	public void insertReservation(ReserveDTO dto) { //reserveDTO媛� dto�뿉 ���엯
		try {
			conn = ConnectionDAO.getConnection();
			pstmt = conn.prepareStatement("insert into reservation values(?,?,?,?,?,?,?,sysdate,RESERVATION_seq.NEXTVAL)");
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
	public ReserveDTO Reserveinfo(String guest) {  //留덉씠�럹�씠吏� 硫붿냼�뱶 �젙蹂대텋�윭�삤湲� 
		ReserveDTO dto = new ReserveDTO();
		try {
		conn = ConnectionDAO.getConnection();  // 1/2�떒怨� 硫붿꽌�뱶 �샇異�
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
	
	// 예약번호(res_num)를 사용하여 예약현황을 조회하는 메서스 만들기
	public ReserveDTO resnumInfo(int res_num) {
		ReserveDTO dto = null;
		try {
			conn = ConnectionDAO.getConnection();
			String sql = "select * from reservation where res_num=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, res_num);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				dto = new ReserveDTO();
				dto.setGuest(rs.getString("guest"));
				dto.setTel(rs.getString("tell"));
				dto.setPerson_no(rs.getString("person_no"));
				dto.setReservation_date(rs.getString("reservation_date"));
				dto.setReservation_time(rs.getString("reservation_time"));
				dto.setFloor(rs.getString("floor"));
				dto.setOpt(rs.getString("opt"));
				dto.setWRITE_TIME(rs.getTimestamp("write_time"));
				dto.setRes_num(res_num);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			ConnectionDAO.close(rs, pstmt, conn);
		}
		return dto;
	}
}
	






