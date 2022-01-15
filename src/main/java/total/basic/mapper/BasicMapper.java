package total.basic.mapper;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Repository;

import common.CommonMapper;

@Repository("BasicMapper")
public class BasicMapper extends CommonMapper {

	public List shipMsg(HashMap paramMap) {
		return sss.selectList("BasicMapper.shipMsg", paramMap);
	}
	public List disCpn(HashMap paramMap) {
		return sss.selectList("BasicMapper.disCpn", paramMap);
	}
	
}
