package total.basic.service.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import total.basic.mapper.BasicMapper;
import total.basic.service.BasicService;

@Service("BasicService")
public class BasicServiceimpl implements BasicService {

	@Autowired
	private BasicMapper mapper;
	
	@Override
	public int orderAutonum(HashMap paramMap) throws Exception {
		return mapper.orderAutonum(paramMap);
	}
	
	@Override
	public List shipMsg(HashMap paramMap) throws Exception {
		return mapper.shipMsg(paramMap);
	}
	@Override
	public List disCpn(HashMap paramMap) throws Exception {
		return mapper.disCpn(paramMap);
	}
	
}
