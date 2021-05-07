package event;

import java.sql.Timestamp;


public class EventBoardDTO {
	private int num;
	private String subject;
	private String writer;
	private String content;
	private String passwd;
	private Timestamp re_date;
	private int readcount;
	private int ref;
	private int re_step;
	private int re_level;
	private String st_date;
	private String end_date;
	private String fileName;
	private String realName;
	private String filePath;
	
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
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
	public String getPasswd() {
		return passwd;
	}
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	public Timestamp getRe_date() {
		return re_date;
	}
	public void setRe_date(Timestamp re_date) {
		this.re_date = re_date;
	}
	public int getReadcount() {
		return readcount;
	}
	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}
	public int getRef() {
		return ref;
	}
	public void setRef(int ref) {
		this.ref = ref;
	}
	public int getRe_step() {
		return re_step;
	}
	public void setRe_step(int re_step) {
		this.re_step = re_step;
	}
	public int getRe_level() {
		return re_level;
	}
	public void setRe_level(int re_level) {
		this.re_level = re_level;
	}
	public String getSt_date() {
		return st_date;
	}
	public String getEnd_date() {
		return end_date;
	}
	public void setSt_date(String st_date) {
		this.st_date = st_date;
	}
	public void setEnd_date(String end_date) {
		this.end_date = end_date;
	}
	public String getFileName() {
		return fileName;
	}
	public String getRealName() {
		return realName;
	}
	public String getFilePath() {
		return filePath;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public void setRealName(String realName) {
		this.realName = realName;
	}
	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}


}
