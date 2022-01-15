package common;


import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

public class CommonMapper {
	protected final Logger log = LoggerFactory.getLogger(getClass());

	/**
	 * Master
	 *  insert, update, delete
	 */
	@Autowired
	@Resource(name="sqlSessionTemplate")
	protected SqlSession sss;

}
