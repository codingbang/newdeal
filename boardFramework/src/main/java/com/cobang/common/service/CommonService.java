package com.cobang.common.service;

import java.util.Map;
import com.cobang.util.PageNavigation;

public interface CommonService {
  
  PageNavigation makePageNavigation(Map<String, String> param);

}
