package com.cobang.board.dao;

import java.util.List;
import java.util.Map;
import com.cobang.board.model.AlbumDto;

public interface AlbumDao {
  
  public int WriteArticle(AlbumDto albumDto);
  public List<AlbumDto> listArticle(Map<String, String> param);
  public AlbumDto viewArticle(int seq);
  
  public void modifyArticle(AlbumDto albumDto);
  public void deleteArticle(int seq);
}
