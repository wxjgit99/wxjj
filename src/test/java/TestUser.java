import java.util.Date;
import java.util.UUID;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.zs.pms.exception.AppException;
import com.zs.pms.po.TDep;
import com.zs.pms.po.TPermission;
import com.zs.pms.po.TUser;
import com.zs.pms.service.UserService;
import com.zs.pms.vo.QueryUser;

@RunWith(SpringJUnit4ClassRunner.class)//使用spring测试框架
@ContextConfiguration("classpath:applicationcontext.xml")//引入配置文件
public class TestUser {
	@Autowired
	UserService us;
	//分页
	public void testQuery(){
		QueryUser qUser=new QueryUser();
		qUser.setIsenabled(1);
		qUser.setPage(4);
		us.queryByCon(qUser);
	} 
	//修改
	public void testUpdate(){
		TUser user=new TUser();
		user.setId(3811);
		user.setPassword("9999");
		user.setSex("男");
		user.setBirthday(new Date());
		user.setEmail("666@qq.com");
		TDep dep=new TDep();
		dep.setId(9);
		user.setDept(dep);
		user.setRealname("二嘎子");
		user.setUpdator(999);
		user.setIsenabled(-1);
		us.update(user);
		
	}
	//删除
	public void delete(){
		int []ids={3809,3810};
		us.deleteUser(ids);
	}
	//查询
	public void testQueryByCon(){
		QueryUser user=new QueryUser();
		user.setLoginname("test2");
		user.setPassword("FA246D0262C3925617B0C72BB20EEB1D");
		us.queryByCon(user);
	}
	//权限
	@Test
	public void testLogin(){
		//TUser user=new TUser();
		QueryUser queryUser=new QueryUser();
		queryUser.setLoginname("test1");
		queryUser.setPassword("111");
		
		try {
			TUser user=us.chkLogin(queryUser);
//			System.out.println(user.getRealname()+"、"+user.getDept().getName());
//			for(TPermission per:user.getTper()){
//				System.out.println(per.getPname());
//			}
//				System.out.println("----------------------");
//			
				for(TPermission per1:user.getMenu()){
					System.out.println(per1.getPname());
					for(TPermission per2:per1.getChild()){
						System.out.println("\t"+per2.getPname());
					}
				}
			
		} catch (AppException e) {
			System.out.println(e.getErrMsg());
		}catch (Exception e1) {
			e1.printStackTrace();
		}
		
	}
	
	//新增
	
	public void insertUser(){
		TUser user=new TUser();
		user.setId(4005);
		user.setLoginname("tttt");
		user.setPassword("9999");
		user.setSex("男");
		user.setBirthday(new Date());
		user.setEmail("666@qq.com");
		TDep dep=new TDep();
		dep.setId(9);
		user.setDept(dep);
		user.setRealname("虞姬");
		user.setPic("123456.jpg");
		user.setCreator(1000);
		us.insert(user);
	}
	
	
	//测试分页
	public void tesePage(){
		QueryUser qUser=new QueryUser();
		System.out.println("当前总页数为:"+us.queryPageCount(qUser));
		for(TUser user:us.queryByPage(qUser,2)){
			System.out.println(user.getRealname());
		}
	}
}
