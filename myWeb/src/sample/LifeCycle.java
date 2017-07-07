package sample;

import java.io.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class LifeCycle
 */
@WebServlet("/LifeCycle")
public class LifeCycle extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
    public LifeCycle() {
        System.out.println("LifeServlet의 생성자 호출됨");
    }
    
    @Override
    //LifeServlet의 초기화 작업을 담당한다.
    //Servlet 객체 생성시 단한번 수행됨
    public void init() throws ServletException{
    	System.out.println("init()호출됨");
    }
    @Override
    //클라이언트의 연결요청이 있을때마다 호출된다.
    public void service(HttpServletRequest req,HttpServletResponse resp) throws ServletException,IOException{
    	System.out.println("service()호출됨");
    }
}
