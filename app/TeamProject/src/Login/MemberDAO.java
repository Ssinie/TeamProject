package Login;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import connection.ConnectionDAO;

public class MemberDAO {
   private Connection conn = null;
   private PreparedStatement pstmt = null;
   private ResultSet rs = null;

   public void insertMember(MemberDTO dto) {
      try {
         conn = ConnectionDAO.getConnection();  // 1/2단계 메서드 호출
         pstmt = conn.prepareStatement("insert into member values(?,?,?,?,?,?,?,?,?,?,sysdate)");
         pstmt.setString(1, dto.getId());
         pstmt.setString(2, dto.getPw1());
         pstmt.setString(3, dto.getPw2());
         pstmt.setString(4, dto.getName());
         pstmt.setString(5, dto.getYear());
         pstmt.setString(6, dto.getMonth());
         pstmt.setString(7, dto.getDay());
         pstmt.setString(8, dto.getGender());
         pstmt.setString(9, dto.getEmail());
         pstmt.setString(10, dto.getPhone());
         
         pstmt.executeUpdate();
         
      }catch(Exception e) {
         e.printStackTrace();
      }finally {
         ConnectionDAO.close(rs, pstmt, conn);
      }
   }
}
