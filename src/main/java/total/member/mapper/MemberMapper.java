package total.member.mapper;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import common.CommonMapper;

@Repository("MemberMapper")
public class MemberMapper extends CommonMapper{
	
	public HashMap showalldata(HashMap paramMap) {
		return sss.selectOne("MemberMapper.showalldata", paramMap);
	}
	public HashMap savemymile(HashMap paramMap) {
		return sss.selectOne("MemberMapper.savemymile", paramMap);
	}
	public HashMap insertOrder(HashMap paramMap) {
		return sss.selectOne("MemberMapper.insertOrder", paramMap);
	}
	public List orderList(HashMap paramMap) {
		return sss.selectList("MemberMapper.orderList", paramMap);
	}
	public int orderdupchk(HashMap paramMap) {
		return sss.selectOne("MemberMapper.orderdupchk", paramMap);
	}
	public int orderListCnt(HashMap paramMap) {
		return sss.selectOne("MemberMapper.orderListCnt", paramMap);
	}
	public int orderCntCheck(HashMap paramMap) {
		return sss.selectOne("MemberMapper.orderCntCheck", paramMap);
	}
	public HashMap deleteReview(HashMap paramMap) {
		return sss.selectOne("MemberMapper.deleteReview", paramMap);
	}
	public int reviewCount(HashMap paramMap) {
		return sss.selectOne("MemberMapper.reviewCount", paramMap);
	}
	public int reviewdupChk(HashMap paramMap) {
		return sss.selectOne("MemberMapper.reviewdupChk", paramMap);
	}
	public List reviewListall(HashMap paramMap) {
		return sss.selectList("MemberMapper.reviewListall", paramMap);
	}
	public List reviewList(HashMap paramMap) {
		return sss.selectList("MemberMapper.reviewList", paramMap);
	}
	public HashMap insertReview(HashMap paramMap) {
		return sss.selectOne("MemberMapper.insertReview", paramMap);
	}
	public HashMap updatemyinfo(HashMap paramMap) {
		return sss.selectOne("MemberMapper.updatemyinfo", paramMap);
	}
	public HashMap getMemInfo(HashMap paramMap) {
		return sss.selectOne("MemberMapper.getMemInfo", paramMap);
	}
	public int myzzimCount(HashMap paramMap) {
		return sss.selectOne("MemberMapper.myzzimCount", paramMap);
	}
	public int myheartCount(HashMap paramMap) {
		return sss.selectOne("MemberMapper.myheartCount", paramMap);
	}
	public int dupCheck(HashMap paramMap) {
		return sss.selectOne("MemberMapper.dupCheck", paramMap);
	}
	public int heartCount(HashMap paramMap) {
		return sss.selectOne("MemberMapper.heartCount", paramMap);	
	}
	public HashMap heartChk(HashMap paramMap) {
		return sss.selectOne("MemberMapper.heartChk", paramMap);
	}
	public HashMap heartUpdate(HashMap paramMap) {
		return sss.selectOne("MemberMapper.heartUpdate", paramMap);
	}
	public HashMap heartInsert(HashMap paramMap) {
		return sss.selectOne("MemberMapper.heartInsert", paramMap);
	}
	
	public List emotagList(HashMap paramMap) {
		return sss.selectList("MemberMapper.emotagList", paramMap);
	}
	
	public int emotagInsert(HashMap paramMap) {
		return sss.insert("MemberMapper.emotagInsert", paramMap);
	}
	
	public List zzimList(HashMap paramMap) {
		return sss.selectList("MemberMapper.zzimList", paramMap);
	}
	
	public HashMap zzimInsert(HashMap paramMap) {
		return sss.selectOne("MemberMapper.zzimInsert", paramMap);
	}
	
	public HashMap zzimUpdate(HashMap paramMap) {
		return sss.selectOne("MemberMapper.zzimUpdate", paramMap);
	}
	
	public int zzimChk(HashMap paramMap) {
		return sss.selectOne("MemberMapper.zzimChk", paramMap);
	}
	
	public HashMap zzimDelete(HashMap paramMap) {
		return sss.selectOne("MemberMapper.zzimDelete", paramMap);
	}
	
}
