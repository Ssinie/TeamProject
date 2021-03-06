package QABoard;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import connection.ConnectionDAO;

public class qaDAO {
	private ResultSet rs = null;
	private PreparedStatement pstmt = null;
	private Connection conn = null;
	
	public void insertQABoard(qaDTO dto) throws Exception {
		int num=dto.getNum();
		int ref=dto.getRef();
		int re_step=dto.getRe_step();
		int re_level=dto.getRe_level();
		int number=0;
		String sql="";
		try {
			conn = ConnectionDAO.getConnection();
			pstmt = conn.prepareStatement("select max(num) from qaboard");
			rs = pstmt.executeQuery();
			if (rs.next()) 
				number=rs.getInt(1)+1;	
			else
				number=1;
			if (num!=0) 
			{
				sql="update qaboard set re_step=re_step+1 where ref= ? and re_step> ?";
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
			sql = "insert into qaboard(num,writer,subject,email,content,passwd,save,reg,";
			sql+="readcount,ref,re_step,re_level,status) values(qaboard_seq.NEXTVAL, ?, ?, ?, ?, ?, ?, sysdate, 0, ?, ?, ?, 1)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getWriter());
			pstmt.setString(2, dto.getSubject());
			pstmt.setString(3, dto.getEmail());
			pstmt.setString(4, dto.getContent());
			pstmt.setString(5, dto.getPasswd());
			pstmt.setString(6, dto.getSave());
			pstmt.setInt(7, ref);
			pstmt.setInt(8, re_step);
			pstmt.setInt(9, re_level);
			pstmt.executeUpdate();
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			ConnectionDAO.close(rs, pstmt, conn);
		}
	}
	//게시판 글 카운트.
	public int getQABoardCount() throws Exception {
		int x = 0;
		try {
			conn = ConnectionDAO.getConnection();
			pstmt = conn.prepareStatement("select count(*) from qaboard");
			rs = pstmt.executeQuery();
			if (rs.next()) {
				x= rs.getInt(1); 
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			ConnectionDAO.close(rs, pstmt, conn);
		}return x; 
	}
	public int getQABoardCount (String id) throws Exception {
		int x = 0;
		try {
			conn = ConnectionDAO.getConnection();
			pstmt = conn.prepareStatement("select count(*) from qaboard where writer=? ");
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				x= rs.getInt(1);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			ConnectionDAO.close(rs, pstmt, conn);
		}return x;
	}
	public int getQABoardCount(String col, String search) throws Exception {
		int x = 0;
		try {
			conn = ConnectionDAO.getConnection();
			String sql = "select count(*) from qaboard where " + col + " like '%"+search+"%'";
			pstmt = conn.prepareStatement("select count(*) from qaboard");
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				x= rs.getInt(1);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			ConnectionDAO.close(rs, pstmt, conn);
		}return x; 
	}
	public List getQABoard(int start, int end) throws Exception {
		List QABoardList = null;
		try {
			conn = ConnectionDAO.getConnection();
			pstmt = conn.prepareStatement(
					"select num,writer,subject,email,content,passwd,save,reg,readcount,ref,re_step,re_level,status,r "+
					"from (select num,writer,subject,email,content,passwd,save,reg,readcount,ref,re_step,re_level,status,rownum r " +
					"from (select num,writer,subject,email,content,passwd,save,reg,readcount,ref,re_step,re_level,status " +
					"from qaboard order by ref desc, re_step asc) order by ref desc, re_step asc ) where r >= ? and r <= ? ");
					pstmt.setInt(1, start);
					pstmt.setInt(2, end);
					rs = pstmt.executeQuery();
					if (rs.next()) {
						QABoardList = new ArrayList(end); 
						do{
							qaDTO dto = new qaDTO();
							dto.setNum(rs.getInt("num"));
							dto.setWriter(rs.getString("writer"));
							dto.setSubject(rs.getString("subject"));
							dto.setEmail(rs.getString("email"));
							dto.setContent(rs.getString("content"));
							dto.setPasswd(rs.getString("passwd"));
							dto.setSave(rs.getString("save"));
							dto.setReg(rs.getTimestamp("reg"));
							dto.setReadcount(rs.getInt("readcount"));
							dto.setRef(rs.getInt("ref"));
							dto.setRe_step(rs.getInt("re_step"));
							dto.setRe_level(rs.getInt("re_level"));
							dto.setStatus(rs.getInt("status"));
							QABoardList.add(dto);
						}while(rs.next());
					}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			ConnectionDAO.close(rs, pstmt, conn);
		}return QABoardList;
	}
	public List getQABoard(String id, int start, int end) throws Exception {
		List QABoardList = null;
		try {
			conn = ConnectionDAO.getConnection();
			pstmt = conn.prepareStatement(
					"select num,writer,subject,email,content,passwd,save,reg,readcount,ref,re_step,re_level,status,r "+
					"from (select num,writer,subject,email,content,passwd,save,reg,readcount,ref,re_step,re_level,status,rownum r " +
					"from (select num,writer,subject,email,content,passwd,save,reg,readcount,ref,re_step,re_level,status " +
					"from qaboard where writer=? order by ref desc, re_step asc) order by ref desc, re_step asc ) where r >= ? and r <= ? ");
					pstmt.setString(1, id);
					pstmt.setInt(2, start);
					pstmt.setInt(3, end);

					rs = pstmt.executeQuery();
					if (rs.next()) {
						QABoardList = new ArrayList(end); 
						do{
							qaDTO dto = new qaDTO();
							dto.setNum(rs.getInt("num"));
							dto.setWriter(rs.getString("writer"));
							dto.setSubject(rs.getString("subject"));
							dto.setEmail(rs.getString("email"));
							dto.setContent(rs.getString("content"));
							dto.setPasswd(rs.getString("passwd"));
							dto.setSave(rs.getString("save"));
							dto.setReg(rs.getTimestamp("reg"));
							dto.setReadcount(rs.getInt("readcount"));
							dto.setRef(rs.getInt("ref"));
							dto.setRe_step(rs.getInt("re_step"));
							dto.setRe_level(rs.getInt("re_level"));
							dto.setStatus(rs.getInt("status"));
							QABoardList.add(dto);
						}while(rs.next());
					}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			ConnectionDAO.close(rs, pstmt, conn);
		}return QABoardList;
	}
	public List getQABoard(String col , String search, int start, int end) throws Exception {
		List QABoardList=null;
		try {
			conn = ConnectionDAO.getConnection();
			pstmt = conn.prepareStatement(
					"select num,writer,subject,email,content,passwd,save,reg,readcount,ref,re_step,re_level,status,r "+
					"from (select num,writer,subject,email,content,passwd,save,reg,readcount,ref,re_step,re_level,status,rownum r " +
					"from (select num,writer,subject,email,content,passwd,save,reg,readcount,ref,re_step,re_level,status " +
					"from qaboard where "+col+" like '%"+search+"%' order by reg desc) order by reg desc) where r >= ? and r <= ? ");
					pstmt.setInt(1, start);
					pstmt.setInt(2, end);
					rs = pstmt.executeQuery();
					if (rs.next()) {
						QABoardList = new ArrayList(end);
						do{ 
							qaDTO dto = new qaDTO();
							dto.setNum(rs.getInt("num"));
							dto.setWriter(rs.getString("writer"));
							dto.setSubject(rs.getString("subject"));
							dto.setEmail(rs.getString("email"));
							dto.setContent(rs.getString("content"));
							dto.setPasswd(rs.getString("passwd"));
							dto.setSave(rs.getString("save"));
							dto.setReg(rs.getTimestamp("reg"));
							dto.setReadcount(rs.getInt("readcount"));
							dto.setRef(rs.getInt("ref"));
							dto.setRe_step(rs.getInt("re_step"));
							dto.setRe_level(rs.getInt("re_level"));
							dto.setStatus(rs.getInt("status"));
							QABoardList.add(dto);
						}while(rs.next());
					}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			ConnectionDAO.close(rs, pstmt, conn);
		}return QABoardList;
	}
	public qaDTO getQABoard (int num) throws Exception {
		qaDTO dto = null;
		try {
			conn = ConnectionDAO.getConnection();
			pstmt = conn.prepareStatement("update qaboard set readcount=readcount+1 where num = ?"); 
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
			pstmt = conn.prepareStatement("select * from qaboard where num = ?"); 
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				dto = new qaDTO();
				dto.setNum(rs.getInt("num"));
				dto.setWriter(rs.getString("writer"));
				dto.setEmail(rs.getString("email"));
				dto.setSubject(rs.getString("subject"));
				dto.setPasswd(rs.getString("passwd"));
				dto.setReg(rs.getTimestamp("reg"));
				dto.setReadcount(rs.getInt("readcount"));
				dto.setRef(rs.getInt("ref"));
				dto.setRe_step(rs.getInt("re_step"));
				dto.setRe_level(rs.getInt("re_level"));
				dto.setContent(rs.getString("content"));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			ConnectionDAO.close(rs, pstmt, conn);
		}return dto;
	}
	public qaDTO updateGetQABoard(int num) throws Exception {
		qaDTO dto = null;
		try {
			conn = ConnectionDAO.getConnection();
			pstmt = conn.prepareStatement("select * from qaboard where num = ?"); 
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				dto = new qaDTO();
				dto.setNum(rs.getInt("num"));
				dto.setWriter(rs.getString("writer"));
				dto.setEmail(rs.getString("email"));
				dto.setSubject(rs.getString("subject"));
				dto.setPasswd(rs.getString("passwd"));
				dto.setReg(rs.getTimestamp("reg"));
				dto.setReadcount(rs.getInt("readcount"));
				dto.setRef(rs.getInt("ref"));
				dto.setRe_step(rs.getInt("re_step"));
				dto.setRe_level(rs.getInt("re_level"));
				dto.setContent(rs.getString("content"));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			ConnectionDAO.close(rs, pstmt, conn);
		}return dto;
	}
	public int updateQABoard(qaDTO dto) throws Exception {
		String dbpasswd = "";
		String sql = "";
		int x = -1;
		try {
			conn = ConnectionDAO.getConnection();
			pstmt = conn.prepareStatement("select passwd from qaboard where num = ?");
			pstmt.setInt(1, dto.getNum());
			rs = pstmt.executeQuery();
			if(rs.next()){
				dbpasswd= rs.getString("passwd"); 
				if(dbpasswd.equals(dto.getPasswd())){
					sql="update qaboard set writer=?,email=?,subject=?,passwd=?";
					sql+=",content=? where num=?";
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, dto.getWriter());
					pstmt.setString(2, dto.getEmail());
					pstmt.setString(3, dto.getSubject());
					pstmt.setString(4, dto.getPasswd());
					pstmt.setString(5, dto.getContent());
					pstmt.setInt(6, dto.getNum());
					pstmt.executeUpdate();
					x = 1;
				}else{
					x = 0;
				}
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			ConnectionDAO.close(rs, pstmt, conn);
		}return x;
	}
	public int deleteQABoard(int num, String passwd) throws Exception {
		String dbpasswd="";
		int x=-1;
		try {
			conn = ConnectionDAO.getConnection();
			pstmt = conn.prepareStatement(
			"select passwd from qaboard where num = ?");
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if(rs.next()){
				dbpasswd= rs.getString("passwd");
				if(dbpasswd.equals(passwd)){
					pstmt = conn.prepareStatement("delete from qaboard where num=?");
					pstmt.setInt(1, num);
					pstmt.executeUpdate();
					x= 1; 
				}else
					x= 0; 
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			ConnectionDAO.close(rs, pstmt, conn);
		}return x;
	}
	public int passwdCheck(int num, String passwd) throws Exception {
		String dbpasswd = "";
		int x=-1;
		try {
			conn = ConnectionDAO.getConnection();
			pstmt = conn.prepareStatement("select passwd from qaboard where num = ?");
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if(rs.next()){
				dbpasswd= rs.getString("passwd");
				if(dbpasswd.equals(passwd)){
					x= 1;
				}else
					x= 0;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			ConnectionDAO.close(rs, pstmt, conn);
		}return x;
	}
	
}
