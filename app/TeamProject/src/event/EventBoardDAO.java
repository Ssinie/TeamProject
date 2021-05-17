package event;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import connection.ConnectionDAO;

public class EventBoardDAO {
   
   private Connection conn = null;
   private PreparedStatement pstmt = null;
   private ResultSet rs = null;
   
   //DB�Է� �޼���
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
         sql+="ref,re_step,re_level,content,st_date,end_date,filePath) values(EventBoard_seq.NEXTVAL,?,?,?,?,?,?,?,?,?,?,?)";
            pstmt = conn.prepareStatement(sql);
         pstmt.setString(1, dto.getSubject());
         pstmt.setString(2, dto.getWriter());
         pstmt.setString(3, dto.getPasswd());
         pstmt.setTimestamp(4, dto.getRe_date());
         pstmt.setInt(5, ref);
         pstmt.setInt(6, re_step);
         pstmt.setInt(7, re_level);
         pstmt.setString(8, dto.getContent());
         pstmt.setString(9, dto.getSt_date());
         pstmt.setString(10, dto.getEnd_date());
         pstmt.setString(11, dto.getFilePath());
         pstmt.executeUpdate();
      } catch(Exception ex) {
         ex.printStackTrace();
      } finally {
         ConnectionDAO.close(rs, pstmt, conn);
      }
   }
   
   //�Խñ� ����Ʈ �޼���
   public List getArticles(int start, int end) {
      List articleList = null;
      try {
         conn = ConnectionDAO.getConnection();
         String sql = "select num,writer,subject,re_date,ref,content,readcount,st_date,end_date,filePath,r " + 
                   "from (select num,writer,subject,re_date,ref,content,readcount,st_date,end_date,filePath,rownum r "+
                   "from (select num,writer,subject,re_date,ref,content,readcount,st_date,end_date,filePath "+ 
                   "from EventBoard order by ref desc) order by re_date desc) where r >= ? and r <= ? ";
         pstmt = conn.prepareStatement(sql);
         pstmt.setInt(1, start);
         pstmt.setInt(2, end);
         
         rs = pstmt.executeQuery();
         if(rs.next()) {
            articleList = new ArrayList(end);
            do{
               EventBoardDTO dto = new EventBoardDTO();
               dto.setNum(rs.getInt("num"));
               dto.setWriter(rs.getString("writer"));
               dto.setSubject(rs.getString("subject"));
               dto.setContent(rs.getString("content"));
               dto.setRe_date(rs.getTimestamp("re_date"));
               dto.setReadcount(rs.getInt("readcount"));
               dto.setRef(rs.getInt("ref"));
               dto.setSt_date(rs.getString("st_date"));
               dto.setEnd_date(rs.getString("end_date"));
               dto.setFilePath(rs.getString("filePath"));
               articleList.add(dto);
            }while(rs.next());
         }
      }catch(Exception e){
         e.printStackTrace();
      }finally {
         ConnectionDAO.close(rs, pstmt, conn);
      }
      return articleList;
   }
   
   //��ȸ�� �޼���
   public void readCount(int num) {
      try {
         conn = ConnectionDAO.getConnection();  // 1/2�ܰ� �޼��� ȣ��
          pstmt = conn.prepareStatement("update EventBoard set readcount=readcount+1 where num=? "); 
          pstmt.setInt(1, num);
          pstmt.executeUpdate();
      }catch(Exception e) {
         e.printStackTrace();
      }finally {
         ConnectionDAO.close(rs, pstmt, conn);
      }
   }   

   //���� �޼���
    public EventBoardDTO getContent(int num) {
       EventBoardDTO dto = new EventBoardDTO();
         try {
            conn = ConnectionDAO.getConnection();  // 1/2�ܰ� �޼��� ȣ��
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
               dto.setSt_date(rs.getString("st_date"));
               dto.setEnd_date(rs.getString("end_date"));
               dto.setFilePath(rs.getString("filePath"));
            }
         }catch(Exception e) {
            e.printStackTrace();
         }finally {
            ConnectionDAO.close(rs, pstmt, conn);
         }
         return dto;
      }
     
   //updatePro.jsp
   public void updateBoard(EventBoardDTO dto) {
         try {
            conn = ConnectionDAO.getConnection();  // 1/2�ܰ� �޼��� ȣ��         
            
            String sql = "update EventBoard set subject=?,writer=?,content=?,st_date=?,end_date=?,filePath=?,fileName=?,realName=? where num=?";
            	if(dto.getFileName()==null) {
            	   sql = "update EventBoard set subject=?,writer=?content=?st_date=?,end_date=? where num=?";
            	}
            pstmt = conn.prepareStatement(sql);   
            pstmt.setString(1, dto.getSubject());
            pstmt.setString(2, dto.getWriter());
            pstmt.setString(3, dto.getContent());
            pstmt.setString(4, dto.getSt_date());
            pstmt.setString(5, dto.getEnd_date());
            if(dto.getFileName()==null) {
            	pstmt.setInt(6, dto.getNum());
            }else {		
            pstmt.setString(6, dto.getFilePath());
            pstmt.setString(7, dto.getFileName());
            pstmt.setString(8, dto.getRealName());
            pstmt.setInt(9, dto.getNum());
            pstmt.executeUpdate();
            }
         }catch(Exception e) {
            e.printStackTrace();
         }finally {
            ConnectionDAO.close(rs, pstmt, conn);
         }
      }
   
   //update 불러오기
   public EventBoardDTO updateGetEventBoard(int num) throws Exception {
      EventBoardDTO dto = null;
      try {
         conn = ConnectionDAO.getConnection();
         pstmt = conn.prepareStatement("select * from EventBoard where num = ?"); 
         pstmt.setInt(1, num);
         rs = pstmt.executeQuery();
         if (rs.next()) {
            dto = new EventBoardDTO();
            dto.setNum(rs.getInt("num"));
            dto.setWriter(rs.getString("writer"));
            dto.setSubject(rs.getString("subject"));
            dto.setRe_date(rs.getTimestamp("re_date"));
            dto.setSt_date(rs.getString("st_date"));
            dto.setEnd_date(rs.getString("end_date"));
            dto.setReadcount(rs.getInt("readcount"));
            dto.setFilePath(rs.getString("filePath"));
            dto.setContent(rs.getString("content"));
         }
      }catch(Exception e) {
         e.printStackTrace();
      }finally {
         ConnectionDAO.close(rs, pstmt, conn);
      }return dto;
   }

   //���� �޼���
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

   //��� �Խñ� Ȯ�� �޼���
   public int getArticleCount() {
      int x = 0;
      try {
         conn = ConnectionDAO.getConnection();
         pstmt = conn.prepareStatement("select count(*) from EventBoard");
         rs = pstmt.executeQuery();
         if(rs.next()) {
            x = rs.getInt(1);
         }
      }catch(Exception e) {
         e.printStackTrace();
      }finally {
         ConnectionDAO.close(rs, pstmt, conn);
      }
      return x;
   }

   //xx������ �޼���
   public ArrayList<EventBoardDTO> selectenddate() {
      ArrayList<EventBoardDTO> endlistabc = new ArrayList<EventBoardDTO>();
      try {
         conn = ConnectionDAO.getConnection();
         String sql = "select * from Eventboard where end_date < sysdate";
         pstmt = conn.prepareStatement(sql);
         rs = pstmt.executeQuery();
         
         while(rs.next()) {
               EventBoardDTO dto = new EventBoardDTO();
               dto.setNum(rs.getInt("num"));
               dto.setWriter(rs.getString("writer"));
               dto.setSubject(rs.getString("subject"));
               dto.setContent(rs.getString("content"));
               dto.setFilePath(rs.getString("filePath"));
               dto.setSt_date(rs.getString("st_date"));
               dto.setEnd_date(rs.getString("end_date"));
               endlistabc.add(dto);            
         }
      }catch(Exception e){
         e.printStackTrace();
      }finally {
         ConnectionDAO.close(rs, pstmt, conn);
      }
         return endlistabc;
      }

   //������<���ó�¥ �������� �ҷ����� getend�޼���... end.jsp
      public List getend(int start, int end) {
         List endlist = null;
         try {
            conn = ConnectionDAO.getConnection();
            String sql = "select num,writer,subject,re_date,ref,content,readcount,st_date,end_date,filePath,r " + 
                   "from (select num,writer,subject,re_date,ref,content,readcount,st_date,end_date,filePath,rownum r "+
                   "from (select num,writer,subject,re_date,ref,content,readcount,st_date,end_date,filePath "+ 
                   "from EventBoard order by ref desc) order by re_date desc) where r >= ? and r <= ? and end_date < sysdate ";
            
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, start);
            pstmt.setInt(2, end);
            
            rs = pstmt.executeQuery();
            if(rs.next()) {
               endlist = new ArrayList(end);
               do{
                  EventBoardDTO dto = new EventBoardDTO();
                  dto.setNum(rs.getInt("num"));
                  dto.setWriter(rs.getString("writer"));
                  dto.setSubject(rs.getString("subject"));
                  dto.setContent(rs.getString("content"));
                  dto.setRe_date(rs.getTimestamp("re_date"));
                  dto.setReadcount(rs.getInt("readcount"));
                  dto.setRef(rs.getInt("ref"));
                  dto.setSt_date(rs.getString("st_date"));
                  dto.setEnd_date(rs.getString("end_date"));
                  dto.setFilePath(rs.getString("filePath"));
                  endlist.add(dto);
               }while(rs.next());
            }
         }catch(Exception e){
            e.printStackTrace();
         }finally {
            ConnectionDAO.close(rs, pstmt, conn);
         }
         return endlist;
      }
      
      
      //������ select * from eventboard where end_date >= sysdate and st_date <= sysdate;... cardlist.jsp
      public List geting(int start, int end) {
         List inglist = null;
         try {
            conn = ConnectionDAO.getConnection();
            String sql = "select num,writer,subject,re_date,ref,content,readcount,st_date,end_date,filePath,r " + 
                   "from (select num,writer,subject,re_date,ref,content,readcount,st_date,end_date,filePath,rownum r "+
                   "from (select num,writer,subject,re_date,ref,content,readcount,st_date,end_date,filePath "+ 
                   "from EventBoard order by ref desc) order by re_date desc) where r >= ? and r <= ? and end_date >= sysdate and st_date <= sysdate ";
            
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, start);
            pstmt.setInt(2, end);
            
            rs = pstmt.executeQuery();
            if(rs.next()) {
               inglist = new ArrayList(end);
               do{
                  EventBoardDTO dto = new EventBoardDTO();
                  dto.setNum(rs.getInt("num"));
                  dto.setWriter(rs.getString("writer"));
                  dto.setSubject(rs.getString("subject"));
                  dto.setContent(rs.getString("content"));
                  dto.setRe_date(rs.getTimestamp("re_date"));
                  dto.setReadcount(rs.getInt("readcount"));
                  dto.setRef(rs.getInt("ref"));
                  dto.setSt_date(rs.getString("st_date"));
                  dto.setEnd_date(rs.getString("end_date"));
                  dto.setFilePath(rs.getString("filePath"));
                  inglist.add(dto);
               }while(rs.next());
            }
         }catch(Exception e){
            e.printStackTrace();
         }finally {
            ConnectionDAO.close(rs, pstmt, conn);
         }
         return inglist;
      }
}
   


   
   


