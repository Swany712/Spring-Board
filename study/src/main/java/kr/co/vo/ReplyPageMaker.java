package kr.co.vo;
/*
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;
*/
public class ReplyPageMaker {
	private int replyTotalCount;
	private int replyStartPage;
	private int replyEndPage;
	private boolean replyPrev;
	private boolean replyNext;
	private int replyDisplayPageNum = 5;
	private Criteria cri;
	
	public void setCri(Criteria cri) {
		this.cri = cri;
	}
	
	public void setTotalCount(int totalCount) {
		this.replyTotalCount = totalCount;
		calcData();
	}
	
	public int getReplyTotalCount() {
		return replyTotalCount;
	}
	
	public int getReplyStartPage() {
		return replyStartPage;
	}
	
	public int getReplyEndPage() {
		return replyEndPage;
	}
	
	public boolean isReplyPrev() {
		return replyPrev;
	}
	
	public boolean isReplyNext() {
		return replyNext;
	}
	
	public int getReplyDisplayPageNum() {
		return replyDisplayPageNum;
	}
	
	public Criteria getCri() {
		return cri;
	}
	 
	private void calcData() {
		replyEndPage = (int) (Math.ceil(cri.getPage() / (double)replyDisplayPageNum) * replyDisplayPageNum);
		replyStartPage = (replyEndPage - replyDisplayPageNum) + 1;
	  
		int tempEndPage = (int) (Math.ceil(replyTotalCount / (double)cri.getReplyPerPageNum()));
		if (replyEndPage > tempEndPage) {
			replyEndPage = tempEndPage;
		}
		replyPrev = replyStartPage == 1 ? false : true;
		replyNext = replyEndPage * cri.getReplyPerPageNum() >= replyTotalCount ? false : true;
	}
	
	public String makeQuery(int page) {
		String url;
		
		url = "&page=" + page + "&perPageNum=" + cri.getReplyPerPageNum() + "&searchType=&keyword=";
	    return url;
	}
	
	public String makeSearch(int page)
	{
		String url;
		
		url = "&page=" + page + "&perPageNum=" + cri.getReplyPerPageNum() + "&searchType=&keyword=";
	    return url;  
	}

}
