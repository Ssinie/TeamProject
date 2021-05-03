package latterboard;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.*;
import connection.ConnectionDAO;

public class CategoryDAO {
	private PreparedStatement pstmt;
	private Connection conn;
	private ResultSet rs;
	
	public List SearchFood(String type, CategoryDTO dto) {
		List food = null;
		try {
			conn = ConnectionDAO.getConnection();
			String sql ="select name from BOARD2 where type=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, type);
			rs = pstmt.executeQuery();
			if(rs.next()) {				
				food = new ArrayList();
				do {
				food.add(rs.getString("name"));
				}while(rs.next());
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			ConnectionDAO.close(rs, pstmt, conn);
		}
		return food;
	}
}
