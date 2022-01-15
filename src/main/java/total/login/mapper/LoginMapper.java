package total.login.mapper;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;

import common.CommonMapper;

@Repository("LoginMapper")
public class LoginMapper extends CommonMapper {

	public int emaildupCheck(HashMap paramMap) {
		return sss.selectOne("LoginMapper.emaildupCheck", paramMap);
	}
	
	public int namedupCheck(HashMap paramMap) {
		return sss.selectOne("LoginMapper.namedupCheck", paramMap);
	}
	
	public HashMap membersignup(HashMap paramMap) {
		return sss.selectOne("LoginMapper.membersignup", paramMap);
	}
	
	public void insertdatabox(HashMap paramMap) {
		sss.insert("LoginMapper.insertdatabox", paramMap);
	}
	
	public int memberloginChk(HashMap paramMap) {
		return sss.selectOne("LoginMapper.memberloginChk", paramMap);
	}

	public void insertLoginHistory(HashMap paramMap) {
		
		sss.insert("LoginMapper.insertLoginHistory", paramMap);
	}
	
	public HashMap getMemberList(HashMap paramMap) {
		return sss.selectOne("LoginMapper.getMemberList", paramMap);
	}
	
	public HashMap getMemberInfo(HashMap paramMap) {
		return sss.selectOne("LoginMapper.getMemberInfo", paramMap);
	}
}

