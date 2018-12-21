package com.cobang.board.service;

import java.util.List;
import java.util.Map;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.cobang.board.dao.ReboardDao;
import com.cobang.board.model.ReboardDto;
import com.cobang.common.dao.CommonDao;
import com.cobang.util.BoardConstance;

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
    int pg = Integer.parseInt(param.get("pg"));
    int end = pg * BoardConstance.LIST_COUNT;
    int start = end - BoardConstance.LIST_COUNT;
    param.put("start", start + "");
    param.put("end", end + "");
    return sqlSession.getMapper(ReboardDao.class).listArticle(param);
  }

  @Override
  public ReboardDto viewArticle(int seq) {
    ReboardDto reboardDto = sqlSession.getMapper(ReboardDao.class).viewArticle(seq);
    if (reboardDto != null) {
      reboardDto.setContent(reboardDto.getContent().replace("\n", "<br>"));
      sqlSession.getMapper(CommonDao.class).updateHit(seq);
    }
    return reboardDto;
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
