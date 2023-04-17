package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import service.DBService;

import vo.SjVO;

public class SjDAO {
	// single-ton pattern: 
	// 객체1개만생성해서 지속적으로 서비스하자
	static SjDAO single = null;

	public static SjDAO getInstance() {
		//생성되지 않았으면 생성
		if (single == null)
			single = new SjDAO();
		//생성된 객체정보를 반환
		return single;
	}
	
	
	public List<SjVO> selectList() {

		List<SjVO> list = new ArrayList<SjVO>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM sungtb_view";

		try {
			//1.Connection얻어온다
			conn = DBService.getInstance().getConnection();
			//2.명령처리객체정보를 얻어오기
			pstmt = conn.prepareStatement(sql);

			//3.결과행 처리객체 얻어오기
			rs = pstmt.executeQuery();

			while (rs.next()) {
				SjVO vo = new SjVO();
				
					vo.setNo(rs.getInt("NO"));
					vo.setName(rs.getString("NAME"));
					vo.setKor(rs.getInt("KOR"));
					vo.setEng(rs.getInt("ENG"));
					vo.setMat(rs.getInt("MAT"));
					vo.setTot(rs.getInt("tot"));
					vo.setAvg(rs.getFloat("avg"));
					vo.setRank(rs.getInt("rank"));
					
				list.add(vo);
			}

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {

			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		return list;
	}
	
	public int insert(SjVO vo) {
		// TODO Auto-generated method stub
		int res = 0;

		Connection conn = null;
		PreparedStatement pstmt = null;

		String sql = "INSERT INTO SUNGTB VALUES(SEQ_SUNGTB_NO.NEXTVAL, ?, ?, ?, ?)";

		try {
			//1.Connection획득
			conn = DBService.getInstance().getConnection();
			//2.명령처리객체 획득
			pstmt = conn.prepareStatement(sql);

			//3.pstmt parameter 채우기
			// 매개변수 : 몇 번째의 ? 인지, 어떤 파라미터 값을 넣을 것인지
			//pstmt.setString(1, vo.getName()); 
			pstmt.setString(1, vo.getName());
			pstmt.setInt(2, vo.getKor());
			pstmt.setInt(3, vo.getEng());
			pstmt.setInt(4, vo.getMat());

			//4.DB로 전송(res:처리된행수)
			res = pstmt.executeUpdate();

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {

			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return res;
	}
	
	
	public int delete(int no) {
		// TODO Auto-generated method stub
		int res = 0;

		Connection conn = null;
		PreparedStatement pstmt = null;

		String sql = "DELETE FROM SUNGTB WHERE NO=?";

		try {
			//1.Connection획득
			conn = DBService.getInstance().getConnection();
			//2.명령처리객체 획득
			pstmt = conn.prepareStatement(sql);

			//3.pstmt parameter 채우기
			pstmt.setInt(1, no);
			//4.DB로 전송(res:처리된행수)
			res = pstmt.executeUpdate();

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {

			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return res;
	}

}
