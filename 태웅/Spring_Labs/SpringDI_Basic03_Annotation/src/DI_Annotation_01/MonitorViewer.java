package DI_Annotation_01;

import org.springframework.beans.factory.annotation.Autowired;

public class MonitorViewer {
	
/*
1단계: xml 설정 파일 기반의 DI 작업

	private Recorder recorder;

	public Recorder getRecorder() {
		return recorder;
	}

	public void setRecorder(Recorder recorder) {
		this.recorder = recorder;
	}
*/
	
	//2단계: Annotation 기반으로 DI 작업(injection 자원: 생성자 주입, setter 주입, member field 주입)
/*	
	@Autowired
	private Recorder recorder;
	public Recorder getRecorder() {
		return recorder;
	}
*/	
	
	//**주로 사용
	//3단계: Annotation 기반으로 DI 작업 (setter를 통한 주입 사용)
	private Recorder recorder;
	
	public Recorder getRecorder() {
		return recorder;
	}
	
	@Autowired
	public void setRecorder(Recorder recorder) {
		this.recorder = recorder;
	}
	
}
