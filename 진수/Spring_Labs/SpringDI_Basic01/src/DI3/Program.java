package DI3;

public class Program {

	public static void main(String[] args) {
		//NewRecordView view = new NewRecordView(100, 70, 80);
		//view.print();
		
		NewRecordView view = new NewRecordView();
		NewRecord record = new NewRecord(100, 70, 80);
		
		view.setRecord(record);//객체 주입
		
		
		view.input();
		view.print();
	}

}
