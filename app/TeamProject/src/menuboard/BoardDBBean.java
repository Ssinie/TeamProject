package menuboard;
import java.sql.*;
import java.util.*; 
import connection.ConnectionDAO;

public class BoardDBBean {
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	
public void upload(BoardDataBean BoardDataBean) {
		
		try {
			conn = ConnectionDAO.getConnection(); 
			String sql = "insert into board2 values(board2_seq.nextval,?,?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,BoardDataBean.getSubject());
			pstmt.setString(2,BoardDataBean.getContent());					
			pstmt.setString(3,BoardDataBean.getName());
			pstmt.setString(4,BoardDataBean.getType());			
			pstmt.setString(5,BoardDataBean.getFileName());
			pstmt.setString(6,BoardDataBean.getFileRealName());
			pstmt.setString(7,BoardDataBean.getFileimage());
			pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
	
		}finally {
			ConnectionDAO.close(rs, pstmt, conn);
		}
	
	}
	public void upload2(BoardDataBean BoardDataBean) { //�닔�젙
	
	try {
		conn = ConnectionDAO.getConnection(); 
		
		String sql = "update board2 set subject=?, content=?,filename=?,filerealname=?,fileimage=? where num=?";
		if(BoardDataBean.getFileName() ==null) {
			sql = "update board2 set subject=?, content=? where num=?";
		}
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1,BoardDataBean.getSubject());	
		pstmt.setString(2,BoardDataBean.getContent());	
		if(BoardDataBean.getFileName() ==null) {
			pstmt.setInt(3,BoardDataBean.getNum());
		}else {
			pstmt.setString(3,BoardDataBean.getFileName());
			pstmt.setString(4,BoardDataBean.getFileRealName());
			pstmt.setString(5,BoardDataBean.getFileimage());	
			pstmt.setInt(6,BoardDataBean.getNum());
		}
	
		pstmt.executeUpdate();
		
	} catch(Exception e) {
		e.printStackTrace();

	}finally {
		ConnectionDAO.close(rs, pstmt, conn);
	}

}
	public void delete(BoardDataBean BoardDataBean) { 
		
		try {
			for(int i=0; i<=BoardDataBean.getCh().length-1; i++) {
				conn = ConnectionDAO.getConnection(); 
				pstmt=conn.prepareStatement("delete from board2 where num=?");
				int num=Integer.parseInt(BoardDataBean.getCh()[i]);
				
				pstmt.setInt(1,num);					
				pstmt.executeUpdate();
			}
						
		} catch(Exception e) {
			e.printStackTrace();

		}finally {
			ConnectionDAO.close(rs, pstmt, conn);
		}

	}
		
	
	public int getArticleCount() throws Exception {
		int x=0;
		try {
			conn = ConnectionDAO.getConnection();
			pstmt = conn.prepareStatement("select count(*) from board2");
			rs = pstmt.executeQuery();
			if (rs.next()) {
				x= rs.getInt(1); 
			}
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			ConnectionDAO.close(rs, pstmt, conn);
		}
		return x; 
	}
	

	public List getArticles(int start, int end) throws Exception {
		List articleList=null;
		try {
			conn = ConnectionDAO.getConnection();
			pstmt = conn.prepareStatement(
					"select num,subject,filename,fileimage,type,content,r "+
			 "from (select num,subject,filename,fileimage,type,content,rownum r " +
			"from (select num,subject,filename,fileimage,type,content " + 
							"from board2 )) where r >= ? and r <= ? ");
					pstmt.setInt(1, start); 
					pstmt.setInt(2, end); 

					rs = pstmt.executeQuery();
					if (rs.next()) {
						articleList = new ArrayList(end); 
						do{ 
							BoardDataBean article= new BoardDataBean();
							article.setNum(rs.getInt("num"));
							article.setSubject(rs.getString("subject"));
							article.setFileName(rs.getString("filename"));
							article.setFileimage(rs.getString("fileimage"));
							article.setType(rs.getString("type"));
							article.setContent(rs.getString("content"));
							articleList.add(article); 
						}while(rs.next());
					}
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			ConnectionDAO.close(rs, pstmt, conn);
		}

		
		return articleList;
	}
	
	public BoardDataBean getArticle(int num) throws Exception {
		BoardDataBean article=null;
		try {
			conn = ConnectionDAO.getConnection();
			pstmt = conn.prepareStatement("select * from board2 where num = ?"); 
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				article = new BoardDataBean();
				article.setNum(rs.getInt("num"));
				article.setType(rs.getString("type"));
				article.setFileimage(rs.getString("fileimage"));
				article.setContent(rs.getString("content"));
				article.setSubject(rs.getString("subject"));
			}
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			ConnectionDAO.close(rs, pstmt, conn);
		}
		
		return article;
	}
		
	
}