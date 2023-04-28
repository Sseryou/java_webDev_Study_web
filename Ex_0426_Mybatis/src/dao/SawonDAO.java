package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import service.MybatisConnector;
import vo.SawonVO;

public class SawonDAO {
	
	//팩토리가 있어야 mybatis에 접근 가능하다.
	SqlSessionFactory factory;
	
	public SawonDAO() {
		factory = MybatisConnector.getInstance().getFactory();
	}
	
	// single-ton pattern: 
	// 객체1개만생성해서 지속적으로 서비스하자
	static SawonDAO single = null;

	public static SawonDAO getInstance() {
		//생성되지 않았으면 생성
		if (single == null)
			single = new SawonDAO();
		//생성된 객체정보를 반환
		return single;
	}
	
	//전체 사원목록 조회
	public List<SawonVO> select(){
		SqlSession sqlSession = factory.openSession();
		List<SawonVO> list = sqlSession.selectList("s.sawon_list");
		
		//conn,pstmt,rs를 close하는 내용이 포함되어 있다.
		sqlSession.close();
		return list;
	}
	
	//특정 부서 사원 조회
	public List<SawonVO> select(int deptno){
		//1. 처리객체 얻어오기 (SqlSessionFactory factory;)
		SqlSession sqlSession = factory.openSession();
		
		//2. 처리객체를 통해 쿼리작업 수행
		//selectList는 argu를 하나 가져갈 수 있다.
		List<SawonVO> list = sqlSession.selectList("s.sawon_list_no", deptno);
		
		//conn,pstmt,rs를 close하는 내용이 포함되어 있다.
		sqlSession.close();
		return list;
	}

}
