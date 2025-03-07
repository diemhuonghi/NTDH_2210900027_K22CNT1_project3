package controller;


import dao.DeThiDAO;
import model.DeThi;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/DeThiServlet")
public class DeThiServlet extends HttpServlet {
 private static final long serialVersionUID = 1L;
 private DeThiDAO deThiDAO;
 
 public void init() {
     deThiDAO = new DeThiDAO();
 }
 
 protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
     String action = request.getParameter("action");
     if ("delete".equals(action)) {
         int maDe = Integer.parseInt(request.getParameter("maDe"));
         deThiDAO.deleteDeThi(maDe);
     }
     List<DeThi> listDeThi = deThiDAO.getAllDeThi();
     request.setAttribute("listDeThi", listDeThi);
     request.getRequestDispatcher("views/dethi.jsp").forward(request, response);
 }
 
 protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
     String tenDe = request.getParameter("tenDe");
     int maMH = Integer.parseInt(request.getParameter("maMH"));
     boolean trangThai = Boolean.parseBoolean(request.getParameter("trangThai"));
     deThiDAO.addDeThi(new DeThi(0, tenDe, maMH, trangThai));
     response.sendRedirect("DeThiServlet");
 }
}