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
import com.javalec.ex.dto.E_CommentDto;
import com.javalec.ex.dto.EventDto;
import com.javalec.ex.dto.MemberDto;
import com.javalec.ex.dto.MtmUserDto;
import com.javalec.ex.dto.NoticeDto;
import com.javalec.ex.dto.ReceiverDto;
import com.javalec.ex.dto.UtilDto;
import com.javalec.ex.service.AdminCouponService;
import com.javalec.ex.service.UserCustomerService;
import com.javalec.ex.service.UserEventService;
import com.javalec.ex.service.UserMemberService;

@Controller
public class UserEventController {
	
	/*
	 * [사용자]
	 * 이벤트
	 * */
	
	String response_path="event/";
	
	@Autowired
	UserEventService eservice;
	
	//이벤트 전체 리스트 불러오기
	@RequestMapping("event")
	public String event(Model model) {
		model.addAttribute("event_list", eservice.getAllEvents());
		return response_path+"event";
	}
	
	//이벤트 1개 불러오기
	@RequestMapping("user_event_view")
	public String user_event_view(EventDto eventDto, Model model, HttpServletRequest request) {
		String e_num = request.getParameter("e_numCheck");
		if(!(e_num=="" || e_num==null)) {
			eventDto.setE_num(Integer.parseInt(e_num));
			model.addAttribute("checkflag", 1);
		}
		model.addAttribute("event_info", eservice.getEventBoard(eventDto));
		model.addAttribute("ecomment_list", eservice.getTheEComments(eventDto));		
		return response_path+"user_event_view";
	}
	//댓글 비밀번호 확인하기
	@PostMapping("ec_pw_check")
	public String ec_pw_check(E_CommentDto e_CommentDto, Model model) {
		String alerttext=""; String realpath=""; System.out.println(e_CommentDto.getE_num());
		int success = eservice.checkECommentPW(e_CommentDto);
		if(success==0) { alerttext="alert('비밀번호가 일치하지 않습니다. 다시 시도해 주세요.'); backpage("+e_CommentDto.getEc_pw()+");";
		realpath=response_path+"user_event_view";
		}
		if(success==1) { model.addAttribute("e_numCheck", e_CommentDto.getE_num());
		realpath="redirect:user_event_view";
		}
		model.addAttribute("alerttext", alerttext);
		return realpath;
	}
	
}
