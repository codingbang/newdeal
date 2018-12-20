package com.cobang.board.admin.service;

import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.cobang.board.admin.dao.BoardAdminDao;
import com.cobang.board.admin.model.BoardListDto;
import com.cobang.board.admin.model.BoardTypeDto;
import com.cobang.board.admin.model.CategoryDto;

@Service
public class BoardAdminServiceImpl implements BoardAdminService {
  
  @Autowired
  private SqlSession sqlSession;

  @Override
  public List<BoardListDto> getBoardMenu() {
    return sqlSession.getMapper(BoardAdminDao.class).getBoardMenu();
  }

  @Override
  public List<CategoryDto> getCategory() {
    return null;
  }

  @Override
  public void makeCategory(CategoryDto category) {

  }

  @Override
  public BoardTypeDto getBoardType() {
    return null;
  }

  @Override
  public void makeBoard(BoardListDto boardListDto) {

  }

}
