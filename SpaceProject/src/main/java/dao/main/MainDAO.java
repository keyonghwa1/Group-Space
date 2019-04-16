package dao.main;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import dto.member.MemberDTO;
import dto.member.Member_InterestDTO;
import dto.space.HashTagDTO;
import dto.space.SpaceApprovalDTO;
import dto.space.SpaceDTO;
import dto.space.SpaceMemberDTO;

public class MainDAO {

	SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	//내 관심사 가져오기
	public List<Member_InterestDTO> interestList(int member_no){
		List<Member_InterestDTO> list = null;
		list = sqlSession.selectList("memberInterest.interest_list", member_no);
		return list;
	}
	
	//관심사에 관련된 space 목록 가져오기
	public List<SpaceDTO> interestSpaceList(Member_InterestDTO memberInterestDTO) {
		List<SpaceDTO> list = null;
		list = sqlSession.selectList("space.interest_space_list", memberInterestDTO);
		return list;
	}
	
	//해당 스페이스 번호에 관련된 해시태그 목록 가져오기
	public List<HashTagDTO> hashtagList(int space_no) {
		List<HashTagDTO> list = null;
		list = sqlSession.selectList("hashtag.hashtag_list", space_no);
		return list;
	}

	public MemberDTO managerSelect(int space_no) {
		MemberDTO memberDTO = null;
		memberDTO = sqlSession.selectOne("member.manager_select", space_no);
		return memberDTO;
	}
	
	public int spaceApprovalInsert(SpaceApprovalDTO spaceApprovalDTO) {
		int result = 0;
		result = sqlSession.insert("space_approval.space_approval_insert", spaceApprovalDTO);
		return result;
	}
	
	//가입 신청 여부 가져오기
	public List<SpaceApprovalDTO> spaceApprovalCheck(Map<String, Integer> spaceMemberParamter) {
		List<SpaceApprovalDTO> list = null;
		list = sqlSession.selectList("space_approval.check_approval_list", spaceMemberParamter);
		return list;
	}

	public List<SpaceMemberDTO> spaceMemberCheck(Map<String, Integer> spaceMemberParamter) {
		List<SpaceMemberDTO> list = null;
		list = sqlSession.selectList("space_member.check_member_list", spaceMemberParamter);
		return list;
	}
	
	public List<SpaceApprovalDTO> memberApprovalList(int member_no) {
		List<SpaceApprovalDTO> list = null;
		list = sqlSession.selectList("space_approval.member_approval_list", member_no);
		return list;
	}

	public List<SpaceMemberDTO> spaceMemberSearch(int member_no) {
		List<SpaceMemberDTO> list = null;
		list = sqlSession.selectList("space_member.space_member_search", member_no);
		return list;
	}

	//검색된 스페이스 번호 리스트 가져오기
	public List<HashTagDTO> searchHashtagList(String keyword) {
		List<HashTagDTO> list = null;
		list = sqlSession.selectList("hashtag.search_hashtag_list" , keyword);
		return list;
	}

	//검색된 번호로 스페이스 리스트 가져오기
	public SpaceDTO searchSpace(int space_no) {
		SpaceDTO spaceDTO = null;
		spaceDTO = sqlSession.selectOne("space.search_space", space_no);
		return spaceDTO;
	}



	
}
