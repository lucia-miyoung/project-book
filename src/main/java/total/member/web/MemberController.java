package total.member.web;

import java.io.Console;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import total.basic.service.BasicService;
import total.book.service.BookService;
import total.login.service.LoginService;
import total.member.service.MemberService;

@Controller
@RequestMapping("/member")
public class MemberController {

	protected ModelAndView mv = null;

	@Resource(name = "MemberService")
	private MemberService service;

	@Resource(name = "BookService")
	private BookService bookService;

	@Resource(name = "LoginService")
	private LoginService loginService;

	@Resource(name = "BasicService")
	private BasicService basicService;

	@RequestMapping(value = "/mypage")
	public String goMypage(HttpServletRequest req, HttpServletResponse res, @RequestParam HashMap paramMap,
			ModelMap model) throws Exception {
		System.out.println("mypage {}:  " + paramMap);
		int reviewCnt = service.reviewCount(paramMap);
		paramMap.put("member_id", service.getMemInfo(paramMap).get("member_id"));
		model.addAttribute("paramMap", paramMap);
		model.addAttribute("reviewCnt", reviewCnt);
		model.addAttribute("zzimList", service.zzimList(paramMap));
		model.addAttribute("zzimbookcount", service.myzzimCount(paramMap));
		model.addAttribute("likebookcount", service.myheartCount(paramMap));
		model.addAttribute("reviewList", service.reviewList(paramMap));
		model.addAttribute("orderList", service.orderList(paramMap));
		model.addAttribute("orderCnt", service.orderListCnt(paramMap));
		model.addAttribute("showdata", service.showalldata(paramMap));
		System.out.println(service.orderList(paramMap));

		return "/login/mypage";
	}

	@ResponseBody
	@RequestMapping(value = "/review")
	public Object review(HttpServletRequest req, HttpServletResponse res, @RequestParam HashMap paramMap,
			ModelMap model) throws Exception {
		System.out.println("review {}:  " + paramMap);
		model.addAttribute("paramMap", paramMap);
		if ("I".equals(paramMap.get("status")) && paramMap.containsKey("status")) {
			int dupchk = service.reviewdupChk(paramMap);
			model.addAttribute("reviewdupChk", service.reviewdupChk(paramMap));
			System.out.println(service.reviewdupChk(paramMap));
			if (dupchk == 0) {
				service.insertReview(paramMap);
				System.out.println("저장됨");
			}
		}
		if ("D".equals(paramMap.get("status")) && paramMap.containsKey("status")) {
			service.deleteReview(paramMap);
		}

		return model;
	}

	@RequestMapping(value = "/myaccount")
	public String myaccount(HttpServletRequest req, HttpServletResponse res, @RequestParam HashMap paramMap,
			ModelMap model) throws Exception {
		System.out.println("myaccount {}:  " + paramMap);
		model.addAttribute("paramMap", service.getMemInfo(paramMap));

		return "/login/myaccount";
	}

	@RequestMapping(value = "/updatemypage")
	public String updatemypage(HttpServletRequest req, HttpServletResponse res, @RequestParam HashMap paramMap,
			ModelMap model) throws Exception {
		System.out.println("updatemypage {}:  " + paramMap);
		model.addAttribute("memData", loginService.getMemberInfo(paramMap));
		model.addAttribute("paramMap", loginService.getMemberInfo(paramMap));
		return "/login/myInfoUpdate";
	}

	@RequestMapping(value = "/setUpdateData")
	public String setUpdateData(HttpServletRequest req, HttpServletResponse res, @RequestParam HashMap paramMap,
			ModelMap model) throws Exception {
		System.out.println("setUpdateData {}:  " + paramMap);
		if ("U".equals(paramMap.get("status")) && paramMap.containsKey("member_id")) {
			service.updatemyinfo(paramMap);
		}
		model.addAttribute("paramMap", paramMap);
		return "/login/myaccount";
	}
	
	@RequestMapping(value = "/deletemyaccount")
	public String deletemyaccount(HttpServletRequest req, HttpServletResponse res, @RequestParam HashMap paramMap,
			ModelMap model) throws Exception {
		System.out.println("deletemyaccount {}:  " + paramMap);
		
		model.addAttribute("paramMap", paramMap);
		return "/login/delete";
	}

	@RequestMapping(value = "/notice")
	public String notice(HttpServletRequest req, HttpServletResponse res, @RequestParam HashMap paramMap,
			ModelMap model) throws Exception {
		System.out.println("updatemypage {}:  " + paramMap);
		model.addAttribute("paramMap", paramMap);

		return "/login/notice";
	}

	@RequestMapping(value = "/detail")
	public String detail(HttpServletRequest req, HttpServletResponse res, @RequestParam HashMap paramMap,
			ModelMap model) throws Exception {

		System.out.println("detail here22:: " + paramMap);
		int orderchk = service.orderdupchk(paramMap);
		int status = service.dupCheck(paramMap);
		model.addAttribute("paramMap", paramMap);
		model.addAttribute("status", status);
		model.addAttribute("heartCnt", service.heartCount(paramMap));
		model.addAttribute("heartChk", service.heartChk(paramMap));
		model.addAttribute("bookList", bookService.bookList(paramMap));
		model.addAttribute("likedlist", bookService.booklikeUsers(paramMap));
		model.addAttribute("bookInfo", bookService.bookDetail(paramMap));
		model.addAttribute("zzimCnt", service.zzimChk(paramMap));
		model.addAttribute("emotag", service.emotagList(paramMap));
		model.addAttribute("bookScore", bookService.bookScore(paramMap));
		model.addAttribute("orderchk", orderchk);
		
		System.out.println("heartCnt: " + service.heartCount(paramMap));
		System.out.println("heartChk: " + service.heartChk(paramMap));
		System.out.println("emotag: " + service.emotagList(paramMap));
		System.out.println("bookInfo: " + bookService.bookDetail(paramMap));
		System.out.println("zzimCnt: " + service.zzimChk(paramMap));
		System.out.println("likedlist: " + bookService.booklikeUsers(paramMap));
		System.out.println("bookScore: " + bookService.bookScore(paramMap));
		System.out.println("orderchk: " + service.orderdupchk(paramMap));
		
		return "/main/detailInfo";
	}

	@RequestMapping(value = "/paycheck.do")
	public String paycheck(HttpServletRequest req, HttpServletResponse res, @RequestParam HashMap paramMap, ModelMap model) throws Exception {
		System.out.println("paycheck:: " + paramMap);
		model.addAttribute("paramMap", paramMap);
		String[] arr = req.getParameterValues("chkbox");
		
		List<String> chkArray = new ArrayList<String>();
		List<Object> bookArr = new ArrayList<Object>();
		
		if(arr == null) {
			bookArr.add(bookService.bookDetail(paramMap));
			model.addAttribute("bookList", bookArr);
		} else {
			for (String chks : arr) {
				paramMap.put("book_id", chks);
				chkArray.add(chks);
				bookArr.add(bookService.bookDetail(paramMap));
			}
			
			paramMap.put("orderList", chkArray);
			int chk = service.orderCntCheck(paramMap);
			model.addAttribute("orderChk", chk);
			model.addAttribute("bookList", bookArr);
		}
		
		model.addAttribute("userinfo", service.getMemInfo(paramMap));	
		model.addAttribute("shipmsg", basicService.shipMsg(paramMap));
		model.addAttribute("cpnList", basicService.disCpn(paramMap));

		return "/main/payment";
	}

	@ResponseBody
	@RequestMapping(value = "/setOrderitem.do")
	public Object setOrderitem(HttpServletRequest req, HttpServletResponse res, @RequestParam HashMap paramMap, ModelMap model) throws Exception {
		System.out.println("setOrderitem11:: " + paramMap);
		
		paramMap.put("member_name", paramMap.get("order_name"));
		model.addAttribute("paramMap", paramMap);
		
		if("I".equals(paramMap.get("status")) && paramMap.containsKey("status")) {
			String [] chks =req.getParameterValues("book_id"); 
				for(String array : chks) {
					paramMap.put("book_id", array); 
					service.insertOrder(paramMap);
				} 
				service.savemymile(paramMap);
		 }
		return model;
	}

	@ResponseBody
	@RequestMapping(value = "/heartCheck.do")
	public Object heartCheck(HttpServletRequest req, HttpServletResponse res, @RequestParam HashMap paramMap,
			ModelMap model) throws Exception {
		System.out.println("here:: " + paramMap);
		paramMap.put("member_id", service.getMemInfo(paramMap).get("member_id"));

		int status = service.dupCheck(paramMap);

		if (status == 0 && "I".equals(paramMap.get("dup_chk")) && paramMap.containsKey("member_id")) {
			service.heartInsert(paramMap);
		}
		if (status > 0 && "U".equals(paramMap.get("dup_chk")) && paramMap.containsKey("member_id")) {
			service.heartUpdate(paramMap);
		}
		model.addAttribute("paramMap", paramMap);
		model.addAttribute("loveChk", service.heartCount(paramMap));

		System.out.println(service.heartCount(paramMap));

		return model;
	}

	@ResponseBody
	@RequestMapping(value = "/mypageInfo")
	public Object mypageInfo(HttpServletRequest req, HttpServletResponse res, @RequestParam HashMap paramMap,
			ModelMap model) throws Exception {

		System.out.println("mypageInfo {}:  " + paramMap);
		paramMap.put("member_id", service.getMemInfo(paramMap).get("member_id"));
		int zzimCnt = service.zzimChk(paramMap);
		model.addAttribute("zzimCnt", service.zzimChk(paramMap));

		if ("I".equals(paramMap.get("dup_chk")) && paramMap.containsKey("member_name")) {
			service.zzimInsert(paramMap);
		}

		if ("U".equals(paramMap.get("dup_chk")) && paramMap.containsKey("member_name")) {
			service.zzimUpdate(paramMap);
		}

		return model;
	}

	@ResponseBody
	@RequestMapping(value = "/setmypageInfo")
	public Object setmypageInfo(HttpServletRequest req, HttpServletResponse res, @RequestParam HashMap paramMap,
			@RequestParam(value = "chk_array[]") List<String> chkArr, ModelMap model) throws Exception {
		System.out.println("setmypageInfo {}:  " + paramMap);

		paramMap.put("member_id", service.getMemInfo(paramMap).get("member_id"));
		model.addAttribute("paramMap", paramMap);

		if ("D".equals(paramMap.get("status")) && paramMap.containsKey("status")) {
			paramMap.put("zzimList", chkArr);
			service.zzimDelete(paramMap);
		}

		return model;
	}
}
