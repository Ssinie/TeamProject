package CSBoard;

import java.sql.*;
import java.util.*; 
import connection.ConnectionDAO;

public class csDAO {
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	public void insertArticle(csDTO article) throws Exception {
		int num=article.getCs_num();
		int ref=article.getCs_ref();
		int re_step=article.getCs_re_step();
		int re_level=article.getCs_re_level();
		int number=0;
		String sql="";
		try {
			conn = ConnectionDAO.getConnection();
			pstmt = conn.prepareStatement("select max(num) from board");
			rs = pstmt.executeQuery();
			if (rs.next())
				number=rs.getInt(1)+1;
			else
				number=1;
			if (num!=0) {
				sql="update board set re_step=re_step+1 where ref= ? and re_step> ?";
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
			sql = "insert into board(num,writer,email,subject,passwd,reg_date,";
			sql+="ref,re_step,re_level,content) values(board_seq.NEXTVAL,?,?,?,?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, article.getCs_writer()); 
			pstmt.setString(2, article.getCs_email());
			pstmt.setString(3, article.getCs_subject());
			pstmt.setString(4, article.getCs_password());
			pstmt.setTimestamp(5, article.getCs_reg_date());
			pstmt.setInt(6, ref);
			pstmt.setInt(7, re_step);
			pstmt.setInt(8, re_level);
			pstmt.setString(9, article.getCs_content());
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
			pstmt = conn.prepareStatement("select count(*) from board");
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
	// 위의 카운트에서 해당id가 적은걸로 카운트.
	public int getArticleCount(String id) throws Exception {
		int x=0;
		try {
			conn = ConnectionDAO.getConnection();
			pstmt = conn.prepareStatement("select count(*) from board where writer=? "); //table board에서 게시글 카운트한다.
			pstmt.setString(1, id);
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
	public int getArticleCount(String col, String search) throws Exception {
		int x=0;
		try {
			conn = ConnectionDAO.getConnection();
			String sql = "select count(*) from board where " + col + " like '%"+search+"%'";
			pstmt = conn.prepareStatement("select count(*) from board");
			pstmt = conn.prepareStatement(sql);
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
	//
	public List getArticles(int start, int end) throws Exception {
		List articleList=null;
		try {
			conn = ConnectionDAO.getConnection();
			pstmt = conn.prepareStatement(
					"select num,writer,email,subject,passwd,reg_date,ref,re_step,re_level,content,ip,readcount,r "+
					"from (select num,writer,email,subject,passwd,reg_date,ref,re_step,re_level,content,ip,readcount,rownum r " +
					"from (select num,writer,email,subject,passwd,reg_date,ref,re_step,re_level,content,ip,readcount " +
					"from board order by ref desc, re_step asc) order by ref desc, re_step asc ) where r >= ? and r <= ? ");

					pstmt.setInt(1, start);
					pstmt.setInt(2, end);

					rs = pstmt.executeQuery();
					if (rs.next()) { 
						articleList = new ArrayList(end);
						do{
							csDTO article= new csDTO();
							article.setCs_num(rs.getInt("num"));
							article.setCs_writer(rs.getString("writer"));
							article.setCs_email(rs.getString("email"));
							article.setCs_subject(rs.getString("subject"));
							article.setCs_password(rs.getString("password"));
							article.setCs_reg_date(rs.getTimestamp("reg_date"));
							article.setCs_count(rs.getInt("count"));
							article.setCs_ref(rs.getInt("ref"));
							article.setCs_re_step(rs.getInt("re_step"));
							article.setCs_re_level(rs.getInt("re_level"));
							article.setCs_content(rs.getString("content"));
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
	//위에 리스트에서 id를 기준으로 오버로딩해서 만든것.
	public List getArticles(String id, int start, int end) throws Exception {
		List articleList=null;
		try {
			conn = ConnectionDAO.getConnection();
			pstmt = conn.prepareStatement(
					"select num,writer,email,subject,passwd,reg_date,ref,re_step,re_level,content,ip,readcount,r "+
					"from (select num,writer,email,subject,passwd,reg_date,ref,re_step,re_level,content,ip,readcount,rownum r " +
					"from (select num,writer,email,subject,passwd,reg_date,ref,re_step,re_level,content,ip,readcount " +
					"from board where writer=? order by reg_date desc)  order by reg_date desc ) where r >= ? and r <= ? ");
					pstmt.setString(1, id);
					pstmt.setInt(2, start); 
					pstmt.setInt(3, end); 

					rs = pstmt.executeQuery();
					if (rs.next()) {
						articleList = new ArrayList(end); 
						do{ 
							csDTO article= new csDTO();
							article.setCs_num(rs.getInt("num"));
							article.setCs_writer(rs.getString("writer"));
							article.setCs_email(rs.getString("email"));
							article.setCs_subject(rs.getString("subject"));
							article.setCs_password(rs.getString("password"));
							article.setCs_reg_date(rs.getTimestamp("reg_date"));
							article.setCs_count(rs.getInt("count"));
							article.setCs_ref(rs.getInt("ref"));
							article.setCs_re_step(rs.getInt("re_step"));
							article.setCs_re_level(rs.getInt("re_level"));
							article.setCs_content(rs.getString("content"));
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
	public List getArticles(String col , String search, int start, int end) throws Exception {
		List articleList=null;
		try {
			conn = ConnectionDAO.getConnection();
			pstmt = conn.prepareStatement(
					"select num,writer,email,subject,passwd,reg_date,ref,re_step,re_level,content,ip,readcount,r "+
					"from (select num,writer,email,subject,passwd,reg_date,ref,re_step,re_level,content,ip,readcount,rownum r " +
					"from (select num,writer,email,subject,passwd,reg_date,ref,re_step,re_level,content,ip,readcount " +
					"from board  where "+col+" like '%"+search+"%' order by reg_date desc) order by reg_date desc ) where r >= ? and r <= ? ");
					pstmt.setInt(1, start); 
					pstmt.setInt(2, end);

					rs = pstmt.executeQuery();
					if (rs.next()) {
						articleList = new ArrayList(end); 
						do{
							csDTO article= new csDTO();
							article.setCs_num(rs.getInt("num"));
							article.setCs_writer(rs.getString("writer"));
							article.setCs_email(rs.getString("email"));
							article.setCs_subject(rs.getString("subject"));
							article.setCs_password(rs.getString("password"));
							article.setCs_reg_date(rs.getTimestamp("reg_date"));
							article.setCs_count(rs.getInt("count"));
							article.setCs_ref(rs.getInt("ref"));
							article.setCs_re_step(rs.getInt("re_step"));
							article.setCs_re_level(rs.getInt("re_level"));
							article.setCs_content(rs.getString("content"));
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
	//
	public csDTO getArticle(int num) throws Exception {
		csDTO article=null;
		try {
			conn = ConnectionDAO.getConnection();
			pstmt = conn.prepareStatement("update board set readcount=readcount+1 where num = ?");
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
			pstmt = conn.prepareStatement("select * from board where num = ?");
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				article = new csDTO();
				article.setCs_num(rs.getInt("num"));
				article.setCs_writer(rs.getString("writer"));
				article.setCs_email(rs.getString("email"));
				article.setCs_subject(rs.getString("subject"));
				article.setCs_password(rs.getString("password"));
				article.setCs_reg_date(rs.getTimestamp("reg_date"));
				article.setCs_count(rs.getInt("count"));
				article.setCs_ref(rs.getInt("ref"));
				article.setCs_re_step(rs.getInt("re_step"));
				article.setCs_re_level(rs.getInt("re_level"));
				article.setCs_content(rs.getString("content"));
			}
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			ConnectionDAO.close(rs, pstmt, conn);
		}
		return article;
	}
	// 정보 업데이트.
	public csDTO updateGetArticle(int num) throws Exception {
		csDTO article=null;
		try {
			conn = ConnectionDAO.getConnection();
			pstmt = conn.prepareStatement("select * from board where num = ?");
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				article = new csDTO();
				article.setCs_num(rs.getInt("num"));
				article.setCs_writer(rs.getString("writer"));
				article.setCs_email(rs.getString("email"));
				article.setCs_subject(rs.getString("subject"));
				article.setCs_password(rs.getString("password"));
				article.setCs_reg_date(rs.getTimestamp("reg_date"));
				article.setCs_count(rs.getInt("count"));
				article.setCs_ref(rs.getInt("ref"));
				article.setCs_re_step(rs.getInt("re_step"));
				article.setCs_re_level(rs.getInt("re_level"));
				article.setCs_content(rs.getString("content"));
			}
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			ConnectionDAO.close(rs, pstmt, conn);
		}return article;
	}
	//정보를 업데이트
	public int updateArticle(csDTO article) throws Exception {
		String dbpasswd=""; // DB패스워드
		String sql="";
		int x=-1;
		try {
			conn = ConnectionDAO.getConnection();
			pstmt = conn.prepareStatement("select passwd from board where num = ?");
			pstmt.setInt(1, article.getCs_num());
			rs = pstmt.executeQuery();
			if(rs.next()){
				dbpasswd= rs.getString("passwd"); //패스워드가 같다면.
				if(dbpasswd.equals(article.getCs_password())){
					sql="update board set writer=?,email=?,subject=?,passwd=?";
					sql+=",content=? where num=?";
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, article.getCs_writer());
					pstmt.setString(2, article.getCs_email());
					pstmt.setString(3, article.getCs_subject());
					pstmt.setString(4, article.getCs_password());
					pstmt.setString(5, article.getCs_content());
					pstmt.setInt(6, article.getCs_num());
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
	//게시판 글 삭제.
	public int deleteArticle(int num, String passwd) throws Exception {
		String dbpasswd=""; //DB에 있는 비밀번호.
		int x=-1;
		try {
			conn = ConnectionDAO.getConnection();
			pstmt = conn.prepareStatement(
			"select passwd from board where num = ?");
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if(rs.next()){
				dbpasswd= rs.getString("passwd");
				if(dbpasswd.equals(passwd)){
					pstmt = conn.prepareStatement("delete from board where num=?");
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
	public int passwdCheck(int num, String passwd) throws Exception {
		String dbpasswd="";
		int x=-1; //글 번호가 잘못되었다.
		try {
			conn = ConnectionDAO.getConnection();
			pstmt = conn.prepareStatement("select passwd from board where num = ?");
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if(rs.next()){
				dbpasswd= rs.getString("passwd");
				if(dbpasswd.equals(passwd)){
					x= 1; // 글 번호에 비밀번호 확인.
				}else
					x= 0; // 비밀번호 틀렸다.
			}
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			ConnectionDAO.close(rs, pstmt, conn);
		}
		return x;
	}
}