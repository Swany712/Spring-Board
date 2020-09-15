package kr.co.vo;

public class Criteria {
	private int bno;
	private int page;
	private int perPageNum;
	private int rowStart;
	private int rowEnd;
	private int replyPerPageNum;
	private int replyRowStart;
	private int replyRowEnd;
	
	public Criteria() {
		this.page = 1;
		this.perPageNum = 10;
		this.replyPerPageNum = 5;
	}
	
	public void setPage(int page) {
		if (page <= 0) {
			this.page = 1;
			return;
		}
		this.page = page;
	}
	
	public void setPerPageNum(int perPageNum) {
		if (perPageNum <= 0 || perPageNum > 100) {
			this.perPageNum = 10;
			return;
		}
		this.perPageNum = perPageNum;
	}
	
	public void setReplyPerPageNum(int replyPerPageNum) {
		if (replyPerPageNum <= 0 || replyPerPageNum > 50) {
			this.replyPerPageNum = 5;
			return;
		}
		this.replyPerPageNum = replyPerPageNum;
	}
	
	public int getBno() {
		return bno;
	}

	public void setBno(int bno) {
		this.bno = bno;
	}

	public int getPage() {
		return page;
	}
	
	public int getPageStart() {
		return (this.page - 1) * perPageNum;
	}
	
	public int getReplyPerPageNum() {
		return this.replyPerPageNum;
	}
	
	public int getReplyRowStart() {
		replyRowStart = ((page - 1) * replyPerPageNum) + 1;
		return replyRowStart;
	}
	
	public int getReplyRowEnd() {
		replyRowEnd = replyRowStart + replyPerPageNum - 1;
		return replyRowEnd;
	}
	
	public int getPerPageNum() {
		return this.perPageNum;
	}
	
	public int getRowStart() {
		rowStart = ((page - 1) * perPageNum) + 1;
		return rowStart;
	}
	
	public int getRowEnd() {
		rowEnd = rowStart + perPageNum - 1;
		return rowEnd;
	}

	@Override
	public String toString() {
		return "Criteria [page=" + page + ", perPageNum=" + perPageNum + ", rowStart=" + rowStart + ", rowEnd=" + rowEnd
				+ "]";
	}
	

	public String replyToString() {
		return "Criteria [page=" + page + ", replyPerPageNum=" + replyPerPageNum + ", rowStart=" + rowStart + ", rowEnd=" + rowEnd
				+ "]";
	}
	
}
