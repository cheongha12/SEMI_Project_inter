package kh.semi.inter.model.DTO;

public class MemberDTO {
//	"LOGINID"	varCHAR2(20)		NOT NULL,
//	"LOGINPW"	varCHAR2(20)		NOT NULL,
//	"NAME"	varCHAR2(50)		NOT NULL,
//	"EMAIL"	varCHAR2(100)		NOT NULL,
//	"PHONE"	varCHAR2(30)		NULL
	
	private String loginId;
	private String loginPw;
	private String name;
	private String email;
	private String phone;
	
	public MemberDTO(String loginId, String loginPw, String email) {
		super();
		this.loginId = loginId;
		this.loginPw = loginPw;
		this.email = email;
	}
	public MemberDTO() {
		super();
	}
	public MemberDTO(String loginId, String loginPw, String name, String email, String phone) {
		super();
		this.loginId = loginId;
		this.loginPw = loginPw;
		this.name = name;
		this.email = email;
		this.phone = phone;
	}
	@Override
	public String toString() {
		return "MemberDTO [loginId=" + loginId + ", loginPw=" + loginPw + ", name=" + name + ", email=" + email
				+ ", phone=" + phone + "]";
	}
	public String getLoginId() {
		return loginId;
	}
	public void setLoginId(String loginId) {
		this.loginId = loginId;
	}
	public String getLoginPw() {
		return loginPw;
	}
	public void setLoginPw(String loginPw) {
		this.loginPw = loginPw;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	
	
	
	
	
	
}
