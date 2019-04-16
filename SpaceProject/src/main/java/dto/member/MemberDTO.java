package dto.member;

public class MemberDTO {
	
	private int member_no;
	private String member_id;
	private String member_name;
	private String member_email;
	private String member_pwd;
	private String member_context;
	private int member_per;
	
	public MemberDTO() {}

	public MemberDTO(int member_no, String member_id, String member_name, String member_email, String member_pwd,
			String member_context, int member_per) {

		this.member_no = member_no;
		this.member_id = member_id;
		this.member_name = member_name;
		this.member_email = member_email;
		this.member_pwd = member_pwd;
		this.member_context = member_context;
		this.member_per = member_per;
	}
	

	
	/////////////////////////////////////////////////////////////////////
	// getter setter

	public int getMember_no() {
		return member_no;
	}

	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public String getMember_name() {
		return member_name;
	}

	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}

	public String getMember_email() {
		return member_email;
	}

	public void setMember_email(String member_email) {
		this.member_email = member_email;
	}

	public String getMember_pwd() {
		return member_pwd;
	}

	public void setMember_pwd(String member_pwd) {
		this.member_pwd = member_pwd;
	}

	public String getMember_context() {
		return member_context;
	}

	public void setMember_context(String member_context) {
		this.member_context = member_context;
	}

	public int getMember_per() {
		return member_per;
	}

	public void setMember_per(int member_per) {
		this.member_per = member_per;
	}

	@Override
	public String toString() {
		return "MemberDTO [member_no=" + member_no + ", member_id=" + member_id + ", member_name=" + member_name
				+ ", member_email=" + member_email + ", member_pwd=" + member_pwd + ", member_context=" + member_context
				+ ", member_per=" + member_per + "]";
	}

}
