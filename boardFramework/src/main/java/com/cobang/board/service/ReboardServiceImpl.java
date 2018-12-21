package com.cobang.board.service;

import java.util.List;
import java.util.Map;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.cobang.board.dao.ReboardDao;
import com.cobang.board.model.ReboardDto;
import com.cobang.common.dao.CommonDao;

@Service
public class ReboardServiceImpl implements ReboardService {

  @Autowired
  private SqlSession sqlSession;
  
  @Override
  public int WriteArticle(ReboardDto reboardDto) {
    int seq = sqlSession.getMapper(CommonDao.class).getNextSeq();
    reboardDto.setSeq(seq);
    reboardDto.setRef(seq);
    int cnt = sqlSession.getMapper(ReboardDao.class).WriteArticle(reboardDto);
    return cnt != 0 ? seq : 0;
  }

  @Override
  public List<ReboardDto> listArticle(Map<String, String> param) {
    
    return null;
  }

  @Override
  public ReboardDto viewArticle(int seq) {
    return null;
  }

  @Override
  public int replyArticle(ReboardDto reboardDto) {
    return 0;
  }

  @Override
  public void modifyArticle(ReboardDto reboardDto) {

  }

  @Override
  public void deleteArticle(int seq) {

  }

}
