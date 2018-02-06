package com.mr.util;

import java.util.List;

public class Page {
	/**
	 *当前页 
	 */
	private Integer currentPage;
	/**
	 *每页条数
	 */
	private Integer pageItem;
	/**
	 * 总条数
	 */
	private Integer countItem;
	/**
	 *总页数
	 */
	private Integer countPage;
	/**
	 * 起始下标
	 */
	private Integer start;
	/**
	 *集合
	 */
	private List list;
	
	private Object param;

	public Object getParam() {
		return param;
	}

	public void setParam(Object param) {
		this.param = param;
	}

	/** <pre>getCurrentPage(获取当前页)   
	 * 创建人：YuanYuyin    
	 * 创建时间：2015年12月11日 下午16:10:27    
	 * 修改人：YuanYuyin     
	 * 修改时间：2015年12月11日 下午16:10:27  
	 * 修改备注： 
	 * @return</pre>    
	 */
	public Integer getCurrentPage() {
		// 如果没有当前页信息:默认第一页
		if (currentPage == null) {
			currentPage = 1;
		}
		return currentPage;
	}

	/** <pre>setCurrentPage(赋值当前页)   
	 * 创建人：YuanYuyin    
	 * 创建时间：2015年12月11日 下午16:12:11  
	 * 修改人：YuanYuyin     
	 * 修改时间：2015年12月11日 下午16:12:11  
	 * 修改备注： 
	 * @param currentPage</pre>    
	 */
	public void setCurrentPage(Integer currentPage) {
		this.currentPage = currentPage;
	}
	
	/** <pre>getPageItem(获取每页条数)   
	 * 创建人：YuanYuyin    
	 * 创建时间：2015年12月11日 下午16:12:27  
	 * 修改人：YuanYuyin     
	 * 修改时间：2015年12月11日 下午16:12:27  
	 * 修改备注： 
	 * @return</pre>    
	 */
	public Integer getPageItem() {
		// 如果没有每页几条，默认五条
		if (pageItem == null) {
			pageItem = 10;
		}
		return pageItem;
	}

	/** <pre>setPageItem(赋值每页条数)   
	 * 创建人：YuanYuyin    
	 * 创建时间：2015年12月11日 下午16:13:09      
	 * 修改人：YuanYuyin     
	 * 修改时间：2015年12月11日 下午16:13:09  
	 * 修改备注： 
	 * @param pageItem</pre>    
	 */
	public void setPageItem(Integer pageItem) {
		this.pageItem = pageItem;
	}

	/** <pre>getCountItem(获取总条数)   
	 * 创建人：YuanYuyin    
	 * 创建时间：2015年12月11日 下午16:13:40
	 * 修改人：YuanYuyin     
	 * 修改时间：2015年12月11日 下午16:13:40  
	 * 修改备注： 
	 * @return</pre>    
	 */
	public Integer getCountItem() {
		return countItem;
	}

	/** <pre>setCountItem(赋值总条数)   
	 * 创建人：YuanYuyin    
	 * 创建时间：2015年12月11日 下午16:14:17
	 * 修改人：YuanYuyin     
	 * 修改时间：2015年12月11日 下午16:14:17
	 * 修改备注： 
	 * @param countItem</pre>    
	 */
	public void setCountItem(Integer countItem) {
		this.countItem = countItem;
	}

	/** <pre>getCountPage(获取总页数)   
	 * 创建人：YuanYuyin    
	 * 创建时间：2015年12月11日 下午16:14:34
	 * 修改人：YuanYuyin     
	 * 修改时间：2015年12月11日 下午16:14:34
	 * 修改备注： 
	 * @return</pre>    
	 */
	public Integer getCountPage() {
		// 总页数 =总条数/每页条数 向上取证 例如：18/5=3.6 向上取整 4 注意：需要将总条数转为 浮点类型 目的：求余数
		countPage = (int) Math.ceil(getCountItem().doubleValue() / getPageItem());
		return countPage;
	}

	/** <pre>setCountPage(赋值总页数)   
	 * 创建人：YuanYuyin    
	 * 创建时间：2015年12月11日 下午16:14:53
	 * 修改人：YuanYuyin     
	 * 修改时间：2015年12月11日 下午16:14:53
	 * 修改备注： 
	 * @param countPage</pre>    
	 */
	public void setCountPage(Integer countPage) {
		this.countPage = countPage;
	}

	/** <pre>getStart(获取开始位置)   
	 * 创建人：YuanYuyin    
	 * 创建时间：2015年12月11日 下午16:15:09
	 * 修改人：YuanYuyin     
	 * 修改时间：2015年12月11日 下午16:15:09
	 * 修改备注： 
	 * @return</pre>    
	 */
	public Integer getStart() {
		// 起始值 = （当前页-1）*每页条数 求二页数据：5-9 （3-1）*5=10
		start = (getCurrentPage() - 1) * getPageItem();
		return start;
	}

	/** <pre>setStart(赋值开始位置)   
	 * 创建人：YuanYuyin    
	 * 创建时间：2015年12月11日 下午16:15:22 
	 * 修改人：YuanYuyin     
	 * 修改时间：2015年12月11日 下午16:15:22    
	 * 修改备注： 
	 * @param start</pre>    
	 */
	public void setStart(Integer start) {
		this.start = start;
	}

	public List getList() {
		return list;
	}

	public void setList(List list) {
		this.list = list;
	}

}
