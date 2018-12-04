import java.util.Date;

import javax.swing.table.TableColumn;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.zs.pms.po.TArticle;
import com.zs.pms.po.TChannel;
import com.zs.pms.po.TUser;
import com.zs.pms.service.ArticleService;
import com.zs.pms.vo.QueryArticle;
import com.zs.pms.vo.QueryUser;

@RunWith(SpringJUnit4ClassRunner.class)//使用spring测试框架
@ContextConfiguration("classpath:applicationcontext.xml")//引入配置文件
public class TestArticle {
	@Autowired
	ArticleService as;
	
	//根据条件查询
	public void queryByCon(){
		QueryArticle qArticle=new QueryArticle();
		qArticle.setAuthor("馒头");
		as.queryByCon(qArticle);
	} 
	
	//测试分页
	public void tesePage(){
		QueryArticle article=new QueryArticle();
		System.out.println("当前总页数为:"+as.queryCount(article));
		for(TArticle tArticle:as.queryByPage(article,2)){
			System.out.println(tArticle.getContent());
		}
	}
	//根据id获得
	
	public void queryById(){
		QueryArticle qArticle=new QueryArticle();
		qArticle.setId(2);
		as.queryByCon(qArticle);
	}
	
	//批量删除
	public void deleteAtricles(){
		int []ids={10,9,8};
		as.deleteArticle(ids);
	}
	
	//修改
	public void updateArticle(){
		TArticle article=new TArticle();
		article.setId(1);
		article.setContent("雾霾天太严重了");
		article.setAuthor("李白");
		article.setCrtime(new Date());
		TChannel channel=new TChannel();
		channel.setId(2);
		article.setChannel(channel);
		article.setIsremod(2);
		article.setIshot(1);
		article.setCreator(1);
		article.setUpdator(1);
		article.setUpdatime(new Date());
		as.update(article);
	}
	
	//新增
	
	public void addArticle(){
		TArticle article=new TArticle();
		article.setId(108);
		article.setTitle("还不下雪啊");
		article.setContent("在等几天吧");
		article.setAuthor("关羽");
		article.setCrtime(new Date());
		TChannel channel=new TChannel();
		channel.setId(2);
		article.setChannel(channel);
		article.setIsremod(1);
		article.setIshot(1);
		article.setCreator(1);
		article.setUpdator(1);
		article.setUpdatime(new Date());
		as.insert(article);
	}
	//删除单个
	@Test
	public void delete(){
		as.delete(7);
	}
}
