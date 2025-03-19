package controller;

import dao.BaiLamChiTietDAO;
import model.BaiLamChiTiet;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/bailamchitiet")
public class BaiLamChiTietServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private BaiLamChiTietDAO baiLamChiTietDAO = new BaiLamChiTietDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
        String action = request.getParameter("action");

        try {
            if (action == null) {
                listBaiLamChiTiet(request, response);
            } else {
                switch (action) {
                    case "edit":
                        showEditForm(request, response);
                        break;
                    case "delete":
                        deleteBaiLamChiTiet(request, response);
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
    	request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
        String action = request.getParameter("action");

        try {
            if (action == null || action.equals("add")) {
                insertBaiLamChiTiet(request, response);
            } else if (action.equals("update")) {
                updateBaiLamChiTiet(request, response);
            } else {
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Action không hợp lệ!");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Lỗi hệ thống!");
        }
    }

    // Hiển thị danh sách bài làm chi tiết
    private void listBaiLamChiTiet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<BaiLamChiTiet> danhSachBaiLamCT = baiLamChiTietDAO.getAllBaiLamChiTiet();
        request.setAttribute("danhSachBaiLamCT", danhSachBaiLamCT);
        request.getRequestDispatcher("views/bai_lam_chi_tiet.jsp").forward(request, response);
    }

    // Hiển thị form chỉnh sửa bài làm chi tiết
    private void showEditForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            BaiLamChiTiet blct = baiLamChiTietDAO.getBaiLamChiTietById(id);

            if (blct == null) {
                response.sendRedirect("bailamchitiet?error=notfound");
                return;
            }

            request.setAttribute("baiLamChiTiet", blct);
            request.getRequestDispatcher("views/edit-bai-lam-chi-tiet.jsp").forward(request, response);
        } catch (NumberFormatException e) {
            response.sendRedirect("bailamchitiet?error=invalidid");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Lỗi hệ thống!");
        }
    }

    // Thêm bài làm chi tiết
    private void insertBaiLamChiTiet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int baiLamID = Integer.parseInt(request.getParameter("baiLamID"));
            int cauHoiID = Integer.parseInt(request.getParameter("cauHoiID"));
            int dapAnID = Integer.parseInt(request.getParameter("dapAnID"));

            BaiLamChiTiet blct = new BaiLamChiTiet(0, baiLamID, cauHoiID, dapAnID);
            baiLamChiTietDAO.addBaiLamChiTiet(blct);
            response.sendRedirect("bailamchitiet");

        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Lỗi khi thêm bài làm chi tiết!");
        }
    }

    // Cập nhật bài làm chi tiết
    private void updateBaiLamChiTiet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            int baiLamID = Integer.parseInt(request.getParameter("baiLamID"));
            int cauHoiID = Integer.parseInt(request.getParameter("cauHoiID"));
            int dapAnID = Integer.parseInt(request.getParameter("dapAnID"));

            BaiLamChiTiet blct = new BaiLamChiTiet(id, baiLamID, cauHoiID, dapAnID);
            baiLamChiTietDAO.updateBaiLamChiTiet(blct);
            response.sendRedirect("bailamchitiet");

        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Lỗi khi cập nhật bài làm chi tiết!");
        }
    }

    // Xóa bài làm chi tiết
    private void deleteBaiLamChiTiet(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            baiLamChiTietDAO.deleteBaiLamChiTiet(id);
            response.sendRedirect("bailamchitiet");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Lỗi khi xóa bài làm chi tiết!");
        }
    }
}
