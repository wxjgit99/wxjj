package com.zs.pms.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.zs.pms.dao.ArticleDao;
import com.zs.pms.po.TArticle;
import com.zs.pms.service.ArticleService;
import com.zs.pms.utils.Constants;
import com.zs.pms.vo.QueryArticle;
@Transactional//该业务支持事务
@Service
public class ArticleServiceImpl implements ArticleService {

	@Autowired
	private ArticleDao adao;
	// 通过条件查询
	public List<TArticle> queryByCon(QueryArticle qArticle) {
		
		return adao.queryByCon(qArticle);
	}

	//分页
	public List<TArticle> queryByPage(QueryArticle qArticle,int page) {
		qArticle.setPage(page);
		return adao.queryByPage(qArticle);
	}

	//根据id查询
	public TArticle queryById(int id) {
		
		return adao.queryById(id);
	}

	//批量删除
	public void deleteArticle(int[] ids) {
		adao.deleteArticle(ids);
	}

	//修改
	public void update(TArticle article) {
	adao.update(article);
	}

	//新增
	@Transactional(rollbackFor=Exception.class)
	public int insert(TArticle article) {
		
		return adao.insert(article);
	}

	//单个删除
	public void delete(int id) {
	adao.delete(id);
		
	}
	//查询总页数
	public int queryCount(QueryArticle article) {
		//获得总条数
		int counts=adao.queryCount(article);
		//总条数%每页显示条数能整除 结果为总页数
		if (counts%Constants.PAGECOUNT==0) {
			return counts/Constants.PAGECOUNT;
		}else{// 否则总页数+1
			return counts/Constants.PAGECOUNT+1;
		}
	}

	
	

}
