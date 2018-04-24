package DI_04_Spring;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

public class HelloApp {

	public static void main(String[] args) {
		//java 코드
		//MessageBeanImpl messagebean = new MessageBeanImpl("hong");
		//messagebean.setGreeting("hello"); //greeting 는 setter 로 초기화
		//messagebean.sayHello();
				
		//위 코드를 Spring 통해서 (IOC 컨테이너 안에 객체 만들고 주입을 하고) > xml파일 또는 Annotation 통해서
		ApplicationContext context = new GenericXmlApplicationContext("classpath:DI_04_Spring/DI_04.xml");
		MessageBean messagebean = context.getBean("m1", MessageBean.class);
		messagebean.sayHello();
	}

}