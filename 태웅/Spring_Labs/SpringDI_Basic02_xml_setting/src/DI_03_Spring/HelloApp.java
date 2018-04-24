package DI_03_Spring;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;


public class HelloApp {
	
	public static void main(String[] args) {
		// Generic은 type casting이 가능함.
		ApplicationContext context = new GenericXmlApplicationContext("classpath:DI_03_Spring/DI_03.xml");
		Message message = context.getBean("message", Message.class);
		message.sayHello("hong");
	}
}
/*
요구사항
MessageBean
영문버전(Hong --> Hello Hong ~~ !!)
한글버전(Hong --> 안녕 홍 ~~ !!)
결과를 나눠서 출력
인터페이스로 구현
*/