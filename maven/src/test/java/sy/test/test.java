//package sy.test;
//
//import org.junit.Test;
//import org.springframework.context.ApplicationContext;
//import org.springframework.context.support.ClassPathXmlApplicationContext;
//
//import com.zx.model.Customer;
//import com.zx.service.CustomerServiceI;
//
//public class test {
//	@Test
//	public void test1(){
//	ApplicationContext ac = new ClassPathXmlApplicationContext(new String[] { "classpath:spring.xml", "classpath:spring-hibernate.xml" });
////	UserServiceI userService = (UserServiceI) ac.getBean("userService");
////	Tuser t = new Tuser();
////	t.setId(UUID.randomUUID().toString());
////	t.setName("孙宇");
////	t.setPwd("123465");
////	t.setCreatedatetime(new Date());
////	userService.save(t);
//	CustomerServiceI cusService=(CustomerServiceI) ac.getBean("customerService");
//	Customer cus=new Customer();
////	cus.setCusId(1);
////	cus.setAddress("樊川镇");
//	cus.setEmail("1@qq.com");
//	cus.setPassword("123123");
//	cus.setPhone("15555555");
//	cus.setRealname("周欣");
//	cus.setUsername("zx");
//	cusService.save(cus);
//	cus=cusService.login("alonsovau", "123123123");
//	System.out.println(cus);
////	System.out.println(cus.getEmail()+cus.getRealname());
//	System.out.println(cusService.isUnique("opsoapsoa"));
//	}
//}
