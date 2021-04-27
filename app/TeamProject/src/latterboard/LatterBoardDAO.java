package latterboard;

import java.sql.*;
import connection.ConnectionDAO;

public class LatterBoardDAO {
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	public void insertArticle(LatterBoardDTO dto) {
		int ref=dto.getRef();
		int number = 0;
		String sql = "";
		try {
			conn = ConnectionDAO.getConnection();
			// pstmt = conn.prepareStatement("select max(num) from latterboard");
			// rs = pstmt.executeQuery();
			// if(rs.next()) {
			//	number = rs.getInt(1)+1;
			//}
			//else {
				number=1;
			//}
			ref = number;
			sql = "insert into latterboard(num,writer,email,subject,reg_date,ref,content,ip) ";
			sql+="values(latterboard_seq.NEXTVAL,?,?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getWriter());
			pstmt.setString(2, dto.getEmail());
			pstmt.setString(3, dto.getSubject());
			pstmt.setTimestamp(4, dto.getReg_date());
			pstmt.setInt(5, ref);
			pstmt.setString(6, dto.getContent());
			pstmt.setString(7, dto.getIp());
			pstmt.execute();
			
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			ConnectionDAO.close(rs, pstmt, conn);
		}
	}
}