package admin;

import java.util.Date;

public class AdminDTO {
	private String userid;
	private String passwd;
	private String name;
	private int deptno;
	private String email;
	private String hp;
	private Date join_date;
	//getter,setter,toString()
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getPasswd() {
		return passwd;
	}
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getDeptno() {
		return deptno;
	}
	public void setDeptno(int deptno) {
		this.deptno = deptno;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getHp() {
		return hp;
	}
	public void setHp(String hp) {
		this.hp = hp;
	}
	public Date getJoin_date() {
		return join_date;
	}
	public void setJoin_date(Date join_date) {
		this.join_date = join_date;
	}
	@Override
	public String toString() {
		return "AdminDTO [userid=" + userid + ", passwd=" + passwd + ", name=" + name + ", deptno=" + deptno
				+ ", email=" + email + ", hp=" + hp + ", join_date=" + join_date + "]";
	}
}
