package com.cobang.board.admin.controller;

import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import com.cobang.board.admin.model.BoardListDto;
import com.cobang.board.admin.service.BoardAdminService;


@Controller
@RequestMapping("/badmin")
public class BoardAdminCotroller {
  
  @Autowired
  private BoardAdminService boardAdminService;
  
  @RequestMapping("boardmenu.bit")
  public String boardmenu(Map<String, Object> model) {
    List<BoardListDto> list = boardAdminService.getBoardMenu();
    model.put("menu", list);
    return "admin/boardmenu";
  }

	
}
