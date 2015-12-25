package sy.test;

import java.io.File;
import java.util.Iterator;

import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.zx.model.Category;
import com.zx.model.Picture;
import com.zx.model.Product;
import com.zx.service.ProductServiceI;

public class test2 {
//	@Test
//	public void test() {
//		ApplicationContext ac = new ClassPathXmlApplicationContext(new String[] { "classpath:spring.xml", "classpath:spring-hibernate.xml" });
//		ProductServiceI productService=(ProductServiceI) ac.getBean("productService");
//		Product product=productService.findByID(10);
//		Iterator<Picture> it=product.getPictures().iterator();
//		String path=it.next().getPath();
//		int i=path.indexOf("UploadImage");
//		System.out.println(path.substring(i));
//	}
	@Test
	public void test2(){
		String s="UploadImage/2/6f0db98a-cf8c-4fd9-a06b-57b6e64c390a.jpg";
		String ss=s.replaceAll("/", "\\\\\\\\");
		System.out.println(ss);
		//File file=new File("C:/apache-tomcat-7.0.64/webapps/UploadImage/2/6f0db98a-cf8c-4fd9-a06b-57b6e64c390a.jpg");
		File  file=new File("C:/apache-tomcat-7.0.64/webapps/UploadImagee/2/6f0db98a-cf8c-4fd9-a06b-57b6e64c390a.jpg");
		System.out.println(file.exists());		
		
	}
}
