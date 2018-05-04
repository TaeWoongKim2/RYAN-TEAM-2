package DI_04_Spring;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

public class HelloApp {
	
	public static void main(String[] args) {
		
		//MessageBeanImpl messagebean = new MessageBeanImpl("hong");
		//messagebean.setGreeting("Hello"); // setter 함수에서 초기화
		//messagebean.sayHello();
		
		// 위 코드를 Spring을 통해서 'IOC 컨테이너'안에 객체를 만들고 '주입'을 하겠다. >> xml 또는 Annotation을 통해...
		ApplicationContext context = new GenericXmlApplicationContext("classpath:DI_04_Spring/DI_04.xml");
		
		MessageBean messagebean = context.getBean("m2", MessageBean.class);
		messagebean.sayHello();
	}
}