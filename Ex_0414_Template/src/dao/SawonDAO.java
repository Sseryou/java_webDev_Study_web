package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import service.DBService;
import vo.SawonVO;

public class SawonDAO {
	
	static SawonDAO single = null;
	
	public static SawonDAO getInstance() {
		if(single == null) {
			single =  new SawonDAO();
		}
		
		return single;
	}
	
	public List<SawonVO> SelectList() {
		List<SawonVO> list = new ArrayList<>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM SAWON";
		
		try {
			conn = DBService.getInstance().getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				SawonVO vo = new SawonVO();
				vo.setSabun(rs.getInt("sabun"));
				vo.setDeptno(rs.getInt("deptno"));
				vo.setSaname(rs.getString("saname"));
				vo.setSajob(rs.getString("sajob"));
				vo.setSahire(rs.getString("sahire"));
				
				list.add(vo);
			}
			
		}catch(Exception e) {
			
		}finally {
			
			try {
				if(rs != null) {
					rs.close();
				}
				if(pstmt != null) {
					pstmt.close();
				}
				if(conn != null) {
					conn.close();
				}
			}catch(Exception e2) {
				
			}
			
		}
		return list;
	
	}
	
	

}
