package controller;

import dao.MonHocDAO;
import model.MonHoc;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.Connection;

@WebServlet("/monhoc")
public class MonHocServlet extends HttpServlet {
    private MonHocDAO monHocDAO;

    
    @Override
    public void init() throws ServletException {
        Connection conn = (Connection) getServletContext().getAttribute("DBConnection");
        monHocDAO = new MonHocDAO(conn);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) action = "list";

        switch (action) {
            case "add":
                request.getRequestDispatcher("monhoc-form.jsp").forward(request, response);
                break;
            case "edit":
                int maMH = Integer.parseInt(request.getParameter("id"));
                MonHoc monHoc = monHocDAO.getMonHocById(maMH); // Thêm method này trong DAO
                request.setAttribute("monHoc", monHoc);
                request.getRequestDispatcher("views/monhoc.jsp").forward(request, response);
                break;
            case "delete":
                monHocDAO.deleteMonHoc(Integer.parseInt(request.getParameter("id")));
                response.sendRedirect("MonHoc"); // Sửa lại URL redirect đúng mapping
                break;
            default:
                List<MonHoc> list = monHocDAO.getAllMonHoc();
                request.setAttribute("ListMonHoc", list); // Đổi lại để trùng với JSP
                request.getRequestDispatcher("views/monhoc.jsp").forward(request, response);
                break;
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int maMH = Integer.parseInt(request.getParameter("maMH"));
        String tenMH = request.getParameter("tenMH");
        boolean trangThai = Boolean.parseBoolean(request.getParameter("trangThai"));

        MonHoc monHoc = new MonHoc(maMH, tenMH, trangThai);
        String action = request.getParameter("action");

        if ("edit".equals(action)) {
            monHocDAO.updateMonHoc(monHoc);
        } else {
            monHocDAO.addMonHoc(monHoc);
        }

        response.sendRedirect("MonHoc"); // Sửa lại URL redirect đúng mapping
    }
}
