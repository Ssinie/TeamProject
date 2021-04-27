package CSBoard;

import java.sql.Timestamp;

public class csDTO {
	private int cs_num;
	private String cs_writer;
	private String cs_subject;
	private String cs_email;
	private String cs_content;
	private String cs_password;
	private String cs_file;
	private Timestamp cs_reg_date;
	private int cs_count;
	private int cs_ref;
	private int cs_re_step;
	private int cs_re_level;
	
	public int getCs_num() {
		return cs_num;
	}
	public void setCs_num(int cs_num) {
		this.cs_num = cs_num;
	}
	public String getCs_writer() {
		return cs_writer;
	}
	public void setCs_writer(String cs_writer) {
		this.cs_writer = cs_writer;
	}
	public String getCs_subject() {
		return cs_subject;
	}
	public void setCs_subject(String cs_subject) {
		this.cs_subject = cs_subject;
	}
	public String getCs_email() {
		return cs_email;
	}
	public void setCs_email(String cs_email) {
		this.cs_email = cs_email;
	}
	public String getCs_content() {
		return cs_content;
	}
	public void setCs_content(String cs_content) {
		this.cs_content = cs_content;
	}
	public String getCs_password() {
		return cs_password;
	}
	public void setCs_password(String cs_password) {
		this.cs_password = cs_password;
	}
	public String getCs_file() {
		return cs_file;
	}
	public void setCs_file(String cs_file) {
		this.cs_file = cs_file;
	}
	public Timestamp getCs_reg_date() {
		return cs_reg_date;
	}
	public void setCs_reg_date(Timestamp cs_reg_date) {
		this.cs_reg_date = cs_reg_date;
	}
	public int getCs_count() {
		return cs_count;
	}
	public void setCs_count(int cs_count) {
		this.cs_count = cs_count;
	}
	public int getCs_ref() {
		return cs_ref;
	}
	public void setCs_ref(int cs_ref) {
		this.cs_ref = cs_ref;
	}
	public int getCs_re_step() {
		return cs_re_step;
	}
	public void setCs_re_step(int cs_re_step) {
		this.cs_re_step = cs_re_step;
	}
	public int getCs_re_level() {
		return cs_re_level;
	}
	public void setCs_re_level(int cs_re_level) {
		this.cs_re_level = cs_re_level;
	}
	
}