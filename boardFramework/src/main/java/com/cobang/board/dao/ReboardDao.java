package com.cobang.board.dao;

import java.util.List;
import java.util.Map;
import com.cobang.board.model.ReboardDto;

public interface ReboardDao {
  
  public int WriteArticle(ReboardDto reboardDto);
  public List<ReboardDto> listArticle(Map<String, String> param);
  public ReboardDto viewArticle(int seq);
  public int replyArticle(ReboardDto reboardDto);
  
  public void modifyArticle(ReboardDto reboardDto);
  public void deleteArticle(int seq);

}
