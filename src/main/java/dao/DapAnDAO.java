package dao;

import model.DapAn;
import util.DBConnect;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class DapAnDAO {

    // 🟢 Lấy danh sách tất cả đáp án
    public List<DapAn> getAllDapAn() {
        List<DapAn> list = new ArrayList<>();
        String query = "SELECT * FROM NTDH_DAP_AN";

        try (Connection conn = DBConnect.getConnection();
             PreparedStatement ps = conn.prepareStatement(query);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                DapAn da = new DapAn(
                    rs.getInt("id"),
                    rs.getInt("CauHoiID"),
                    rs.getString("NoiDung"),
                    rs.getBoolean("DapAnDung")
                );
                list.add(da);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
    public List<DapAn> getDapAnByCauHoi(int cauHoiID) {
        List<DapAn> list = new ArrayList<>();
        String sql = "SELECT * FROM NTDH_DAP_AN WHERE cauHoiID = ?";

        try (Connection conn = DBConnect.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, cauHoiID);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                DapAn da = new DapAn();
                da.setId(rs.getInt("id"));
                da.setCauHoiID(rs.getInt("cauHoiID"));
                da.setNoiDung(rs.getString("noiDung")); // Chỉ lấy nội dung đáp án
                list.add(da);
            }

            // Debug xem có dữ liệu hay không
            System.out.println("Lấy đáp án cho câu hỏi " + cauHoiID + ": " + list.size() + " đáp án");
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }


    // 🟢 Lấy một đáp án theo ID
    public DapAn getDapAnById(int id) {
        String query = "SELECT * FROM NTDH_DAP_AN WHERE id = ?";
        try (Connection conn = DBConnect.getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {

            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return new DapAn(
                    rs.getInt("id"),
                    rs.getInt("CauHoiID"),
                    rs.getString("NoiDung"),
                    rs.getBoolean("DapAnDung")
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
    public boolean kiemTraDapAnDung(int dapAnID) {
        String query = "SELECT DapAnDung FROM NTDH_DAP_AN WHERE id = ?";
        try (Connection conn = DBConnect.getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setInt(1, dapAnID);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getBoolean("DapAnDung");  // Trả về true nếu đáp án đúng
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;  // Mặc định trả về false nếu không tìm thấy
    }


    // 🟢 Thêm mới đáp án
    public void addDapAn(DapAn da) {
        String query = "INSERT INTO NTDH_DAP_AN (CauHoiID, NoiDung, DapAnDung) VALUES (?, ?, ?)";

        try (Connection conn = DBConnect.getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {

            ps.setInt(1, da.getCauHoiID());
            ps.setString(2, da.getNoiDung());
            ps.setBoolean(3, da.isDapAnDung());
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    

    // 🟢 Cập nhật đáp án
    public void updateDapAn(DapAn da) {
        String query = "UPDATE NTDH_DAP_AN SET CauHoiID = ?, NoiDung = ?, DapAnDung = ? WHERE id = ?";

        try (Connection conn = DBConnect.getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {

            ps.setInt(1, da.getCauHoiID());
            ps.setString(2, da.getNoiDung());
            ps.setBoolean(3, da.isDapAnDung());
            ps.setInt(4, da.getId());

            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // 🟢 Xóa đáp án theo ID
    public void deleteDapAn(int id) {
        String query = "DELETE FROM NTDH_DAP_AN WHERE id = ?";

        try (Connection conn = DBConnect.getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {

            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
