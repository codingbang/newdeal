package com.cobang.board.controller;

import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import com.cobang.board.model.ReboardDto;
import com.cobang.board.service.ReboardService;
import com.cobang.member.model.MemberDto;


@Controller
@RequestMapping("/reboard")
public class ReboardCotroller {
  
  @Autowired
  private ReboardService reboardService;
  
  @RequestMapping(value="list.bit", method=RequestMethod.GET)
  public ModelAndView list(@RequestParam Map<String, String> param) {
    ModelAndView mv = new ModelAndView();
    List<ReboardDto> list = reboardService.listArticle(param);
    
    mv.addObject("articlelist", list);
    mv.setViewName("reboard/list");
    return mv;
  }
	
  @RequestMapping(value="write.bit", method=RequestMethod.GET)
  public String write(@RequestParam Map<String, String> param) {
    return "reboard/write";
  }
  
  @RequestMapping(value="write.bit", method=RequestMethod.POST)
  public String write(ReboardDto reboardDto, HttpSession session, @RequestParam Map<String, String> param, Model model) {
    MemberDto memberDto = (MemberDto) session.getAttribute("userInfo");
    if (memberDto != null) {
      reboardDto.setId(memberDto.getId());
      reboardDto.setName(memberDto.getName());
      reboardDto.setEmail(memberDto.getEmail());
      
      int seq = reboardService.WriteArticle(reboardDto);
      if (seq != 0) {
        model.addAttribute("wseq", seq);
      } else {
        model.addAttribute("errorMsg", "서버 문제로 글작성이 실패 했습니다.!!!");
      }
    } else {
      model.addAttribute("errorMsg", "회원전용 게시판입니다.!!!");
    }
    
    return "reboard/writeok";
  }
  
  @RequestMapping(value="view.bit", method=RequestMethod.GET)
  public String view(@RequestParam int seq, HttpSession session, Model model) {
    MemberDto memberDto = (MemberDto) session.getAttribute("userInfo");
    if (memberDto != null) {
      ReboardDto reboardDto = reboardService.viewArticle(seq);
      model.addAttribute("article",reboardDto);
    }
    return "reboard/view";
        
  }

	
}