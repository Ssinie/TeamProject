package latterboard;

import java.sql.Timestamp;

public class LBCommDTO {
	private int num;
	private int num_dept;
	private String writer;
	private String content;
	private Timestamp reg_date;
	private String ip;
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public int getNum_dept() {
		return num_dept;
	}
	public void setNum_dept(int num_dept) {
		this.num_dept = num_dept;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		
		this.content = content;
	}
	public Timestamp getReg_date() {
		return reg_date;
	}
	public void setReg_date(Timestamp reg_date) {
		this.reg_date = reg_date;
	}
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	
}
