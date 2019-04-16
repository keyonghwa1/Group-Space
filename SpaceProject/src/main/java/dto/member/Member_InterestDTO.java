package dto.member;

import java.util.List;

import dto.space.SpaceDTO;

public class Member_InterestDTO {

	private int interest_no;
	private int member_no;
	private String interest_context;
	//관심사 관련 스페이스 리스트
	private List<SpaceDTO> spaceList;
	
	public Member_InterestDTO() {}
	
	public Member_InterestDTO(int interest_no, int member_no, String interest_context) {

		this.interest_no = interest_no;
		this.member_no = member_no;
		this.interest_context = interest_context;
	}
	
	public Member_InterestDTO(int interest_no, String interest_context) {

		this.interest_no = interest_no;
		this.interest_context = interest_context;
	}

	public Member_InterestDTO(String interest_context, int member_no) {
		this.member_no = member_no;
		this.interest_context = interest_context;
	}

	public Member_InterestDTO(int interest_no, int member_no) {
		this.interest_no = interest_no;
		this.member_no = member_no;
	}
	
	public int getInterest_no() {
		return interest_no;
	}

	public void setInterest_no(int interest_no) {
		this.interest_no = interest_no;
	}

	public int getMember_no() {
		return member_no;
	}

	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}

	public String getInterest_context() {
		return interest_context;
	}

	public void setInterest_context(String interest_context) {
		this.interest_context = interest_context;
	}
	public List<SpaceDTO> getSpaceList() {
		return spaceList;
	}

	public void setSpaceList(List<SpaceDTO> spaceList) {
		this.spaceList = spaceList;
	}

	@Override
	public String toString() {
		return "Member_InterestDTO [interest_no=" + interest_no + ", member_no=" + member_no + ", "
				+ (interest_context != null ? "interest_context=" + interest_context + ", " : "")
				+ (spaceList != null ? "spaceList=" + spaceList : "") + "]";
	}

}
