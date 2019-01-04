package com.cobang.board.admin.service;

import java.util.List;
import com.cobang.board.admin.model.BoardListDto;
import com.cobang.board.admin.model.BoardTypeDto;
import com.cobang.board.admin.model.CategoryDto;

public interface BoardAdminService {
  
  public List<BoardListDto> getBoardMenu();
  
  public List<CategoryDto>getCategory();
  
  public void makeCategory(CategoryDto category);
  public BoardTypeDto getBoardType();
  public void makeBoard(BoardListDto boardListDto);
  
}
