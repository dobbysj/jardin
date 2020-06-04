package com.javalec.ex.service;

import java.util.List;
import java.util.Map;

import com.javalec.ex.dto.AllDto;
import com.javalec.ex.dto.BDto;
import com.javalec.ex.dto.MemberDto;
import com.javalec.ex.dto.MtmAnswerDto;
import com.javalec.ex.dto.MtmUserDto;

public interface ADBService {
	
	//1:1문의 전체 리스트 불러오기
	List<MtmUserDto> getAllBoards();
	
	//1:1문의 글 1개 삭제
	int deleteUserBoard(int iu_num);

	//1:1 답변 1개 불러오기
	AllDto getAnswerBoard(int iu_num);
	

	
}
