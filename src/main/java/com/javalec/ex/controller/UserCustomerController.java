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
import org.springframework.web.method.annotation.ModelMethodProcessor;

import com.javalec.ex.dto.AllDto;
import com.javalec.ex.dto.CouponDto;
import com.javalec.ex.dto.MemberDto;
import com.javalec.ex.dto.MtmUserDto;
import com.javalec.ex.dto.NoticeDto;
import com.javalec.ex.dto.ReceiverDto;
import com.javalec.ex.dto.UtilDto;
import com.javalec.ex.service.AdminCouponService;
import com.javalec.ex.service.UserCustomerService;
import com.javalec.ex.service.UserMemberService;

@Controller
public class UserCustomerController {
	
	/*
	 * [사용자]
	 * 고객센터
	 * */
	
	String response_path="customer/";
	
	@Autowired
	UserCustomerService cservice;
	
	//임시 로그인
	@RequestMapping("temptempLogin")
	public String temptempLogin() {
		return response_path+"temptempLogin";
	}
	
	//임시 로그아웃
	@RequestMapping("sessionDelete")
	public String sessionDelete() {
		return response_path+"sessionDelete";
	}
	
	//공지사항 리스트 불러오기
	@RequestMapping("notice")
	public String notice(Model model) {
		model.addAttribute("notice_list", cservice.getAllNoticeBoards());
		return response_path+"notice";
	}
	
	//공지사항 1개 불러오기
	@RequestMapping("user_notice_view")
	public String user_notice_view(NoticeDto noticeDto, Model model) {
		String realpath=""; String alerttext="";
		AllDto dtoDB =  cservice.getNoticeBoard(noticeDto);
		if(dtoDB.getNoticedto().getNo_hit()<0) {
			//조회수 올리기 실패했을 경우
			realpath=response_path+"notice";
			alerttext="alert('공지글을 불러오지 못했습니다. 다시 시도해 주세요.'); history.go(-1);";
		} else {
			//성공적으로 불러옴
			realpath=response_path+"notice_view";
		}
		model.addAttribute("alerttext", alerttext);		
		model.addAttribute("notice_info", dtoDB);
		return realpath;
	}
	//1:1문의 작성 페이지 접속
	@RequestMapping("inquiryform")
	public String inquiryform(HttpSession session, Model model) {
		String userID = (String)session.getAttribute("userID");
		String alerttext=""; 
		if(userID==null) {
			//로그인 안 되어 있을 경우
			alerttext="alert('로그인이 필요한 페이지입니다. 로그인 페이지로 이동합니다.'); location.href='login?backpath=inquiryform'";
			model.addAttribute("alerttext", alerttext);
		} 
		return response_path+"inquiryform";
	}
	//faq 전체 리스트 불러오기
	@RequestMapping("faq_all")
	public String faq_all(Model model) {
		model.addAttribute("faq_list", 	cservice.getAllFaqs());
		return response_path+"faq_all";
	}
	
	//faq 주문 리스트 불러오기
	@RequestMapping("faq_order")
	public String faq_order(Model model) {
		model.addAttribute("faq_list", 	cservice.getOrderFaqs());
		return response_path+"faq_order";
	}
	
	//faq 상품 리스트 불러오기
	@RequestMapping("faq_product")
	public String faq_product(Model model) {
		model.addAttribute("faq_list", 	cservice.getProductFaqs());
		return response_path+"faq_product";
	}	
	
	//faq 회원 리스트 불러오기
	@RequestMapping("faq_user")
	public String faq_user(Model model) {
		model.addAttribute("faq_list", 	cservice.getUserFaqs());
		return response_path+"faq_user";
	}	
	
	
	
}
