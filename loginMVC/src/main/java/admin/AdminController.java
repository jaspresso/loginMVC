package admin;

import java.io.IOException;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/admin_servlet/*")
public class AdminController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		String uri=request.getRequestURI();
		String context=request.getContextPath();
		AdminDAO dao=new AdminDAO();
		if(uri.indexOf("main.do") != -1) {
			request.setAttribute("message", "홈페이지 방문을 환영합니다.");
			String page="/admin/admin_main.jsp";
			RequestDispatcher rd=request.getRequestDispatcher(page);
			rd.forward(request, response);
		}else if(uri.indexOf("list.do") != -1) {
			System.out.println("list.do호출...");
			System.out.println(request.getRequestURI());
			System.out.println(uri.indexOf("list.do"));
			Map<String,Object> map=new HashMap<>();
			List<AdminDTO> list=dao.adminList();
			map.put("list", list);//맵에 자료 저장
			map.put("count", list.size());
			request.setAttribute("map", map);
			String page="/admin/admin_list.jsp";
			RequestDispatcher rd=request.getRequestDispatcher(page);
			rd.forward(request, response);//포워딩(주소가 안바뀐다.)
		}else if(uri.indexOf("join.do") != -1) {//회원등록
			String userid=request.getParameter("userid");
			String passwd=request.getParameter("passwd");
			String name=request.getParameter("name");
			int deptno=Integer.parseInt(request.getParameter("deptno"));
			String email=request.getParameter("email");
			String hp=request.getParameter("hp");
			
			AdminDTO dto=new AdminDTO();
			dto.setUserid(userid);
			dto.setPasswd(passwd);
			dto.setName(name);
			dto.setDeptno(deptno);
			dto.setEmail(email);
			dto.setHp(hp);
			dao.insert(dto);//추가
			response.sendRedirect(context+"/user_servlet/main.do");
		}else if(uri.indexOf("view.do") != -1) {
			String userid=request.getParameter("userid");
			System.out.println("클릭한 아이디 : " + userid);
			AdminDTO dto=new AdminDTO();
			dto=dao.adminDetail(userid);
			request.setAttribute("dto", dto);
			String page="/admin/admin_view.jsp";
			RequestDispatcher rd=request.getRequestDispatcher(page);
			rd.forward(request, response);
		}else if(uri.indexOf("update.do") != -1) {
			String userid=request.getParameter("userid");
			String passwd=request.getParameter("passwd");
			String name=request.getParameter("name");
			int deptno=Integer.parseInt(request.getParameter("deptno"));
			String email=request.getParameter("email");
			String hp=request.getParameter("hp");
			AdminDTO dto=new AdminDTO();
			dto.setUserid(userid);
			dto.setPasswd(passwd);
			dto.setName(name);
			dto.setDeptno(deptno);
			dto.setEmail(email);
			dto.setHp(hp);
			//레코드 수정 처리
			dao.update(dto);
			//페이지 이동
			response.sendRedirect(context+"/admin_servlet/main.do");
		}else if(uri.indexOf("delete.do") != -1) {
			String userid=request.getParameter("userid");
			//레코드 삭제 처리
			dao.delete(userid);
			//세션도 함께 삭제
			HttpSession session = request.getSession();
			if (session != null) {
				session.invalidate();
			}
			//페이지 이동
			response.sendRedirect(context+"/admin_servlet/main.do");
		}else if(uri.indexOf("login.do") != -1) {
			String userid=request.getParameter("userid");
			String passwd=request.getParameter("passwd");
			System.out.println("아이디 : "+ userid);
			System.out.println("패스워드 : " + passwd);
			String name=dao.loginCheck(userid, passwd);
			System.out.println(name);
			String message="";
			String page="";//이동할 페이지 주소
			if(userid == null && passwd == null) {//처음 링크로 요청이 들어올때
				message = "";
				page="/admin/admin_login.jsp?message="+message;
			}else if(name==null) {//로그인 실패
				message="관리자 아이디 또는 비밀번호가 일치하지 않습니다.";
				//주소창에는 한글,특수문자를 넘길 수 없으므로 인코딩을 해야 함
				message=URLEncoder.encode(message, "utf-8");
				page="/admin/admin_login.jsp?message="+message;
			}else {//로그인 성공
				message=name+"님 환영합니다.";
				HttpSession session=request.getSession();//서블릿에서는 세션객체생성을 해야함.
				session.setAttribute("userid", userid);//세션에 저장
				session.setAttribute("message", message);
				page="/admin/admin_login_success.jsp";
			}
			System.out.println(message);
			//위 각각의 경우(로그인 실패,성공시)에 해당되는 page로 리디렉션을 한다.
			response.sendRedirect(request.getContextPath()+page);

		}else if(uri.indexOf("logout.do") != -1) {
			//getSession(false) : 현재 요청과 연관된 세션 객체가 존재할 경우 해당 세션을 반환하고, 존재하지 않을 경우 null을 반환하는 메서드
			HttpSession session = request.getSession();
			if (session != null) {
				session.invalidate();
			}
			//주소창에는 한글,특수문자를 넘길 수 없으므로 인코딩을 해야 함
			String message=URLEncoder.encode("로그아웃되었습니다.","utf-8");
			response.sendRedirect(request.getContextPath()
					+"/admin/admin_login.jsp?message="+message);
		}
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		doGet(request, response);
	}

}
