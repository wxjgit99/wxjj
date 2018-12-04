package com.zs.pms.service;

import java.util.List;

import com.zs.pms.exception.AppException;
import com.zs.pms.po.TUser;
import com.zs.pms.vo.QueryUser;

public interface UserService {
	// 登录
	public TUser chkLogin(QueryUser qUser) throws AppException;

	// 修改
	public void update(TUser tUser);

	// 新增
	public int insert(TUser user);

	// 删除一条
	public void delete(int id);

	// 获得一条
	public TUser queryById(int id);

	// 通过条件查询
	public List<TUser> queryByCon(QueryUser qUser);

	// 查分页
	public List<TUser> queryByPage(QueryUser qUser,int page);

	// 批量删除
	public void deleteUser(int[] ids);
	//获得总页数
	public int queryPageCount(QueryUser qUser);
	//测试用
	public String getWelcome();
}
