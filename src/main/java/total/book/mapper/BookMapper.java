package total.book.mapper;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import common.CommonMapper;

@Repository("BookMapper")
public class BookMapper extends CommonMapper{
	
	public List bookAllList(HashMap paramMap) {
		return sss.selectList("BookMapper.bookAllList", paramMap);
	}
	
	public HashMap bookScore(HashMap paramMap) {
		return sss.selectOne("BookMapper.bookScore", paramMap);
	}
	
	public List bookList(HashMap paramMap) {
		return sss.selectList("BookMapper.bookList",paramMap);
	}
	
	public int bookListCount(HashMap paramMap) {
		return sss.selectOne("BookMapper.bookListCount", paramMap);
	}
	
	public HashMap bookDetail(HashMap paramMap) {
		return sss.selectOne("BookMapper.bookDetail",paramMap);
	}
	
	public List booklikeUsers(HashMap paramMap) {
		return sss.selectList("BookMapper.booklikeUsers", paramMap);
	}
	
}
