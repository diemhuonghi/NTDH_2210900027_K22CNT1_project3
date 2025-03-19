package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CauHoiDAO;
import model.CauHoi;

@WebServlet("/LamBaiServlet")
	public class LamBaiServlet extends HttpServlet {
	
	    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    	request.setCharacterEncoding("UTF-8");
			response.setContentType("text/html; charset=UTF-8");
	        String deThiIDStr = request.getParameter("deThiID");
	        
	        // Kiểm tra nếu thiếu tham số
	        if (deThiIDStr == null || deThiIDStr.isEmpty()) {
	            response.getWriter().println("<h3 style='color:red;'>Lỗi: Thiếu tham số deThiID!</h3>");
	            return;
	        }

	        try {
	            int deThiID = Integer.parseInt(deThiIDStr);
	            CauHoiDAO cauHoiDAO = new CauHoiDAO();
	            List<CauHoi> dsCauHoi = cauHoiDAO.getCauHoiByDethi(deThiID);

	            request.setAttribute("dsCauHoi", dsCauHoi);
	            request.setAttribute("deThiID", deThiID);

	            RequestDispatcher dispatcher = request.getRequestDispatcher("user/lam-bai.jsp");
	            dispatcher.forward(request, response);
	        } catch (NumberFormatException e) {
	            response.getWriter().println("<h3 style='color:red;'>Lỗi: deThiID không hợp lệ!</h3>");
	        }
	    }
	}



