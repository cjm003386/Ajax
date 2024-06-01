package ex2_insert_gson_servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.JsonArray;


@WebServlet("/servlet_gson.bo2")
public class ServletGo3 extends HttpServlet {
	private static final long serialVersionUID = 1L;
		
		protected void doGet(HttpServletRequest request, HttpServletResponse response)
				throws ServletException, IOException{
			DAO dao = new DAO();
			JsonArray array = dao.getList();
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.print(array);
			System.out.println(array);
		}
		
		//����, �߰�, ����
		protected void doPost(HttpServletRequest request, HttpServletResponse response)
				throws ServletException, IOException{
			int result = -1;
			DAO dao = new DAO();
			String label = request.getParameter("label");
			switch (label) {
			case "����":
				result = dao.delete(Integer.parseInt(request.getParameter("id")));
				break;
			case "�߰�":
			case "�����Ϸ�":
				VO vo = new VO();
				vo.setName(request.getParameter("name"));
				vo.setPrice(Integer.parseInt(request.getParameter("price").replaceAll(",","")));
				vo.setMaker(request.getParameter("maker"));
				if(label.equals("�����Ϸ�")) {
					vo.setId(Integer.parseInt(request.getParameter("id")));
					result= dao.update(vo);
				}else {
					result = dao.insert(vo);
				}
				break;
			}
		
		if (result == 1) {
			System.out.println(label + " ����");
			doGet(request, response);
		}else {
			System.out.println(label + " ����");
			response.setContentType("text/html;charset=utf-8");
			response.getWriter().print(label +" ����");
			
		}

	}
}

