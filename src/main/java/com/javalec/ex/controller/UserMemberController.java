package com.javalec.ex.controller;

import java.sql.JDBCType;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.javalec.ex.dto.AllDto;
import com.javalec.ex.dto.CouponDto;
import com.javalec.ex.dto.MemberDto;
import com.javalec.ex.dto.ReceiverDto;
import com.javalec.ex.dto.UtilDto;
import com.javalec.ex.service.AdminCouponService;
import com.javalec.ex.service.UserMemberService;

@Controller
public class UserMemberController {
	
	/*
	 * [사용자]
	 * 회원
	 * */
	
	String response_path="member/";
	
	@Autowired
	UserMemberService mservice;
	
	//로그인 페이지 접속
	@RequestMapping("temp_login")
	public String temp_login(Model model) {
		return response_path+"login";
	}
	
	//회원 로그인
	@PostMapping("member_login")
	public String member_login(MemberDto memberDto, HttpSession session, Model model) {
		int success=-99; String alerttext="";
		AllDto alldto_fromDB =  mservice.memberLogin(memberDto);
		
		if(!(alldto_fromDB.getMemberdto().getM_id().equals("-"))) {
			if(!(alldto_fromDB.getMemberdto().getM_pw().equals("-"))) {
				//id, pw 둘다 일치
				success=1;
			} else {
				//pw 불일치
				success=-1;
			}
		}
		
		switch(success) {
		case -99 : alerttext="alert('아이디가 일치하지 않습니다.'); history.go(-1)"; break;
		case -1 : alerttext="alert('비밀번호가 일치하지 않습니다.'); history.go(-1);"; break;
		case 1 : 
			System.out.println("id, pw 둘다 일치"); 
			alerttext="location.href='main';";
			session.setAttribute("userID", alldto_fromDB.getMemberdto().getM_id()); 
			session.setAttribute("userNum", alldto_fromDB.getMemberdto().getM_num()); 			
			break;
		}
		model.addAttribute("alerttext", alerttext);
	
		return temp_login(model);
	}
	
	//(임시)비회원 주문조회 페이지 링크
	@RequestMapping("nonmember_ordercheck")
	public String nonmember_ordercheck() {
		return "nonmember/ordercheck";
	}
	
	//비회원 주문조회 로그인
	@PostMapping("nonmember_login")
	public String nonmember_login(ReceiverDto receiverDto, HttpSession session, Model model) {
		int success=-99; String alerttext="";
		ReceiverDto dto_db = mservice.nonmemberLogin(receiverDto);
		if(!(dto_db.getOl_order_num().equals("-"))) {
			//주문번호 일치
			if(!(dto_db.getM_name().equals("-"))) {
				//주문번호, 주문자명 모두 일치
				success=1;
			} else {
				//주문번호 일치, 주문자명 불일치
				success=-1;
			}
		}
		
		switch(success) {
		case -99 : alerttext="alert('주문번호가 일치하지 않습니다.'); history.go(-1)"; break;
		case -1 : alerttext="alert('주문자명이 일치하지 않습니다.'); history.go(-1);"; break;
		case 1 : 
			System.out.println("주문자명, 주문번호 둘다 일치"); 
			alerttext="location.href='nonmember_ordercheck';";
			session.setAttribute("orderName", dto_db.getM_name());
			session.setAttribute("orderNum", dto_db.getOl_order_num());
			break;
		}
		model.addAttribute("alerttext", alerttext);
		
		return temp_login(model);
	}
	
	//회원가입 실명확인 페이지 접속
	@RequestMapping("step01")
	public String step01() {
		return response_path+"step01";
	}
	
	//회원가입 약관동의 페이지 접속
	@RequestMapping("step02")
	public String step02() {
		return response_path+"step02";
	}	
	
	//회원가입 양식 페이지 접속
	@RequestMapping("step03")
	public String step03() {
		return response_path+"step03";
	}		
	
	//회원가입
	@PostMapping("member_join")
	public String member_join(MemberDto memberDto, Model model) {
		int success = mservice.memberJoin(memberDto);
		String alerttext="";
		if(success==0) alerttext="alert('회원가입에 실패했습니다. 다시 시도해 주세요.'); history.go(-1);"; 
		if(success>=1) alerttext="alert('회원가입 되었습니다.'); location.href='step04';"; 		
		model.addAttribute("alerttext", alerttext);	
		return response_path+"step03";
	}
	
	//회원가입 완료 페이지 접속
	@RequestMapping("step04")
	public String step04() {
		return response_path+"step04";
	}

}
