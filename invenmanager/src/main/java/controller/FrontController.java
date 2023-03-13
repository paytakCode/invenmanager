package controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class FrontController
 */
public class FrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	//url에 따른 controller의 매핑정보를 저장하는 map
	private Map<String, Controller> controllerMap = new HashMap<>();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FrontController() {
    	
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// uri 얻기
		String requestURI = request.getRequestURI();
		
		// 요청 url과 매칭하는 Controller 객체를 controllerMap에서 가져오기
		ControllerInterface controller = controllerMap.get(requestURI);
		if(controller == null) {
			response.setStatus(HttpServletResponse.SC_NOT_FOUND);
			return;
		}
	}

}
