package kr.or.kosta.Dto.Custumer;

public class CustermerDTO {
	String member_id;
	String member_pw;
	String member_name;
	String member_phone;
	String m_loginok;
	String member_redate;
	String member_okdate;
	int member_grade;
	String SHOP_CODE;
	


	public CustermerDTO(){
		
		
	}



	public CustermerDTO(String member_name, String member_phone, String m_loginok, String member_redate, int member_grade, String SHOP_CODE) {
		super();
		this.member_name = member_name;
		this.member_phone = member_phone;
		this.m_loginok = m_loginok;
		this.member_redate = member_redate;
		this.member_grade = member_grade;
		this.SHOP_CODE = SHOP_CODE;
	}


	public CustermerDTO(String member_id, String member_name, String member_phone, String m_loginok, String member_redate ,String member_okdate ,int member_grade, String SHOP_CODE) {
		super();
		this.member_id = member_id;
		this.member_name = member_name;
		this.member_phone = member_phone;
		this.m_loginok = m_loginok;
		this.member_redate = member_redate;
		this.member_okdate = member_okdate;
		this.member_grade = member_grade;
		this.SHOP_CODE = SHOP_CODE;
	}
	
	public CustermerDTO(String member_id, String member_name, String member_phone, String m_loginok, String member_redate ,int member_grade, String SHOP_CODE) {
		super();
		this.member_id = member_id;
		this.member_name = member_name;
		this.member_phone = member_phone;
		this.m_loginok = m_loginok;
		this.member_redate = member_redate;
		this.member_grade = member_grade;
		this.SHOP_CODE = SHOP_CODE;
	}

	public CustermerDTO(String member_id, String member_pw) {
		super();
		this.member_id = member_id;
		this.member_pw = member_pw;
	}
	public CustermerDTO(String member_id, String member_pw, String member_name, String member_phone, String SHOP_CODE, int member_grade) {
		super();
		this.member_id = member_id;
		this.member_pw = member_pw;
		this.member_name = member_name;
		this.member_phone = member_phone;
		this.SHOP_CODE = SHOP_CODE;
		this.member_grade = member_grade;
	}
	public String getmember_id() {
		return member_id;
	}
	public void setmember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getmember_pw() {
		return member_pw;
	}
	public void setmember_pw(String member_pw) {
		this.member_pw = member_pw;
	}
	public String getmember_name() {
		return member_name;
	}
	public void setmember_name(String member_name) {
		this.member_name = member_name;
	}
	public String getmember_phone() {
		return member_phone;
	}
	public void setmember_phone(String member_phone) {
		this.member_phone = member_phone;
	}

	public String getm_loginok() {
		return m_loginok;
	}
	public void setm_loginok(String m_loginok) {
		this.m_loginok = m_loginok;
	}
	
	public int getmember_grade() {
		return member_grade;
	}

	public void setmember_grade(int member_grade) {
		this.member_grade = member_grade;
	}
	
	public String getmember_redate() {
		return member_redate;
	}

	public void setmember_redate(String member_redate) {
		this.member_redate = member_redate;
	}
	
	public String getSHOP_CODE() {
		return SHOP_CODE;
	}

	public void setSHOP_CODE(String SHOP_CODE) {
		this.SHOP_CODE = SHOP_CODE;
	}



	public String getmember_okdate() {
		return member_okdate;
	}



	public void setmember_okdate(String member_okdate) {
		this.member_okdate = member_okdate;
	}
	
	
}
