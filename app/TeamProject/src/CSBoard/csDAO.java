package CSBoard;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import connection.ConnectionDAO;

public class csDAO{
	private ResultSet rs = null;
	private PreparedStatement pstmt = null;
	private Connection conn = null;

	public void insertcsBoard(csDTO dto) {
		try {
			conn = ConnectionDAO.getConnection();
			pstmt = conn.prepareStatement("insert into csboard values(csboard_seq.nextval,?,?,?,?, sysdate)");
			pstmt.setString(1, dto.getWriter());
			pstmt.setString(2, dto.getSubject());
			pstmt.setString(3, dto.getContent());
			pstmt.setString(4, dto.getSave());
			pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			ConnectionDAO.close(rs, pstmt, conn);
		}
	}
}