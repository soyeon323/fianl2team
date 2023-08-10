package com.kh.zoody.approval.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.zoody.approval.dao.ApprovalDao;
import com.kh.zoody.approval.vo.ApplicationForExtraWorkVo;
import com.kh.zoody.approval.vo.ApplicationForLeaveVo;
import com.kh.zoody.approval.vo.ApprovalVo;
import com.kh.zoody.approval.vo.ApproverVo;
import com.kh.zoody.approval.vo.DrafterVo;
import com.kh.zoody.approval.vo.ExtraWorkCategoryVo;
import com.kh.zoody.approval.vo.LeaveTypeVo;
import com.kh.zoody.approval.vo.LetterOfApprovalVo;
import com.kh.zoody.user.vo.UserVo;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@RequiredArgsConstructor
@Transactional
@Slf4j
public class ApprovalServiceImpl implements ApprovalService {
	
	private final SqlSessionTemplate sqlSessionTemplate;
	
	private final ApprovalDao approvalDao;

	// 결재문서 양식 가져오기
	@Override
	public String getDocumentForm(String category) {
		return approvalDao.getDocumentForm(category, sqlSessionTemplate);
	}

	
	// 품의서 작성
	@Override
	public int writeLOA(ApprovalVo approvalVo, List<String> approver, List<String> cc, String content) {
		return approvalDao.writeLOA(approvalVo, approver, cc, content, sqlSessionTemplate);
	}

	
	// 휴가 타입 가져오기
	@Override
	public List<LeaveTypeVo> getLeaveType() {
		return approvalDao.getLeaveType(sqlSessionTemplate);
	}

	// 휴가 신청서 작성
	@Override
	public int writeAFL(ApprovalVo approvalVo, List<String> approver, List<String> cc, ApplicationForLeaveVo afl) {
		return approvalDao.writeAFL(approvalVo, approver, cc, afl, sqlSessionTemplate);
	}

	
	// 추가 근무 유형 가지요기
	@Override
	public List<ExtraWorkCategoryVo> getWorkType() {
		return approvalDao.getWorkType(sqlSessionTemplate);
	}

	// 휴일/연장 근무 신청서 작성
	@Override
	public int writeAFE(ApprovalVo approvalVo, List<String> approver, List<String> cc, ApplicationForExtraWorkVo afe) {
		return approvalDao.writeAFE(approvalVo, approver, cc, afe, sqlSessionTemplate);
	}


	// 유저가 결재해야하는 문서목록
	@Override
	public List<ApprovalVo> getApprovalList(String userNo) {
		return approvalDao.getApprovalList(userNo, sqlSessionTemplate);
	}


	// 전자결재 상세 보기
	@Override
	public ApprovalVo getApprovalDetail(String no) {
		return approvalDao.getApprovalDetail(no, sqlSessionTemplate);
	}


	// 상세보기 상신인 정보 가져오기
	@Override
	public DrafterVo getDrafterInfo(String no) {
		return approvalDao.getDrafterInfo(no, sqlSessionTemplate);
	}

	// 문서번호로 카테고리 번호 얻기
	@Override
	public String getCategory(String no) {
		return approvalDao.getCategory(no, sqlSessionTemplate);
	}

	// 품의서 내용 가져오기
	@Override
	public LetterOfApprovalVo getLoaInfo(String no) {
		return approvalDao.getLoaInfo(no, sqlSessionTemplate);
	}

	// 결재자들 불러오기
	@Override
	public List<ApproverVo> getApprovers(String no) {
		return approvalDao.getApprovers(no, sqlSessionTemplate);
	}

	// 참조인들 불러오기
	@Override
	public List<ApproverVo> getCc(String no) {
		return approvalDao.getCc(no, sqlSessionTemplate);
	}

	// 결재
	@Override
	public int deciseApproval(Map<String, String> dataMap) {

		String decision = dataMap.get("decision");
		
		String decisionNo = "";
		if("approve".equals(decision)) {
			decisionNo = "1";
		} else if("disapprove".equals(decision)) {
			decisionNo = "2";
		}
		
		log.info("decisionNo : {}",decisionNo);
		dataMap.put("decisionNo", decisionNo);
		
		int result = approvalDao.deciseApproval(dataMap, sqlSessionTemplate);
		
		return result;
	}
	
}
