package com.zs.pms.dao;

import java.util.List;

import com.zs.pms.po.TUser;
import com.zs.pms.vo.QueryUser;

public interface UserDao {
	// 通过条件查询
	public List<TUser> queryByCon(QueryUser qUser);
	//查分页
	public List<TUser> queryByPage(QueryUser qUser);
	// 根据主键查询
	public TUser queryById(int id);

	// 批量删除
	public void deleteUser(int[] ids);

	// 修改
	public void update(TUser tUser);

	// 新增
	public int insert(TUser user);
	//删除
	public void delete(int id);
	//查询总数
	public int queryCount(QueryUser qUser);
	//测试用
	public String getWelcome();
}
