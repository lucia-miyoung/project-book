package common;

public class Criteria {
	private int page; //현재 페이지 번호
	private int perPageNum; //한 페이지당 보여줄 게시글의 갯수
	
	public int getPageStart() { 
		/* 특정 페이지의 게시글 시작 번호, 게시글 시작 행 번호 
		   현재 페이지 번호 : 5 
		   페이지당 보여줄 게시글 수 : 10
		   계산식 : (5-1)*10
		   게시글 시작 행 번호 : 40  */
		
		return (this.page-1)*perPageNum;
	}
	
	public Criteria() {
		this.page = 1;
		this.perPageNum = 10;
	}
	public double getPage() {
		return page;
	}
	public void setPage(int page) {
		if(page > 0) {
			this.page = page;
		}else {
			this.page = 1;
		}
	}
	
	public int getPerPageNum() {
		return perPageNum;
	}

	public void setPerPageNum(int pageCount) {
		int cnt = this.perPageNum;
		if(pageCount != cnt) {
			this.perPageNum = cnt;
		}else {
			this.perPageNum = pageCount;
		}
	}	
}
