package controller;

import dao.BaiLamDAO;
import model.BaiLam;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/bailam")
public class BaiLamServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private BaiLamDAO baiLamDAO = new BaiLamDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        try {
            if (action == null) {
                listBaiLam(request, response);
            } else {
                switch (action) {
                    case "edit":
                        showEditForm(request, response);
                        break;
                    case "delete":
                        deleteBaiLam(request, response);
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
                insertBaiLam(request, response);
            } else if (action.equals("update")) {
                updateBaiLam(request, response);
            } else {
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Action không hợp lệ!");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Lỗi hệ thống!");
        }
    }

    // 🟢 Hiển thị danh sách bài làm
    private void listBaiLam(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<BaiLam> danhSachBaiLam = baiLamDAO.getAllBaiLam();
        request.setAttribute("danhSachBaiLam", danhSachBaiLam);
        request.getRequestDispatcher("views/bai_lam.jsp").forward(request, response);
    }

    // 🟡 Hiển thị form chỉnh sửa
    private void showEditForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            BaiLam baiLam = baiLamDAO.getBaiLamById(id);

            if (baiLam == null) {
                response.sendRedirect("bailam?error=notfound");
                return;
            }

            request.setAttribute("baiLam", baiLam);
            request.getRequestDispatcher("views/edit-bai_lam.jsp").forward(request, response);
        } catch (NumberFormatException e) {
            response.sendRedirect("bailam?error=invalidid");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Lỗi hệ thống!");
        }
    }

    // 🟠 Thêm bài làm
    private void insertBaiLam(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int hocSinhID = Integer.parseInt(request.getParameter("hocSinhID"));
            int deThiID = Integer.parseInt(request.getParameter("deThiID"));
            float diem = Float.parseFloat(request.getParameter("diem"));
            Timestamp thoiGianNop = new Timestamp(System.currentTimeMillis()); // Lấy thời gian hiện tại

            BaiLam bl = new BaiLam(0, hocSinhID, deThiID, diem, thoiGianNop);
            baiLamDAO.addBaiLam(bl);
            response.sendRedirect("bailam");

        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Lỗi khi thêm bài làm!");
        }
    }

    // 🟢 Cập nhật bài làm
    private void updateBaiLam(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            int hocSinhID = Integer.parseInt(request.getParameter("hocSinhID"));
            int deThiID = Integer.parseInt(request.getParameter("deThiID"));
            float diem = Float.parseFloat(request.getParameter("diem"));
            Timestamp thoiGianNop = new Timestamp(System.currentTimeMillis());

            BaiLam bl = new BaiLam(id, hocSinhID, deThiID, diem, thoiGianNop);
            baiLamDAO.updateBaiLam(bl);
            response.sendRedirect("bailam");

        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Lỗi khi cập nhật bài làm!");
        }
    }

    // 🔴 Xóa bài làm
    private void deleteBaiLam(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            baiLamDAO.deleteBaiLam(id);
            response.sendRedirect("bailam");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Lỗi khi xóa bài làm!");
        }
    }
}
