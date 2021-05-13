package Reserve;

import java.sql.Timestamp;

public class ReserveDTO {
	
	private String guest;
	private String tel;
	private String person_no;
	private String reservation_date;
	private String reservation_time;
	private String floor;
	private String opt;
	private Timestamp WRITE_TIME;
	private int res_num;
	
	public Timestamp getWRITE_TIME() {
		return WRITE_TIME;
	}
	public void setWRITE_TIME(Timestamp wRITE_TIME) {
		WRITE_TIME = wRITE_TIME;
	}
	public int getRes_num() {
		return res_num;
	}
	public void setRes_num(int res_num) {
		this.res_num = res_num;
	}
	public String getGuest() {
		return guest;
	}
	public void setGuest(String guest) {
		this.guest = guest;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getPerson_no() {
		return person_no;
	}
	public void setPerson_no(String person_no) {
		this.person_no = person_no;
	}
	public String getReservation_date() {
		return reservation_date;
	}
	public void setReservation_date(String reservation_date) {
		this.reservation_date = reservation_date;
	}
	public String getReservation_time() {
		return reservation_time;
	}
	public void setReservation_time(String reservation_time) {
		this.reservation_time = reservation_time;
	}
	public String getFloor() {
		return floor;
	}
	public void setFloor(String floor) {
		this.floor = floor;
	}
	public String getOpt() {
		return opt;
	}
	public void setOpt(String opt) {
		this.opt = opt;
	}
	

}
