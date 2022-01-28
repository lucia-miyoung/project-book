package total.basic.service;

import java.util.HashMap;
import java.util.List;

public interface BasicService {
	
	public int orderAutonum(HashMap paramMap) throws Exception;

	public List shipMsg(HashMap paramMap) throws Exception;
	
	public List disCpn(HashMap paramMap) throws Exception;
}
