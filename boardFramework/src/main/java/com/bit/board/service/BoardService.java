package com.cobang.board.service;

import java.util.List;
import java.util.Map;
import com.cobang.board.model.BoardDto;

public interface BoardService {
  
  public int WriteArticle(BoardDto boardDto);
  public List<BoardDto> listArticle(Map<String, String> param);
  public BoardDto viewArticle(int seq);

}
