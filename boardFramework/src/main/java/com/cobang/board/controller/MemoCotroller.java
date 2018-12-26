package com.cobang.board.controller;

import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import com.cobang.board.model.MemoDto;
import com.cobang.board.service.MemoService;
import com.cobang.member.model.MemberDto;

//@RestController(@Controller + @ResponseBody 나중에 완성후 바꾸기)
@Controller
public class MemoCotroller {
  
  @Autowired
  private MemoService memoService;
  
  @RequestMapping(value="memo", method=RequestMethod.POST, headers= {"Content-type=application/json"} )
  public @ResponseBody String write(@RequestBody MemoDto memoDto, HttpSession session) {
    MemberDto memberDto = (MemberDto) session.getAttribute("userInfo");
    if (memberDto != null) {
      memoDto.setId(memberDto.getId());
      memoDto.setName(memberDto.getName());
      
      int cnt = memoService.writeMemo(memoDto);
    }
    String memolist = memoService.listMemo(memoDto.getSeq());
    System.out.println(memolist);
    return memolist;
  }
  
  @RequestMapping(value="memo/{seq}", method=RequestMethod.GET)
  public @ResponseBody String list(@PathVariable(value="seq") int seq) {
    String memolist = memoService.listMemo(seq);
    return memolist;
  }


}
