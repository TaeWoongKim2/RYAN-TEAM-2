package DI_02;

public class HelloApp {

	public static void main(String[] args) {
		//영문
		MessageBean_en messageBean_en = new MessageBean_en();
		messageBean_en.sayHello("hong");
		
		//한글
		MessageBean_kr messageBean_kr = new MessageBean_kr();
		messageBean_kr.sayHello("hong");
		
		MessageBean messageBean = new MessageBean_kr();
		messageBean.sayHello("hong");
	}

}

/*
요구사항
MessageBean
영문버전(hong) -> Hellohong
한글버전(hong) -> 안녕hong
결과를 나누어서 출력
인터페이스로 구현되었으면....

>MessageBean_kr
>MessageBean_en
>위 두개 클래스는 같은 Interface를 구현.....



*/