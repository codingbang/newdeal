package com.cobang.common.dao;

public interface CommonDao {
  
  int getNextSeq();
  void updateHit(int seq);

}
