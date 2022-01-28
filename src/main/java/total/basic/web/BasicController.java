package total.basic.web;

import java.util.HashMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import total.member.service.MemberService;

@Controller
@RequestMapping("/common")
public class BasicController {

	@Resource(name = "MemberService")
	private MemberService memService;
	
	@RequestMapping(value="/servicecenter")
	public String servicecenter(HttpServletRequest req, HttpServletResponse res, @RequestParam HashMap paramMap,
			ModelMap model) throws Exception {
		System.out.println("/servicecenter {}:  " + paramMap);
		model.addAttribute("paramMap", paramMap);
		model.addAttribute("myqstList", memService.showmyQstList(paramMap));
		System.out.println("나의 질문: " + memService.showmyQstList(paramMap));
			return "/main/service";
	}
	
}
