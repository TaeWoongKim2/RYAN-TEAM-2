package kosta.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kosta.vo.Employee;
import kosta.vo.Message;


@Controller
public class AjaxController {

	//org.springframework.web.servlet.view.json.MappingJackson2JsonView
	//@Autowired
	//private View jsonview;
	
	@RequestMapping(value="response.kosta",method=RequestMethod.POST)
	public @ResponseBody Employee add(HttpServletRequest request, HttpServletResponse response)
	{
		System.out.println("Response ");
		
		Employee employee = new Employee();
		employee.setFirstname(request.getParameter("firstName"));
		employee.setLastname(request.getParameter("lastName"));
		employee.setEmail(request.getParameter("email"));
		System.out.println(employee.getFirstname());
		return employee;
	}
	
	@RequestMapping(value="response2.kosta",method=RequestMethod.POST)
	public @ResponseBody Employee add(@RequestBody Employee emp) //@RequestBody Employee emp (비동기: 넘어오는 걸 객체로 받고 싶을 때)
	{   System.out.println("response");
		System.out.println(emp.toString());
		
		return emp;
	}
	
	@RequestMapping(value="idcheck.kosta", method=RequestMethod.POST)
	public @ResponseBody Message jsonkosta(String userid){
		/*Map<String, String> map = new HashMap<String, String>();*/
		System.out.println(userid);
		Message message = new Message();

		message.setMsg("hello");
/*		System.out.println(resultMsg);
		map.put("msg", resultMsg);*/
		System.out.println(message);
		return message;  //private View jsonview 타입으로 리턴
	}
	
}