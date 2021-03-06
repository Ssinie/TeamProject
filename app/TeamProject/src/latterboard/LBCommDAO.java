package latterboard;

import connection.ConnectionDAO;
import java.sql.*;
import java.util.*;

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
	
	// num를 받아와, 댓글정보 리스트 보내주기...
	public List getArticle(int num) {
		List commList = null;
		try {
			conn = ConnectionDAO.getConnection();
			String sql = "select * from latterboard_comm where num = ? order by num_dept";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				commList = new ArrayList();
				do {
					LBCommDTO dto = new LBCommDTO();
					dto.setNum(rs.getInt("num"));
					dto.setNum(rs.getInt("num_dept"));
					dto.setWriter(rs.getString("writer"));
					dto.setContent(rs.getString("content"));
					dto.setReg_date(rs.getTimestamp("reg_date"));
					dto.setIp(rs.getString("ip"));
					commList.add(dto);
				}while(rs.next());
			}
		}catch(Exception e) {
			
		}finally {
			ConnectionDAO.close(rs, pstmt, conn);
		}
		return commList;
	}

}
