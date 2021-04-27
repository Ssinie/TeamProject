package test.board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import test.board.ConnectionDAO;


public class fileDAO {
	private Connection conn=null;
	private PreparedStatement pstmt =null;
	private ResultSet rs = null;
	
	
	public void upload(fileDTO dto) {
		
		try {
			conn = ConnectionDAO.getConnection(); //1,2단계
			String sql = "insert into fileinfo values (?, ?)";
			pstmt = conn.prepareStatement(sql);// 3단계
			pstmt.setString(1,  dto.getFileName());
			pstmt.setString(2,  dto.getFileRealName());
			pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
	
		}finally {
			ConnectionDAO.close(rs, pstmt, conn);
		}
	
	}
}
