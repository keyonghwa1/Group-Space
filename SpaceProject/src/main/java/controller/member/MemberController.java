package controller.member;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.codehaus.jackson.JsonParseException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.type.TypeReference;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import controller.space.SpaceController;
import dao.member.MemberDAO;
import dto.member.MemberDTO;
import dto.member.Member_InterestDTO;
import dto.space.HashTagDTO;
import dto.space.SpaceApprovalDTO;
import dto.space.SpaceDTO;

@Controller
public class MemberController {

	public static final String VIEW_PATH = "/WEB-INF/views/member/";

	MemberDAO member_dao;

	// MemberController 생성자
	public MemberController() {}

	// MemberController(MemberDAO)
	public MemberController(MemberDAO member_dao) {
		this.member_dao = member_dao;
	}

	// 회원가입 페이지 매핑
	@RequestMapping("/join_form.korea")
	public String joinForm() {
		return VIEW_PATH + "member_join.jsp"; // 회원가입 페이지
	}

	// 로그인 페이지 매핑
	@RequestMapping( {"/","/login_form.korea"} )
	public String loginForm() {
		return VIEW_PATH + "member_login.jsp"; // 로그인 페이지
	}

	// 로그인 체크
	@RequestMapping("/login_check.korea")
	@ResponseBody // 이 어노태이션을 사용하면 view로 인식시키지 않고, 텍스토로 응답
	public Map<String, String> loginCheck(HttpSession session,String member_id, String member_pwd){
		
		//Map 객체 생성
		Map<String, String> map = new HashMap<String, String>();
		// member_id로 회원 정보 검색
		MemberDTO memberdto = member_dao.checkId(member_id);
		
		// dto에 값이 없을 경우 (ID가 존재하지 않을 경우)
		if (memberdto == null) {
			map.put("param", "no_id");
		// 패스워드가 일치하지 않을 경우
		} else if (member_pwd.equals(memberdto.getMember_pwd()) == false) {
			map.put("param", "no_pwd");
		// 모두 일치할 경우
		} else {
			map.put("param", "clear");
			//세션 정보 저장
			session.setAttribute("member_no", memberdto.getMember_no());
			session.setAttribute("member_id", memberdto.getMember_id());
			session.setAttribute("member_name", memberdto.getMember_name());
			session.setAttribute("member_email", memberdto.getMember_email());
		}
		return map;
	}

	// 로그아웃
	@RequestMapping("/logout.korea")
	public String logout(HttpSession session) throws Exception {
		session.removeAttribute("member_no");
		session.removeAttribute("member_id");
		session.removeAttribute("member_name");
		session.removeAttribute("member_email");
		return "login_form.korea";
	}

	// 회원가입
	@ResponseBody
	@RequestMapping(value = "/join.korea", method = RequestMethod.POST)
	public Map<String, Object> insert(String[] interest, String id, String name, String email, String pwd, String context) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		MemberDTO memberdto = new MemberDTO(0, id, name, email, pwd, context, 0);
		int res = 0;
		if (member_dao != null) {
			res = member_dao.insert(memberdto); // 회원 가입 (insert)
		}

		MemberDTO Select_Id_memberdto = member_dao.checkId(id); // 들어간 id

		// member_interest table insert
		for (int i = 0; i < interest.length; i++) {

			if (interest != null) { // 관심사를 썼으면
				Member_InterestDTO member_interest = new Member_InterestDTO(0, Select_Id_memberdto.getMember_no(), interest[i]);
				res = member_dao.insert_interest(member_interest); // 관심사 삽입
			}
		}
		if(res == 0) {
			map.put("result", "error");
		}else {
			map.put("result", "success");
		}
		return map;
	}

	// 아이디 중복 체크
	@RequestMapping("/check_id.korea") 
	@ResponseBody
	public Map checkId(String id) {

		Map<String, String> map = new HashMap<String, String>();
		MemberDTO memberdto = member_dao.checkId(id);

		if (memberdto == null) {
			map.put("res", "yes");
		} else {
			map.put("res", "no");
		}

		map.put("id", id);

		return map;
	}

	// 내정보 페이지
	@RequestMapping("/mypage.korea") 
	public String selectId(HttpSession session, Model model) {
		
		int member_no = 0;
		String member_id = "";
		try {
			member_no = (Integer) session.getAttribute("member_no");
			member_id = session.getAttribute("member_id").toString();
		}catch (NullPointerException e) {
			//만약 NullPointerException이 날 경우
			return "/WEB-INF/views/member/member_login.jsp";
		}
		
		//내정보
		MemberDTO memberdto = member_dao.checkId(member_id);
		List<MemberDTO> interest_list = member_dao.Interest_context(member_no); // 고유번호선택 - > 관심사 추출

		model.addAttribute("list", interest_list); // 관심사 리스트
		model.addAttribute("memberdto", memberdto); // 회원 정보
		
		//개설한 스페이스 리스트
		List<SpaceDTO> mySpaceList = new ArrayList<SpaceDTO>();
		//가입한 스페이스 리스트
		List<SpaceDTO> joinSpaceList = new ArrayList<SpaceDTO>();
		
		List<HashTagDTO> hashtagList = new ArrayList<HashTagDTO>();
		//스페이스 가입 신청 리스트 가져오기
		List<SpaceApprovalDTO> spaceApprovalList = new ArrayList<SpaceApprovalDTO>();
		//스페이스 가입 신청한 스페이스 정보 가져오기
		List<SpaceDTO> spaceApprovalInfoList = new ArrayList<SpaceDTO>();
		
		//가입한 스페이스 리스트 가져오기
		joinSpaceList = member_dao.joinSpaceList(member_no);
		
		//내 스페이스 리스트 가져오기
		mySpaceList = member_dao.mySpaceList(member_no);

		
		int i=0;
		//가입된 스페이스 번호에 관한 추가 정보 가져오기
		for(SpaceDTO spaceDTO : joinSpaceList) {
			//해당 스페이스의 해시태그 목록 가져오기
			hashtagList = member_dao.hashtagList(spaceDTO.getSpace_no());
			joinSpaceList.get(i).setHashtagList(hashtagList);
			i++;
		}
		
		i=0;
		//내 스페이스 번호에 관한 추가 정보 가져오기
		for(SpaceDTO spaceDTO : mySpaceList) {
			//해당 스페이스의 관심사 목록 가져오기
			hashtagList = member_dao.hashtagList(spaceDTO.getSpace_no());
			mySpaceList.get(i).setHashtagList(hashtagList);
			i++;
		}
		
		//스페이스 가입 신청 리스트 가져오기
		spaceApprovalList = member_dao.spaceApprovalList(member_no);
		//스페이스 가입 신청한 스페이스 정보 가져오기
		spaceApprovalInfoList = member_dao.spaceApprovalInfoList(member_no);
		//가입된 스페이스 목록
		
		model.addAttribute("mySpaceList", mySpaceList);
		model.addAttribute("joinSpaceList", joinSpaceList);
		model.addAttribute("spaceApprovalList", spaceApprovalList);
		model.addAttribute("spaceApprovalInfoList", spaceApprovalInfoList);
		
		return VIEW_PATH + "mypage.jsp";
	}

	@RequestMapping("/member_delete.korea") // 삭제
	public String delete(HttpSession session) {
		int member_no = Integer.parseInt(session.getAttribute("member_no").toString());
		member_dao.delete_Interest(member_no); // member_interest 테이블 먼저 삭제 -> fk
		member_dao.delete(member_no); // member 테이블 삭제
		
		session.removeAttribute("member_no");
		session.removeAttribute("member_id");
		session.removeAttribute("member_name");
		session.removeAttribute("member_email");
		
		return "/login_form.korea"; // 로그인창으로 넘어가기 

	}

	 // 업데이트하기
	@ResponseBody
	@RequestMapping(value = "/member_update.korea", method = RequestMethod.POST)
	public Map<String, String> update(int no, String id, String name, String email, String pwd_check, String context, String[] interest) {
		
		Map<String, String> map = new HashMap<String, String>();
		
		int res = 0;
		String pwd = member_dao.select_no(no).getMember_pwd();
		//패스워드가 틀릴 경우
		if(pwd.equals(pwd_check) != true) {
			map.put("param", "no_pwd");
		//패스워드가 일치할 경우
		}else {
			MemberDTO memberdto = new MemberDTO(no, id, name, email, pwd,context, 0);
			int memberResult = member_dao.update(memberdto); // 멤버 업데이트
			//회원 정보 수정  실패
			if (memberResult < 1) {
				//회원 정보 업데이트 실패
				map.put("param", "no_member_update");
			//회원 정보 수정 성공
			}else {
				//회원 정보 업데이트 성공
				
				//기존에 있었던 관심사 목록
				List<Member_InterestDTO> previousInterestDTOList = member_dao.select_Interest_no(no);
				
				for(int i=0; i< interest.length; i++) {
					
					//새로운 관심사 목록이 더 많을 경우
					if(interest.length > previousInterestDTOList.size()) {
						//기존에 관심사 목록이 있을 경우
						if(i < previousInterestDTOList.size()) {
							
							Member_InterestDTO member_InterestDTO = new Member_InterestDTO(
									previousInterestDTOList.get(i).getInterest_no(),
									previousInterestDTOList.get(i).getMember_no(),
									interest[i]);
							
							res = member_dao.update_interest(member_InterestDTO);
						
						//기존 관심사보다 입력된 관심사가 더 많을 경우
						}else if(i < interest.length) {
							Member_InterestDTO member_InterestDTO = new Member_InterestDTO(interest[i], no);
							res = member_dao.insert_interest_context(member_InterestDTO);
						}
					
					//기존 관심사 목록이 더 많을 경우
					}else if(interest.length < previousInterestDTOList.size()) {
						if(i < interest.length) {
							Member_InterestDTO member_InterestDTO = new Member_InterestDTO(
									previousInterestDTOList.get(i).getInterest_no(),
									previousInterestDTOList.get(i).getMember_no(),
									interest[i]);
							res = member_dao.update_interest(member_InterestDTO);
						}
					
					//기존 관심사와 새로운 관심사 갯수가 같을 경우
					}else if( interest.length == previousInterestDTOList.size()) {
						Member_InterestDTO member_InterestDTO = new Member_InterestDTO(
								previousInterestDTOList.get(i).getInterest_no(), no, interest[i]);
						res = member_dao.update_interest(member_InterestDTO);
					}
				}
				
				//남아 있는 관심사 삭제
				int num = interest.length - previousInterestDTOList.size();
				if(num < 0) {
					for(int i=(num+previousInterestDTOList.size()); i<previousInterestDTOList.size(); i++) {
						Member_InterestDTO member_InterestDTO = new Member_InterestDTO(previousInterestDTOList.get(i).getInterest_no(), no);
						member_dao.delete_Interest_no(member_InterestDTO);
					}
				}
			}
		}
		
		if(res >= 1) {
			map.put("param", "clear");
		}else {
			map.put("param", "no_update");
		}
		
		return map;
	}

}
