package com.javalec.ex.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.javalec.ex.dto.AllDto;
import com.javalec.ex.dto.BDto;
import com.javalec.ex.dto.MemberDto;
import com.javalec.ex.dto.MtmAnswerDto;
import com.javalec.ex.dto.MtmUserDto;
import com.javalec.ex.dto.NoticeDto;

@Repository
public interface ADBMtmDao {
	
	/*
	1:1문의
	공지사항 
	*/
	
	//1:1문의 전체 리스트 불러오기
	List<MtmUserDto> getAllBoards();
	
	//1:1 문의 글 1개 삭제
	int deleteUserBoard(int iu_num);

	//1:1 답변 1개 불러오기
	AllDto getAnswerBoard(int iu_num);

	//1:1 답변 1개 작성
	int insertAnswerBoard(MtmAnswerDto mtmAnswerDto);
	
	//1:1 문의 답변상태 '답변완료'로 변경
	int updateStatusFinish(MtmAnswerDto mtmAnswerDto); 
	
	//1:1 답변 1개 삭제
	int deleteAnswerBoard(int ia_num);
	
	//1:1 문의 답변상태 '답변대기'로 변경
	int updateStatusWait(int iu_num);
	
	//1:1문의 답변 1개 수정
	int modifyAnswerBoard(MtmAnswerDto mtmAnswerDto);
	
	//공지사항 전체 리스트 불러오기
	List<AllDto> getAllNoticeBoards(); 
	
	//공지사항 새글 1개 등록
	int insertNoticeBoard(NoticeDto noticeDto);
	
	//공지글 1개 불러오기
	AllDto getNoticeBoard(int no_num);
	
	//공지글 1개 수정
	int modifyNoticeBoard(NoticeDto noticeDto);
	
	//공지글 1개 삭제
	int deleteNoticeBoard(int no_num);
}
