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
	public void upload2(BoardDataBean BoardDataBean) { //수정
	
	try {
		conn = ConnectionDAO.getConnection(); 
		pstmt=conn.prepareStatement("update board2 set subject=?, content=?,filename=?,filerealname=?,fileimage=? where num=?");
			
		pstmt.setString(1,BoardDataBean.getSubject());	
		pstmt.setString(2,BoardDataBean.getContent());						
		pstmt.setString(3,BoardDataBean.getFileName());
		pstmt.setString(4,BoardDataBean.getFileRealName());
		pstmt.setString(5,BoardDataBean.getFileimage());
		pstmt.setInt(6,BoardDataBean.getNum());
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
				int a=Integer.parseInt(BoardDataBean.getCh()[i]);
				
				pstmt.setInt(1,a);	
				
				pstmt.executeUpdate();
			}
			
			
		} catch(Exception e) {
			e.printStackTrace();

		}finally {
			ConnectionDAO.close(rs, pstmt, conn);
		}

	}
	
	public void insertArticle(BoardDataBean article) throws Exception {
		int num=article.getNum();
		int ref=article.getRef();
		int re_step=article.getRe_step();
		int re_level=article.getRe_level();
		int number=0;
		String sql="";
		try {
			conn = ConnectionDAO.getConnection(); 
			pstmt = conn.prepareStatement("select max(num) from board2");
			rs = pstmt.executeQuery();
			if (rs.next()) 
				number=rs.getInt(1)+1;	
			else
				number=1; 
			if (num!=0) 
			{ 
				sql="update board2 set re_step=re_step+1 where ref= ? and re_step> ?";
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
 
			sql = "insert into board2(num,writer,email,subject,passwd,reg_date,";
			sql+="ref,re_step,re_level,content,ip) values(board2_seq.NEXTVAL,?,?,?,?,?,?,?,?,?,?)";
				pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, article.getWriter());
			pstmt.setString(2, article.getEmail());
			pstmt.setString(3, article.getSubject());
			pstmt.setString(4, article.getPasswd());
			pstmt.setTimestamp(5, article.getReg_date());
			pstmt.setInt(6, ref);
			pstmt.setInt(7, re_step);
			pstmt.setInt(8, re_level);
			pstmt.setString(9, article.getContent());
			pstmt.setString(10, article.getIp());
			pstmt.executeUpdate();
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
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
	
	
	public BoardDataBean updateGetArticle(int num) throws Exception {
		BoardDataBean article=null;
		try {
			conn = ConnectionDAO.getConnection();
			pstmt = conn.prepareStatement(
			"select * from board2 where num = ?"); 
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				article = new BoardDataBean();
				article.setNum(rs.getInt("num"));
				article.setWriter(rs.getString("writer"));
				article.setEmail(rs.getString("email"));
				article.setSubject(rs.getString("subject"));
				article.setPasswd(rs.getString("passwd"));
				article.setReg_date(rs.getTimestamp("reg_date"));
				article.setReadcount(rs.getInt("readcount"));
				article.setRef(rs.getInt("ref"));
				article.setRe_step(rs.getInt("re_step"));
				article.setRe_level(rs.getInt("re_level"));
				article.setContent(rs.getString("content"));
				article.setIp(rs.getString("ip"));
			}
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			ConnectionDAO.close(rs, pstmt, conn);
		}

		return article;
	}
	

	public int updateArticle(BoardDataBean article) throws Exception {
		String dbpasswd="";
		String sql="";
		int x=-1;
		try {
			conn = ConnectionDAO.getConnection();
			pstmt = conn.prepareStatement(
			"select passwd from board2 where num = ?");
			pstmt.setInt(1, article.getNum());
			rs = pstmt.executeQuery();
			if(rs.next()){
				dbpasswd= rs.getString("passwd"); 
				if(dbpasswd.equals(article.getPasswd())){
					sql="update board2 set writer=?,email=?,subject=?,passwd=?";
					sql+=",content=? where num=?";
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, article.getWriter());
					pstmt.setString(2, article.getEmail());
					pstmt.setString(3, article.getSubject());
					pstmt.setString(4, article.getPasswd());
					pstmt.setString(5, article.getContent());
					pstmt.setInt(6, article.getNum());
					pstmt.executeUpdate();
					x= 1;
				}else{
					x= 0;
				}
			}
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			ConnectionDAO.close(rs, pstmt, conn);
		}
		return x;
	}
	

	public int deleteArticle(int num, String passwd) throws Exception {
		String dbpasswd="";
		int x=-1;
		try {
			conn = ConnectionDAO.getConnection();
			pstmt = conn.prepareStatement(
			"select passwd from board2 where num = ?");
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if(rs.next()){
				dbpasswd= rs.getString("passwd");
				if(dbpasswd.equals(passwd)){
					pstmt = conn.prepareStatement("delete from board2 where num=?");
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