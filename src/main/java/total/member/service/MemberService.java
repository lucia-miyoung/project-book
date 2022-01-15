package total.member.service;

import java.util.HashMap;
import java.util.List;

public interface MemberService {
	
	public HashMap showalldata(HashMap paramMap) throws Exception;
	
	public HashMap savemymile(HashMap paramMap) throws Exception;
	
	public HashMap insertOrder(HashMap paramMap) throws Exception;
	
	public List orderList(HashMap paramMap) throws Exception;
	
	public int orderListCnt(HashMap paramMap) throws Exception;
	
	public int orderdupchk(HashMap paramMap) throws Exception;
	
	public int orderCntCheck(HashMap paramMap) throws Exception;
	
	public HashMap deleteReview(HashMap paramMap) throws Exception;
	
	public int reviewCount(HashMap paramMap) throws Exception;
	
	public int reviewdupChk(HashMap paramMap) throws Exception;
	
	public List reviewListall(HashMap paramMap) throws Exception;
	
	public List reviewList(HashMap paramMap) throws Exception;
	
	public HashMap insertReview(HashMap paramMap) throws Exception;
	
	public HashMap updatemyinfo(HashMap paramMap) throws Exception;
	
	public HashMap getMemInfo(HashMap paramMap) throws Exception;
	
	public int myzzimCount(HashMap paramMap) throws Exception;
	
	public int myheartCount(HashMap paramMap) throws Exception;
	
	public int dupCheck(HashMap paramMap) throws Exception;
	
	public int heartCount(HashMap paramMap) throws Exception;
	
	public HashMap heartChk(HashMap paramMap) throws Exception; 
	
	public HashMap heartUpdate(HashMap paramMap) throws Exception;
	
	public HashMap heartInsert(HashMap paramMap) throws Exception;
	
	public List emotagList(HashMap paramMap) throws Exception;
	
	public int emotagInsert(HashMap paramMap) throws Exception;
	
	public List zzimList(HashMap paramMap) throws Exception;
	
	public HashMap zzimInsert(HashMap paramMap) throws Exception;
	
	public HashMap zzimUpdate(HashMap paramMap) throws Exception;
	
	public int zzimChk(HashMap paramMap) throws Exception;
	
	public HashMap zzimDelete(HashMap paramMap) throws Exception;
	
}
