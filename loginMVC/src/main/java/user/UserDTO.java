package user;

import java.sql.Date;

public class UserDTO {
	private String email;
	private String passwd;
	private String name;
	private String hp;
	private String zipcode;
	private String address1;
	private String address2;
	private Date join_date;
	//getter,setter,toString()
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
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
	public String getHp() {
		return hp;
	}
	public void setHp(String hp) {
		this.hp = hp;
	}
	public String getZipcode() {
		return zipcode;
	}
	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}
	public String getAddress1() {
		return address1;
	}
	public void setAddress1(String address1) {
		this.address1 = address1;
	}
	public String getAddress2() {
		return address2;
	}
	public void setAddress2(String address2) {
		this.address2 = address2;
	}
	public Date getJoin_date() {
		return join_date;
	}
	public void setJoin_date(Date join_date) {
		this.join_date = join_date;
	}
	@Override
	public String toString() {
		return "UserDTO [email=" + email + ", passwd=" + passwd + ", name=" + name + ", hp=" + hp + ", zipcode="
				+ zipcode + ", address1=" + address1 + ", address2=" + address2 + ", join_date=" + join_date + "]";
	}
	
	
}
