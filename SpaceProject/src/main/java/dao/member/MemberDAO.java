package dao.member;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import dto.member.MemberDTO;
import dto.member.Member_InterestDTO;
import dto.space.HashTagDTO;
import dto.space.SpaceApprovalDTO;
import dto.space.SpaceDTO;

public class MemberDAO {

	SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	public int insert(MemberDTO memberdto) {
		int res = 0;
		res = sqlSession.insert("member.member_insert", memberdto);
		return res;
	}

	public MemberDTO checkId(String member_id) { // insert-> member_interest // member id
		MemberDTO memberDTO = null;
		memberDTO = sqlSession.selectOne("member.check_id", member_id);
		return memberDTO;
	}

	public void delete(int member_no) {
		sqlSession.delete("member.member_delete", member_no);
	}

	public int update(MemberDTO memberdto) {
		int res = 0;
		res = sqlSession.update("member.member_update", memberdto);
		return res;
	}

	public List<MemberDTO> selectList() { // 목록
		List<MemberDTO> list = null;
		list = sqlSession.selectList("member.member_list");
		return list;
	}

	public MemberDTO select_no(int member_no) { // 업데이트 회원 select
		MemberDTO memberdto = sqlSession.selectOne("member.member_select_no", member_no);
		return memberdto;
	}

	public int insert_interest(Member_InterestDTO member_interest) { // member insert_interest
		int res = 0;
		res = sqlSession.insert("memberInterest.interest_insert", member_interest);
		return res;
	}

	public int update_interest(Member_InterestDTO interestDTO) {
		int res = 0;
		res = sqlSession.update("memberInterest.Interest_update", interestDTO);
		return res;
	}

	public void delete_Interest(int member_no) {
		sqlSession.delete("memberInterest.member_Interest_delete", member_no);
	}

	public List<MemberDTO> Interest_context(int member_no) { // member_interest -> id
		List<MemberDTO> list = null;
		list = sqlSession.selectList("memberInterest.interest_context", member_no);
		return list;
	}

	public void delete_Interest_context(String member_no1) {
		sqlSession.delete("memberInterest.member_Interest_context_delete", member_no1);

	}

	public List<Member_InterestDTO> select_Interest_no(int member_no) {
		List<Member_InterestDTO> list = null;
		list = sqlSession.selectList("memberInterest.interest_list", member_no);
		return list;
	}

	public int insert_interest_context(Member_InterestDTO member_interest_dto) {
		int res = 0;
		res = sqlSession.insert("memberInterest.interest_insert", member_interest_dto);
		return res;

	}

	public void delete_Interest_no(Member_InterestDTO member_interest_dto) {
		sqlSession.delete("memberInterest.delete_Interest_no", member_interest_dto);
	}

	//내 스페이스 목록 가져오기
	public List<SpaceDTO> mySpaceList(int member_no) {
		List<SpaceDTO> list = null;
		list = sqlSession.selectList("space.my_space_list", member_no);
		return list;
	}

	//가입한 스페이스 목록 가져오기
	public List<SpaceDTO> joinSpaceList(int member_no) {
		List<SpaceDTO> list = null;
		list = sqlSession.selectList("space.join_space_list", member_no);
		return list;
	}
	
	public List<HashTagDTO> hashtagList(int space_no) {
		List<HashTagDTO> list = null;
		list = sqlSession.selectList("hashtag.hashtag_list", space_no);
		return list;
	}

	//회원에 대한 스페이스 가입 신청 목록 가져오기
	public List<SpaceApprovalDTO> spaceApprovalList(int member_no) {
		List<SpaceApprovalDTO> list = null;
		list = sqlSession.selectList("space_approval.member_approval_list", member_no);
		return list;
	}
	
	//스페이스 가입 신청한 스페이스 정보 가져오기
	public List<SpaceDTO> spaceApprovalInfoList(int member_no) {
		List<SpaceDTO> list = null;
		list = sqlSession.selectList("space.space_approval_info_list", member_no);
		return list;
	}

}
