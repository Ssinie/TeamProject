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
	
	
	// �Խñ� ����
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
	
	// �� �Խñ� ���� Ȯ��
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
	
	// �ۼ��� �Ǵ� �������� �˻��Ͽ� �Խñ� ���� Ȯ��
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
	
	// �Խñ� ��ȣ�� �̿��� �Խñ� ���� ��������
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
	
	// �Խñ� ����Ʈ ���·� ��������
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
	
	// �Խñ� ����Ÿ�Ժ��� ����Ʈ ���·� ��������
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
	
	// �ۼ��� ��ȸ�Ͽ� �Խñ� �˻�
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
	
	// �ۼ��� ��ȸ + Ÿ�� �˻��Ͽ� �Խñ� �˻�
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
	
		//updatePro.jsp �޼���
		public void updateBoard(LatterBoardDTO dto) {
				try {
					conn = ConnectionDAO.getConnection();  // 1/2�ܰ� �޼��� ȣ��			
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
	
		//���� �޼���
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
		
		
		//Admin 페이지 korean 후기 total count
		public int getLatterKoreanCount(int num) throws Exception {
			int x = 0;
			try {
				conn = ConnectionDAO.getConnection();
				pstmt = conn.prepareStatement("select count(*) from latterboard where menu = 'korean'");
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
		//Admin 페이지 korean 후기 일일 count
		public int getLatterKoreanDayCount(int num) throws Exception {
			int x = 0;
			try {
				conn = ConnectionDAO.getConnection();
				pstmt = conn.prepareStatement("select count(*) from latterboard where to_char(reg_date,'yy/mm/dd') = to_char(sysdate,'yy/mm/dd') and menu = 'korean'");
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
		//Admin 페이지 Korean 후기 주간 count
		public int getLatterKoreanWeekCount(int num) throws Exception {
			int x = 0;
			try {
				conn = ConnectionDAO.getConnection();
				pstmt = conn.prepareStatement("select count(*) from latterboard where to_char(reg_date,'yy/mm/dd') >= to_char(sysdate-7,'yy/mm/dd') and menu = 'korean'");
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
		//Admin 페이지 Korean 후기 월간 count
		public int getLatterKoreanMonthCount(int num) throws Exception {
			int x = 0;
			try {
				conn = ConnectionDAO.getConnection();
				pstmt = conn.prepareStatement("select count(*) from latterboard where to_char(reg_date,'yy/mm/dd') >= to_char(sysdate-30,'yy/mm/dd') and menu = 'korean'");
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
		
		//Admin 페이지 japanese 후기 count
		public int getLatterjapaneseCount(int num) throws Exception {
			int x = 0;
			try {
				conn = ConnectionDAO.getConnection();
				pstmt = conn.prepareStatement("select count(*) from latterboard where menu = 'japanese'");
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
		//Admin 페이지 japanese 후기 일일 count
		public int getLatterJapaneseDayCount(int num) throws Exception {
			int x = 0;
			try {
				conn = ConnectionDAO.getConnection();
				pstmt = conn.prepareStatement("select count(*) from latterboard where to_char(reg_date,'yy/mm/dd') = to_char(sysdate,'yy/mm/dd') and menu = 'japanese'");
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
		//Admin 페이지 japanese 후기 주간 count
		public int getLatterJapaneseWeekCount(int num) throws Exception {
			int x = 0;
			try {
				conn = ConnectionDAO.getConnection();
				pstmt = conn.prepareStatement("select count(*) from latterboard where to_char(reg_date,'yy/mm/dd') >= to_char(sysdate-7,'yy/mm/dd') and menu = 'japanese'");
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
		//Admin 페이지 japanese 후기 월간 count
		public int getLatterJapaneseMonthCount(int num) throws Exception {
			int x = 0;
			try {
				conn = ConnectionDAO.getConnection();
				pstmt = conn.prepareStatement("select count(*) from latterboard where to_char(reg_date,'yy/mm/dd') >= to_char(sysdate-30,'yy/mm/dd') and menu = 'japanese'");
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

		//Admin 페이지 western 후기 count
		public int getLatterWesternCount(int num) throws Exception {
			int x = 0;
			try {
				conn = ConnectionDAO.getConnection();
				pstmt = conn.prepareStatement("select count(*) from latterboard where menu = 'western'");
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
		//Admin 페이지 western 후기 일일 count
		public int getLatterWesternDayCount(int num) throws Exception {
			int x = 0;
			try {
				conn = ConnectionDAO.getConnection();
				pstmt = conn.prepareStatement("select count(*) from latterboard where to_char(reg_date,'yy/mm/dd') = to_char(sysdate,'yy/mm/dd') and menu = 'western'");
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
		//Admin 페이지 western 후기 주간 count
		public int getLatterWesternWeekCount(int num) throws Exception {
			int x = 0;
			try {
				conn = ConnectionDAO.getConnection();
				pstmt = conn.prepareStatement("select count(*) from latterboard where to_char(reg_date,'yy/mm/dd') >= to_char(sysdate-7,'yy/mm/dd') and menu = 'western'");
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
		//Admin 페이지 western 후기 월간 count
		public int getLatterWesternMonthCount(int num) throws Exception {
			int x = 0;
			try {
				conn = ConnectionDAO.getConnection();
				pstmt = conn.prepareStatement("select count(*) from latterboard where to_char(reg_date,'yy/mm/dd') >= to_char(sysdate-30,'yy/mm/dd') and menu = 'western'");
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
		
}