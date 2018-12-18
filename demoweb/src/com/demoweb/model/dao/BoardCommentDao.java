package com.demoweb.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import com.demoweb.model.dto.BoardComment;

public class BoardCommentDao {
	
  public void insertBoardComment(BoardComment boardComment) {
    Connection conn = null;
    PreparedStatement pstmt = null;
    
    try {
      conn = ConnectionHelper.getConnection("oracle");
      String sql = "INSERT INTO BoardComment (commentno, boardno, writer, content, regdate)" +
          " VALUES (boardcomment_sequence.nextval, ?, ?, ?, sysdate)";
      pstmt = conn.prepareStatement(sql);
      pstmt.setInt(1, boardComment.getBoardNo());
      pstmt.setString(2, boardComment.getWriter());
      pstmt.setString(3, boardComment.getContent());
      
      pstmt.executeUpdate();
      
      
    } catch (Exception e) {
      e.printStackTrace();
    } finally {
      if (pstmt != null) try { pstmt.close(); } catch (Exception ex) {}
      if (conn != null) try { conn.close(); } catch (Exception ex) {}
  }
  }
	
	public List<BoardComment> getBoardCommentList(int boardNo) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<BoardComment> comments = new ArrayList<BoardComment>();
		
		try {
			conn = ConnectionHelper.getConnection("oracle");
			StringBuffer sql = new StringBuffer(500);
			sql.append("SELECT commentno, boardno, writer, content, TO_CHAR(regdate, 'YYYY-MM-DD') FROM boardComment ");
			sql.append("WHERE boardno = ? ");
			sql.append("ORDER BY commentno");
			
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setInt(1, boardNo);
			rs = pstmt.executeQuery();			
			
			while (rs.next()) {
				BoardComment comment = new BoardComment();
				comment.setCommentNo(rs.getInt(1));
				comment.setBoardNo(rs.getInt(2));
				comment.setWriter(rs.getString(3));
				comment.setContent(rs.getString(4));
				comment.setRegDate(rs.getString(5));
				
				comments.add(comment);
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			if (pstmt != null) try { pstmt.close(); } catch (Exception ex) {}
			if (conn != null) try { conn.close(); } catch (Exception ex) {}
		}
		return comments;
	}
	
	
	public void deleteBoardComment(int boardNo) {
      Connection conn = null;
      PreparedStatement pstmt = null;
      try {
        conn = ConnectionHelper.getConnection("oracle");
        String sql = "delete boardComment where commentno = ?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setInt(1, boardNo);
        pstmt.executeUpdate();

      } catch (Exception ex) {
          ex.printStackTrace();
      } finally {
          if (pstmt != null) try { pstmt.close(); } catch (Exception ex) {}
          if (conn != null) try { conn.close(); } catch (Exception ex) {}
      }
  }

}







