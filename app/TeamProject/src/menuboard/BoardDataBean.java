package menuboard;


public class BoardDataBean{

	private int num; 
    private String subject;
    private String content;      
    private String name;
	private String type;
    private String fileName;
	private String fileRealName;
	private String fileimage;	
	private String [] ch;
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
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public String getFileRealName() {
		return fileRealName;
	}
	public void setFileRealName(String fileRealName) {
		this.fileRealName = fileRealName;
	}
	public String getFileimage() {
		return fileimage;
	}
	public void setFileimage(String fileimage) {
		this.fileimage = fileimage;
	}
	public String[] getCh() {
		return ch;
	}
	public void setCh(String[] ch) {
		this.ch = ch;
	}
	

}