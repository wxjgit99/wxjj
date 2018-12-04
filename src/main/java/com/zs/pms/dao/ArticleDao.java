package com.zs.pms.dao;

import java.util.List;

import com.zs.pms.po.TArticle;
import com.zs.pms.vo.QueryArticle;
import com.zs.pms.vo.QueryUser;


public interface ArticleDao {
	// 通过条件查询
		public List<TArticle> queryByCon(QueryArticle qArticle);
		//查分页
		public List<TArticle> queryByPage(QueryArticle qArticle);
		// 根据主键查询
		public TArticle queryById(int id);

		// 批量删除
		public void deleteArticle(int[] ids);

		// 修改
		public void update(TArticle article);

		// 新增
		public int insert(TArticle article);
		//删除
		public void delete(int id);
		//查询总数
		public int queryCount(QueryArticle article);
}
