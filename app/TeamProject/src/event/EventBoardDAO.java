package event;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import connection.ConnectionDAO;

public class EventBoardDAO {
   
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	//DB입력 메서드
	public void insertArticle(EventBoardDTO dto) throws Exception {

		int num=dto.getNum();
		int ref=dto.getRef();
		int re_step=dto.getRe_step();
		int re_level=dto.getRe_level();
		int number=0;
		String sql="";
		try {
			conn = ConnectionDAO.getConnection(); 
			pstmt = conn.prepareStatement("select max(num) from EventBoard");
			rs = pstmt.executeQuery();
			if (rs.next()) 
				number=rs.getInt(1)+1;	
			else
				number=1; 
			if (num!=0) 
			{ 
				sql="update EventBoard set re_step=re_step+1 where ref= ? and re_step> ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, ref);
				pstmt.setInt(2, re_step);
				pstmt.executeUpdate();
				re_step=re_step+1;
				re_level=re_level+1;
			}else{ 
				ref=number;
				re_step=0;
				re_level=0;
			}
 
			sql = "insert into EventBoard(num,subject,writer,passwd,re_date,";
			sql+="ref,re_step,re_level,content) values(EventBoard_seq.NEXTVAL,?,?,?,?,?,?,?,?)";
				pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getSubject());
			pstmt.setString(2, dto.getWriter());
			pstmt.setString(3, dto.getPasswd());
			pstmt.setTimestamp(4, dto.getRe_date());
			pstmt.setInt(5, ref);
			pstmt.setInt(6, re_step);
			pstmt.setInt(7, re_level);
			pstmt.setString(8, dto.getContent());
			pstmt.executeUpdate();
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			ConnectionDAO.close(rs, pstmt, conn);
		}
	}
	
	//리스트 메서드
	public ArrayList<EventBoardDTO> getList() {
	      ArrayList<EventBoardDTO> list = new ArrayList<EventBoardDTO>();
	      try {
	         conn = ConnectionDAO.getConnection();  // 1/2단계 메서드 호출
	         pstmt = conn.prepareStatement("select * from EventBoard order by re_date desc"); 
	         rs = pstmt.executeQuery();
	         
	         while(rs.next()) {
	        	 EventBoardDTO dto = new EventBoardDTO();
	            dto.setNum(rs.getInt("num")); //rs.getInt("num"); 
	            dto.setSubject(rs.getString("subject")); //DB에서 get해서 dto에 set
	            dto.setWriter(rs.getString("writer"));
	            dto.setContent(rs.getString("content"));
	            dto.setReadcount(rs.getInt("readcount"));
	            dto.setRe_date(rs.getTimestamp("re_date"));
	            list.add(dto); //list에 (추가한내용을)dto저장.
	         }
	      }catch(Exception e) {
	         e.printStackTrace();
	      }finally {
	         ConnectionDAO.close(rs, pstmt, conn); //ConnectionDAO에 끊어준 순서대로 1번, 2번, 3번
	      }
	      return list;
	   }  

	//조회수 메서드
	public void readCount(int num) {
		try {
			conn = ConnectionDAO.getConnection();  // 1/2단계 메서드 호출
		    pstmt = conn.prepareStatement("update EventBoard set readcount=readcount+1 where num=? "); 
		    pstmt.setInt(1, num);
		    pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			ConnectionDAO.close(rs, pstmt, conn);
		}
	}   

	//내용 메서드
	 public EventBoardDTO getContent(int num) {
		 EventBoardDTO dto = new EventBoardDTO();
	      try {
	         conn = ConnectionDAO.getConnection();  // 1/2단계 메서드 호출
	         pstmt = conn.prepareStatement("select * from EventBoard where num=? "); 
	         pstmt.setInt(1, num);
	         rs = pstmt.executeQuery();
	         if(rs.next()) {
	            dto.setNum(rs.getInt("num"));
	            dto.setSubject(rs.getString("subject"));
	            dto.setWriter(rs.getString("writer"));      
	            dto.setContent(rs.getString("content"));
	            dto.setReadcount(rs.getInt("readcount"));
	            dto.setRe_date(rs.getTimestamp("re_date"));
	         }
	      }catch(Exception e) {
	         e.printStackTrace();
	      }finally {
	         ConnectionDAO.close(rs, pstmt, conn);
	      }
	      return dto;
	   }
	  
	//update 메서드
	public void updateBoard(EventBoardDTO dto) {
			try {
				conn = ConnectionDAO.getConnection();  // 1/2단계 메서드 호출			
				String sql = "update EventBoard set subject=?,writer=?,content=? where num=?";
				pstmt = conn.prepareStatement(sql);   
				pstmt.setString(1, dto.getSubject());
				pstmt.setString(2, dto.getWriter());
				pstmt.setString(3, dto.getContent());
				pstmt.setInt(4, dto.getNum());
				pstmt.executeUpdate();
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				ConnectionDAO.close(rs, pstmt, conn);
			}
		}

	//삭제 메서드
	public int deleteBoard(int num, String passwd) throws Exception {
		String dbpasswd="";
		int x=-1;
		try {
			conn = ConnectionDAO.getConnection();
			pstmt = conn.prepareStatement(
			"select passwd from EventBoard where num = ?");
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if(rs.next()){
				dbpasswd= rs.getString("passwd");
				if(dbpasswd.equals(passwd)){
					pstmt = conn.prepareStatement("delete from EventBoard where num=?");
					pstmt.setInt(1, num);
					pstmt.executeUpdate();
					x= 1; 
				}else
					x= 0; 
			}
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			ConnectionDAO.close(rs, pstmt, conn);
		}
		return x;
	}
}
	
	
	



