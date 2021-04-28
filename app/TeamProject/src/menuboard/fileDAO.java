package menuboard;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import connection.ConnectionDAO;


public class fileDAO {
	private Connection conn=null;
	private PreparedStatement pstmt =null;
	private ResultSet rs = null;
	
	
	public void upload(fileDTO filedto) {
		
		try {
			conn = ConnectionDAO.getConnection(); 
			String sql = "insert into menu values(?,?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,filedto.getSubject());
			pstmt.setString(2,filedto.getName());
			pstmt.setString(3,filedto.getType());
			pstmt.setString(4,filedto.getContent());
			pstmt.setString(5,filedto.getFileName());
			pstmt.setString(6,filedto.getFileRealName());
			pstmt.setString(7,filedto.getFileimage());
			pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
	
		}finally {
			ConnectionDAO.close(rs, pstmt, conn);
		}
	
	}
}
