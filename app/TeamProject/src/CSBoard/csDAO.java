package CSBoard;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import connection.ConnectionDAO;

public class csDAO{
	private ResultSet rs = null;
	private PreparedStatement pstmt = null;
	private Connection conn = null;
	
	//Write
	public void insertcsBoard(csDTO dto) {
		try {
			conn = ConnectionDAO.getConnection();
			pstmt = conn.prepareStatement("insert into csboard values (csboard_seq.nextval, ?, ?, ?, ?, ?, ?, sysdate, 0, ?, ?, ?, 1)");
			pstmt.setString(1, dto.getWriter());
			pstmt.setString(2, dto.getSubject());
			pstmt.setString(3, dto.getEmail());
			pstmt.setString(4, dto.getContent());
			pstmt.setString(5, dto.getPasswd());
			pstmt.setString(6, dto.getSave());
//			pstmt.setInt(7, dto.getReadcount());
			pstmt.setInt(7, dto.getRef());
			pstmt.setInt(8, dto.getRe_step());
			pstmt.setInt(9, dto.getRe_level());
//			pstmt.setInt(11, dto.getStatus());
//			pstmt.setTimestamp(11, dto.getReg());
			pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			ConnectionDAO.close(rs, pstmt, conn);
		}
	}
	//List
	public ArrayList<csDTO> getList(){
		ArrayList<csDTO> list = new ArrayList<csDTO>();
		try {
			conn = ConnectionDAO.getConnection();
			pstmt = conn.prepareStatement("select * from csboard order by reg desc");
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				csDTO dto = new csDTO();
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
				list.add(dto);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			ConnectionDAO.close(rs, pstmt, conn);
		}return list;
	}
	//Content (조회수 증가)
	public void readCount (int num) {
		try {
			conn = ConnectionDAO.getConnection();
			pstmt = conn.prepareStatement("update csboard set readcount=readcount+1 where num=?");
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			ConnectionDAO.close(rs, pstmt, conn);
		}
	}
	//Content (해당 글 받기)
	public csDTO getContent(int num) {
		csDTO dto = new csDTO();
		try {
			conn = ConnectionDAO.getConnection();
			pstmt = conn.prepareStatement("select * from csboard where num=?");
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if(rs.next()) {
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
			}		
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			ConnectionDAO.close(rs, pstmt, conn);
		}return dto;
	}
	//Delete
	public void deleteBoard(int num) {
		try {
			conn = ConnectionDAO.getConnection();
			pstmt = conn.prepareStatement("update csboard set status=3 where num=?");
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			ConnectionDAO.close(rs, pstmt, conn);
		}
	}
	//Update
	public void updateBoard(csDTO dto) {
		try {
			conn = ConnectionDAO.getConnection();
			String sql = "update csboard set writer=?, subject=?, content=?, save=? where num=?";
			if(dto.getSave() == null) {
				sql = "update csboard set writer=?, subject=?, content=? where num=?";
			}pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getWriter());
			pstmt.setString(2, dto.getSubject());
			pstmt.setString(3, dto.getContent());
			if(dto.getSave() == null) {
				pstmt.setInt(4, dto.getNum());
			}else {
				pstmt.setString(4, dto.getSave());
				pstmt.setInt(5, dto.getNum());
			}
			pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			ConnectionDAO.close(rs, pstmt, conn);
		}
	}
	
}