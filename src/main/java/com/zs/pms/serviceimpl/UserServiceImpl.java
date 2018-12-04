package com.zs.pms.serviceimpl;

import java.util.List;

import org.apache.catalina.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.zs.pms.dao.UserDao;

import com.zs.pms.exception.AppException;
import com.zs.pms.po.TUser;
import com.zs.pms.service.UserService;
import com.zs.pms.utils.Constants;
import com.zs.pms.utils.MD5;
import com.zs.pms.vo.QueryUser;


@Service
@Transactional//该业务支持事务
public class UserServiceImpl implements UserService{

	@Autowired
	private UserDao udao;
	
	//登录
	public TUser chkLogin(QueryUser qUser) throws AppException {
		List<TUser> user1=udao.queryByCon(qUser);
		if (user1==null||user1.size()!=1) {
			throw new AppException("用户名密码有误，请重新输入",1000);
		}
		TUser user=user1.get(0);
		return udao.queryById(user.getId());
	}
	//删除
	public void deleteUser(int[] ids) {
	udao.deleteUser(ids);
		
	}
	//修改
	@Transactional(rollbackFor=Exception.class)
	public void update(TUser tUser) {
		//获得原来的用户
		TUser ouser=udao.queryById(tUser.getId());
		if (tUser.getPassword()!=null && (!"".equals(tUser.getPassword()))&&tUser.getPassword()!=ouser.getPassword()) {
			MD5 md=new MD5();
			tUser.setPassword(md.getMD5ofStr(tUser.getPassword()));
			
		}
		udao.update(tUser);
		
	}
	//根据条件查询
	public List<TUser> queryByCon(QueryUser qUser) {
		
		return udao.queryByCon(qUser);
	}
	//新增
	@Transactional(rollbackFor=Exception.class)
	public int insert(TUser user) {
		
		return udao.insert(user);
	}
	//删除
	@Transactional(rollbackFor=Exception.class)
	public void delete(int id) {
	udao.delete(id);
		
	}
	//根据id获得用户
	public TUser queryById(int id) {
		// TODO Auto-generated method stub
		return udao.queryById(id);
	}
	
	/* 
	 * query:条件
	 * page：当前页
	 */
	public List<TUser> queryByPage(QueryUser qUser, int page) {
		//当前页设置到条件中
		qUser.setPage(page);
		//返回结果
		return udao.queryByPage(qUser);
	}
	//查询总页数
	public int queryPageCount(QueryUser qUser) {
		//获得总条数
		int counts=udao.queryCount(qUser);
		//总条数%每页显示条数能整除 结果为总页数
		if (counts%Constants.PAGECOUNT==0) {
			return counts/Constants.PAGECOUNT;
		}else{// 否则总页数+1
			return counts/Constants.PAGECOUNT+1;
		}
		
	}
	@Override
	public String getWelcome() {
		
		return "欢迎使用SpringMVC";
	}
	
	

}
