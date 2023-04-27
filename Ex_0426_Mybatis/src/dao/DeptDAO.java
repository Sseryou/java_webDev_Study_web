package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import service.MybatisConnector;
import vo.DeptVO;

public class DeptDAO {
	
	//1. SqlSessionFactoryBuilder가 Mybatis 설정파일을 참고하여 SqlSessionFactory를 생성
	//2. 웹단에서 데이터 접근 작업시 SqlSessionFactory는 매 요청마다 SqlSession객체를 생성
	//3. SqlSession객체를 통해 DB작업을 진행, 작업시 수행하는 쿼리는 mapper파일에 담겨있음.
	
	SqlSessionFactory factory;
	
	// single-ton pattern: 
	// 객체1개만생성해서 지속적으로 서비스하자
	static DeptDAO single = null;

	public static DeptDAO getInstance() {
		//생성되지 않았으면 생성
		if (single == null)
			single = new DeptDAO();
		//생성된 객체정보를 반환
		return single;
	}
	
	public DeptDAO() {
		// 기본생성자에서 MybatisConnector를 호출하여 factory를 채워주자.
		factory = MybatisConnector.getInstance().getFactory();
	}
	//부서테이블 조회
	public List<DeptVO> select(){
		//factory는 어떤 db로 연결하고 어떤 mapper로 접근해야하는 것까지만 알고있다.
		//그 정보를 가지고 실제로 쿼리문을 요청하는것은 SqlSession객체가 한다.
		
		SqlSession sqlSession = factory.openSession();
											//첫 글자인 dept는 네임스페이스를 의미한다.
											//mybatis 네임스페이스에 dept가 있어야 한다.
		List<DeptVO> list = sqlSession.selectList("dept.dept_list");
		//쿼리 결과를 담아준다.
		
		//다시 닫아주기
		sqlSession.close();
		
		return list;
	}
	

}
