package latterboard;

import connection.ConnectionDAO;
import java.sql.*;

public class LBCommDAO {
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	// 게시글에 댓글이 몇개있는지 Count 확인 메서드
	public int countComm(int num)
	{
		int x = 0;
		try {
			conn = ConnectionDAO.getConnection();
			String sql = "select count(*) from latterboard_comm where num=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if(rs.next())
			{
				x = rs.getInt(1); 
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			ConnectionDAO.close(rs, pstmt, conn);
		}return x+=1;
	}
	
	// 댓글 입력 메서드
	public void inputComm(LBCommDTO dto, int count) {
		try {
			conn = ConnectionDAO.getConnection();
			String sql = "insert into latterboard_comm(NUM, NUM_DEPT, WRITER, CONTENT, REG_DATE, IP) values(?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, dto.getNum());
			pstmt.setInt(2, count);
			pstmt.setString(3, dto.getWriter());
			pstmt.setString(4, dto.getContent());
			pstmt.setTimestamp(5, dto.getReg_date());
			pstmt.setString(6, dto.getIp());
			pstmt.executeUpdate();
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			ConnectionDAO.close(rs, pstmt, conn);
		}
	}

}
