package controller.main;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import dao.main.MainDAO;
import dto.member.MemberDTO;
import dto.member.Member_InterestDTO;
import dto.space.HashTagDTO;
import dto.space.SpaceApprovalDTO;
import dto.space.SpaceDTO;
import dto.space.SpaceMemberDTO;

@Controller
public class MainController {
	public static final String VIEW_PATH = "/WEB-INF/views/main/";
	
	MainDAO mainDAO;
	
	public MainController(MainDAO mainDAO) {
		this.mainDAO = mainDAO;
	}

	@RequestMapping("/main.korea")
	public ModelAndView mainPage(HttpSession session) {
		
		ModelAndView mv = new ModelAndView();
		
		// session에 있는 회원 정보 가져오기
		int member_no = 0;
		try {
			member_no = (Integer) session.getAttribute("member_no");
		} catch (NullPointerException e) {
			// 만약 NullPointerException이 날 경우
			mv.setViewName("/WEB-INF/views/member/member_login.jsp");
			return mv;
		}
		
		//내 관심사 리스트
		List<Member_InterestDTO> interestList = new ArrayList<Member_InterestDTO>();
		//스페이스 리스트
		List<SpaceDTO> spaceList = new ArrayList<SpaceDTO>();
		//스페이스 번호에 관한 해시태그 List
		List<HashTagDTO> hashtagList = new ArrayList<HashTagDTO>();
		//스페이스 번호에 관한 스페이스 매니저
		MemberDTO managerDTO = new MemberDTO();
		//스페이스 번호와 회원 번호를 담을 객체
		Map<String, Integer> spaceMemberParamter = new HashMap<String, Integer>();
		//스페이스 가입 신청 정보
		List<SpaceApprovalDTO> spaceApprovalList = new ArrayList<SpaceApprovalDTO>();
		//스페이스 가입 정보
		List<SpaceMemberDTO> spaceMemberList = new ArrayList<SpaceMemberDTO>();
		
		//내 관심사 리스트 가져오기
		interestList = mainDAO.interestList(member_no);
		
		int i=0, j=0;
		//관심사에 관련된 스페이스 가져오기
		for(Member_InterestDTO memberInterestDTO : interestList) {
			//[i]번째 관심사에 관련된 관심사 정보를 가져와서 저장함.
			spaceList = mainDAO.interestSpaceList(memberInterestDTO);
			interestList.get(i).setSpaceList(spaceList);

			// [i]번째 관심사에 관련된 스페이스의 해시태그를 저장함.
			for (SpaceDTO spaceDTO : interestList.get(i).getSpaceList()) {
				// 해당 스페이스의 해시태그 목록 가져오기
				hashtagList = mainDAO.hashtagList(spaceDTO.getSpace_no());
				interestList.get(i).getSpaceList().get(j).setHashtagList(hashtagList);
				// 해당 스페이스의 매니저 정보 가져오기
				managerDTO = mainDAO.managerSelect(spaceDTO.getSpace_no());
				interestList.get(i).getSpaceList().get(j).setManagerDTO(managerDTO);
				// 스페이스 번호, 회원 번호 Map 형태로 저장
				spaceMemberParamter.put("space_no", spaceDTO.getSpace_no());
				spaceMemberParamter.put("member_no", member_no);
				// 만약 가입 신청 정보가 없을 경우
				spaceApprovalList = mainDAO.spaceApprovalCheck(spaceMemberParamter);
				if (spaceApprovalList.isEmpty()) {
					interestList.get(i).getSpaceList().get(j).setSpaceApprovalCheck(false);
				}else {
					interestList.get(i).getSpaceList().get(j).setSpaceApprovalCheck(true);
				}

				// 해당 스페이스의 가입 여부 가져오기
				spaceMemberList = mainDAO.spaceMemberCheck(spaceMemberParamter);
				if (spaceMemberList.isEmpty()) {
					interestList.get(i).getSpaceList().get(j).setSpaceMemberCheck(false); 
				}else {
					interestList.get(i).getSpaceList().get(j).setSpaceMemberCheck(true);
				}
				j++;
			}
			i++;
			j=0;
		}
		mv.addObject("interestList", interestList);
		
		//이동할 경로 설정
		mv.setViewName(VIEW_PATH+"main.jsp");
		
		return mv;
	}
	
	//스페이스 검색
	@RequestMapping(value="/search.korea", method=RequestMethod.GET)
	public ModelAndView search(HttpSession session, String keyword) {
		
		System.out.println("호출 : " + keyword);
		
		ModelAndView mv = new ModelAndView();
		
		// session에 있는 회원 정보 가져오기
		int member_no = 0;
		try {
			member_no = (Integer) session.getAttribute("member_no");
		} catch (NullPointerException e) {
			// 만약 NullPointerException이 날 경우
			mv.setViewName("/WEB-INF/views/member/member_login.jsp");
			return mv;
		}
		
		// 해시태그 검색 리스트
		List<HashTagDTO> searchHashtagList;
		// 스페이스 리스트
		List<SpaceDTO> spaceList = new ArrayList<SpaceDTO>();
		// 스페이스 번호에 관한 해시태그 List
		List<HashTagDTO> hashtagList = new ArrayList<HashTagDTO>();
		// 스페이스 번호에 관한 스페이스 매니저
		MemberDTO managerDTO = new MemberDTO();
		// 스페이스 번호와 회원 번호를 담을 객체
		Map<String, Integer> spaceMemberParamter = new HashMap<String, Integer>();
		// 스페이스 가입 신청 정보
		List<SpaceApprovalDTO> spaceApprovalList = new ArrayList<SpaceApprovalDTO>();
		// 스페이스 가입 정보
		List<SpaceMemberDTO> spaceMemberList = new ArrayList<SpaceMemberDTO>();
		
		//검색되는 스페이스 번호 리스트
		searchHashtagList = mainDAO.searchHashtagList(keyword);
		
		int i=0;
		//검색된 스페이스 가져오기
		for(HashTagDTO hashtagDTO : searchHashtagList) {
			//스페이스 검색
			SpaceDTO spaceDTO = mainDAO.searchSpace(hashtagDTO.getSpace_no());
			//해당 스페이스의 해시태그 가져오기
			hashtagList = mainDAO.hashtagList(spaceDTO.getSpace_no());
			spaceDTO.setHashtagList(hashtagList);
			//해당 스페이스의 매니저 정보 가져오기
			managerDTO = mainDAO.managerSelect(spaceDTO.getSpace_no());
			spaceDTO.setManagerDTO(managerDTO);
			//스페이스 번호, 회원 번호 Map 형태로 저장
			// 스페이스 번호, 회원 번호 Map 형태로 저장
			spaceMemberParamter.put("space_no", spaceDTO.getSpace_no());
			spaceMemberParamter.put("member_no", member_no);
			
			// 만약 가입 신청 정보가 없을 경우
			spaceApprovalList = mainDAO.spaceApprovalCheck(spaceMemberParamter);
			System.out.println("spaceApprovalList : " + spaceApprovalList);
			if (spaceApprovalList.isEmpty()) {
				System.out.println("false");
				spaceDTO.setSpaceApprovalCheck(false);
			}else {
				System.out.println("true");
				spaceDTO.setSpaceApprovalCheck(true);
			}

			// 해당 스페이스의 가입 여부 가져오기
			spaceMemberList = mainDAO.spaceMemberCheck(spaceMemberParamter);
			System.out.println("spaceMemberList : " + spaceMemberList);
			if (spaceMemberList.isEmpty()) {
				System.out.println("false");
				spaceDTO.setSpaceMemberCheck(false);
			}else {
				System.out.println("true");
				spaceDTO.setSpaceMemberCheck(true);
			}
			
			spaceList.add(spaceDTO); // 모임방
			
			i++;
		}

		mv.addObject("spaceList", spaceList); 
		mv.setViewName(VIEW_PATH + "search.jsp");
		
		return mv;
	}
	
	//스페이스 가입 신청
	@RequestMapping(value="/space_approval_insert.korea", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> spaceApprovalInsert(HttpSession session, String space_approval_context, int space_no){
		
		Map<String, Object> map = new HashMap<String, Object>();
		SpaceApprovalDTO spaceApprovalDTO = new SpaceApprovalDTO(space_no, (Integer) session.getAttribute("member_no"), space_approval_context);
		
		int res = mainDAO.spaceApprovalInsert(spaceApprovalDTO);
		
		if(res == 1) {
			map.put("result", "success");
		}else {
			map.put("result", "error");
		}
		
		return map;
	}
}
