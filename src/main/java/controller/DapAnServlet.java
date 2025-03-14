package controller;

import dao.DapAnDAO;
import model.DapAn;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/dapan")
public class DapAnServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private DapAnDAO dapAnDAO = new DapAnDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        String action = request.getParameter("action");

        try {
            if (action == null) {
                listDapAn(request, response);
            } else {
                switch (action) {
                    case "edit":
                        showEditForm(request, response);
                        break;
                    case "delete":
                        deleteDapAn(request, response);
                        break;
                    default:
                        response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Action không hợp lệ!");
                        break;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Lỗi hệ thống!");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        String action = request.getParameter("action");

        try {
            if (action == null || action.equals("add")) {
                insertDapAn(request, response);
            } else if (action.equals("update")) {
                updateDapAn(request, response);
            } else {
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Action không hợp lệ!");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Lỗi hệ thống!");
        }
    }

    // 🟢 Hiển thị danh sách đáp án
    private void listDapAn(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        List<DapAn> danhSachDapAn = dapAnDAO.getAllDapAn();
        request.setAttribute("danhSachDapAn", danhSachDapAn);
        request.getRequestDispatcher("views/dap_an.jsp").forward(request, response);
    }

    // 🟡 Hiển thị form chỉnh sửa đáp án
    private void showEditForm(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            DapAn dapAn = dapAnDAO.getDapAnById(id);

            if (dapAn == null) {
                response.sendRedirect("dapan?error=notfound");
                return;
            }

            request.setAttribute("dapAn", dapAn);
            request.getRequestDispatcher("views/edit-dapan.jsp").forward(request, response);
        } catch (NumberFormatException e) {
            response.sendRedirect("dapan?error=invalidid");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Lỗi hệ thống!");
        }
    }

    // 🟠 Thêm đáp án
    private void insertDapAn(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        try {
            int cauHoiID = Integer.parseInt(request.getParameter("cauHoiID"));
            String noiDung = request.getParameter("noiDung");
            boolean dapAnDung = request.getParameter("dapAnDung") != null;

            DapAn dapAn = new DapAn(0, cauHoiID, noiDung, dapAnDung);
            dapAnDAO.addDapAn(dapAn);
            response.sendRedirect("dapan");

        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Lỗi khi thêm đáp án!");
        }
    }

    // 🟢 Cập nhật đáp án
    private void updateDapAn(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            int cauHoiID = Integer.parseInt(request.getParameter("cauHoiID"));
            String noiDung = request.getParameter("noiDung");
            boolean dapAnDung = request.getParameter("dapAnDung") != null;

            DapAn dapAn = new DapAn(id, cauHoiID, noiDung, dapAnDung);
            dapAnDAO.updateDapAn(dapAn);
            response.sendRedirect("dapan");

        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Lỗi khi cập nhật đáp án!");
        }
    }

    // 🔴 Xóa đáp án
    private void deleteDapAn(HttpServletRequest request, HttpServletResponse response) 
            throws IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        dapAnDAO.deleteDapAn(id);
        response.sendRedirect("dapan");
    }
}
