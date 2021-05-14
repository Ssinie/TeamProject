package latterboard;

import java.sql.*;
import java.util.*;

import connection.ConnectionDAO;
import event.EventBoardDTO;
import jdk.jshell.spi.ExecutionControl.ExecutionControlException;

public class LatterBoardDAO {
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	
	// 게시글 쓰기
	public void insertArticle(LatterBoardDTO dto) {
		int ref=dto.getRef();
		int number = 0;
		String sql = "";
		try {
			conn = ConnectionDAO.getConnection();
			// pstmt = conn.prepareStatement("select max(num) from latterboard");
			// rs = pstmt.executeQuery();
			// if(rs.next()) {
			//	number = rs.getInt(1)+1;
			//}
			//else {
				number=1;
			//}
			ref = number;
			sql = "insert into latterboard(num,writer,email,subject,reg_date,ref,content,ip,menu,"
					+ "filename,realname,filepath,passwd)";
			sql+="values(latterboard_seq.NEXTVAL,?,?,?,?,?,?,?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getWriter());
			pstmt.setString(2, dto.getEmail());
			pstmt.setString(3, dto.getSubject());
			pstmt.setTimestamp(4, dto.getReg_date());
			pstmt.setInt(5, ref);
			pstmt.setString(6, dto.getContent());
			pstmt.setString(7, dto.getIp());
			pstmt.setString(8, dto.getMenu());
			pstmt.setString(9, dto.getFilename());
			pstmt.setString(10, dto.getRealname());
			pstmt.setString(11, dto.getFilepath());
			pstmt.setString(12, dto.getPasswd());
			pstmt.executeUpdate();
			
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			ConnectionDAO.close(rs, pstmt, conn);
		}
	}
	
	// 총 게시글 갯수 확인
	public int getArticleCount() {
		int x = 0;
		try {
			conn = ConnectionDAO.getConnection();
			pstmt = conn.prepareStatement("select count(*) from latterboard");
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
	
	// 작성자 또는 제목으로 검색하여 게시글 갯수 확인
	public int getArticleCount(String col, String search) {
		int x = 0;
		try {
			conn = ConnectionDAO.getConnection();
			pstmt = conn.prepareStatement("select count(*) from latterboard where " + col + " like '%"+search+"%'");
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
	
	// 게시글 번호를 이용해 게시글 정보 가져오기
	public LatterBoardDTO getArticle(int num) {
		LatterBoardDTO dto = null;
		try {
			conn = ConnectionDAO.getConnection();
			String sql = "update latterboard set readcount=readcount+1 where num = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
			sql = "select * from latterboard where num = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				dto = new LatterBoardDTO();
				dto.setNum(rs.getInt("num"));
				dto.setWriter(rs.getString("writer"));
				dto.setSubject(rs.getString("subject"));
				dto.setEmail(rs.getString("email"));
				dto.setContent(rs.getString("content"));
				dto.setReg_date(rs.getTimestamp("reg_date"));
				dto.setReadcount(rs.getInt("readcount"));
				dto.setIp(rs.getString("ip"));
				dto.setRef(rs.getInt("ref"));
				dto.setFilename(rs.getString("filename"));
				dto.setRealname(rs.getString("realname"));
				dto.setFilepath(rs.getString("filepath"));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			ConnectionDAO.close(rs, pstmt, conn);
		}
		return dto;
	}
	
	// 게시글 리스트 형태로 가져오기
	public List getArticles(int start, int end) {
		List articleList = null;
		try {
			conn = ConnectionDAO.getConnection();
			String sql = "select num,writer,email,subject,reg_date,ref,content,ip,readcount,menu,filename,realname,filepath,r  " + 
						 "from (select num,writer,email,subject,reg_date,ref,content,ip,readcount,menu,filename,realname,filepath,rownum r "+
						 "from (select num,writer,email,subject,reg_date,ref,content,ip,readcount,menu,filename,realname,filepath "+ 
						 "from latterboard order by ref desc) order by reg_date desc) where r >= ? and r <= ? ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				articleList = new ArrayList(end);
				do{
					LatterBoardDTO dto = new LatterBoardDTO();
					dto.setNum(rs.getInt("num"));
					dto.setWriter(rs.getString("writer"));
					dto.setSubject(rs.getString("subject"));
					dto.setEmail(rs.getString("email"));
					dto.setContent(rs.getString("content"));
					dto.setReg_date(rs.getTimestamp("reg_date"));
					dto.setReadcount(rs.getInt("readcount"));
					dto.setIp(rs.getString("ip"));
					dto.setRef(rs.getInt("ref"));
					dto.setMenu(rs.getString("menu"));
					dto.setFilename(rs.getString("filename"));
					dto.setRealname(rs.getString("realname"));
					dto.setFilepath(rs.getString("filepath"));
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
	
	// 게시글 음식타입별로 리스트 형태로 가져오기
		public List getArticles(int start, int end, String menu) {
			List articleList = null;
			try {
				conn = ConnectionDAO.getConnection();
				String sql = "select num,writer,email,subject,reg_date,ref,content,ip,readcount,menu,filename,realname,filepath,r  " + 
							 "from (select num,writer,email,subject,reg_date,ref,content,ip,readcount,menu,filename,realname,filepath,rownum r "+
							 "from (select num,writer,email,subject,reg_date,ref,content,ip,readcount,menu,filename,realname,filepath "+ 
							 "from latterboard where menu=? ) order by reg_date desc) where r >= ? and r <= ? ";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, menu);
				pstmt.setInt(2, start);
				pstmt.setInt(3, end);
				
				rs = pstmt.executeQuery();
				if(rs.next()) {
					articleList = new ArrayList(end);
					do{
						LatterBoardDTO dto = new LatterBoardDTO();
						dto.setNum(rs.getInt("num"));
						dto.setWriter(rs.getString("writer"));
						dto.setSubject(rs.getString("subject"));
						dto.setEmail(rs.getString("email"));
						dto.setContent(rs.getString("content"));
						dto.setReg_date(rs.getTimestamp("reg_date"));
						dto.setReadcount(rs.getInt("readcount"));
						dto.setIp(rs.getString("ip"));
						dto.setRef(rs.getInt("ref"));
						dto.setMenu(rs.getString("menu"));
						dto.setFilename(rs.getString("filename"));
						dto.setRealname(rs.getString("realname"));
						dto.setFilepath(rs.getString("filepath"));
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
	
	// 작성자 조회하여 게시글 검색
	public List getArticles(String col, String search, int start, int end) {
		List articleList = null;
		try {
			conn = ConnectionDAO.getConnection();
			String sql = "select num,writer,subject,email,content,reg_date,ref,ip,readcount,menu,filename,realname,filepath,r " +
					     "from (select num,writer,subject,email,content,reg_date,ref,ip,readcount,menu,filename,realname,filepath,rownum r "+
						 "from (select * from latterboard where "+ col +" like '%"+ search +"%' order by reg_date desc)) where r >= ? and r <= ?";  
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				articleList = new ArrayList(end);
				do {
					LatterBoardDTO dto = new LatterBoardDTO();
					dto.setNum(rs.getInt("num"));
					dto.setWriter(rs.getString("writer"));
					dto.setSubject(rs.getString("subject"));
					dto.setEmail(rs.getString("email"));
					dto.setContent(rs.getString("content"));
					dto.setReg_date(rs.getTimestamp("reg_date"));
					dto.setReadcount(rs.getInt("readcount"));
					dto.setIp(rs.getString("ip"));
					dto.setRef(rs.getInt("ref"));
					dto.setMenu(rs.getString("menu"));
					dto.setFilename(rs.getString("filename"));
					dto.setRealname(rs.getString("realname"));
					dto.setFilepath(rs.getString("filepath"));
					articleList.add(dto);
				}while(rs.next());
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			ConnectionDAO.close(rs, pstmt, conn);
		}
		return articleList;
	}
	
	// 작성자 조회 + 타입 검색하여 게시글 검색
		public List getArticles(String col, String search, int start, int end, String type) {
			List articleList = null;
			try {
				conn = ConnectionDAO.getConnection();
				String sql = "select num,writer,subject,email,content,reg_date,ref,ip,readcount,menu,filename,realname,filepath,r " +
						     "from (select num,writer,subject,email,content,reg_date,ref,ip,readcount,menu,filename,realname,filepath,rownum r "+
							 "from (select * from latterboard where "+ col +" like '%"+ search +"%' and menu =? order by reg_date desc)) where r >= ? and r <= ?";  
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, type);
				pstmt.setInt(2, start);
				pstmt.setInt(3, end);
				rs = pstmt.executeQuery();
				if(rs.next()) {
					articleList = new ArrayList(end);
					do {
						LatterBoardDTO dto = new LatterBoardDTO();
						dto.setNum(rs.getInt("num"));
						dto.setWriter(rs.getString("writer"));
						dto.setSubject(rs.getString("subject"));
						dto.setEmail(rs.getString("email"));
						dto.setContent(rs.getString("content"));
						dto.setReg_date(rs.getTimestamp("reg_date"));
						dto.setReadcount(rs.getInt("readcount"));
						dto.setIp(rs.getString("ip"));
						dto.setRef(rs.getInt("ref"));
						dto.setMenu(rs.getString("menu"));
						dto.setFilename(rs.getString("filename"));
						dto.setRealname(rs.getString("realname"));
						dto.setFilepath(rs.getString("filepath"));
						articleList.add(dto);
					}while(rs.next());
				}
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				ConnectionDAO.close(rs, pstmt, conn);
			}
			return articleList;
		}
	
		//updatePro.jsp 메서드
		public void updateBoard(LatterBoardDTO dto) {
				try {
					conn = ConnectionDAO.getConnection();  // 1/2단계 메서드 호출			
					String sql = "update latterboard set subject=?,content=?,menu=?,filepath=? where num=?";
					pstmt = conn.prepareStatement(sql);   
					pstmt.setString(1, dto.getSubject());
					pstmt.setString(2, dto.getContent());
					pstmt.setString(3, dto.getMenu());
					pstmt.setString(4, dto.getFilepath());
					pstmt.setInt(5, dto.getNum());
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
				"select passwd from latterboard where num = ?");
				pstmt.setInt(1, num);
				rs = pstmt.executeQuery();
				if(rs.next()){
					dbpasswd= rs.getString("passwd");
					if(dbpasswd.equals(passwd)){
						pstmt = conn.prepareStatement("delete from latterboard where num=?");
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