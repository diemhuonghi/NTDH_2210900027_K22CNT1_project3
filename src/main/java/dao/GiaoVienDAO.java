package dao;

import model.GiaoVien;
import util.DBConnect;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class GiaoVienDAO {

    // Lấy danh sách tất cả giáo viên
    public List<GiaoVien> getAllGiaoVien() {
        List<GiaoVien> list = new ArrayList<>();
        String query = "SELECT * FROM NTDH_GIAO_VIEN";
        
        try (Connection conn = DBConnect.getConnection();
             PreparedStatement ps = conn.prepareStatement(query);
             ResultSet rs = ps.executeQuery()) {
            
            while (rs.next()) {
                list.add(mapResultSetToGiaoVien(rs));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    // Lấy giáo viên theo ID
    public GiaoVien getGiaoVienById(int id) {
        String query = "SELECT * FROM NTDH_GIAO_VIEN WHERE id = ?";
        
        try (Connection conn = DBConnect.getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {
            
            ps.setInt(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return mapResultSetToGiaoVien(rs);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    // Thêm giáo viên mới
    public boolean addGiaoVien(GiaoVien gv) {
        String query = "INSERT INTO NTDH_GIAO_VIEN (HoTen, TaiKhoan, MatKhau, Email, TrangThai) VALUES (?, ?, ?, ?, ?)";
        
        try (Connection conn = DBConnect.getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {
            
            ps.setString(1, gv.getHoTen());
            ps.setString(2, gv.getTaiKhoan());
            ps.setString(3, gv.getMatKhau());
            ps.setString(4, gv.getEmail());
            ps.setBoolean(5, gv.isTrangThai());
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Cập nhật giáo viên
    public boolean updateGiaoVien(GiaoVien gv) {
        String query = "UPDATE NTDH_GIAO_VIEN SET HoTen = ?, TaiKhoan = ?, MatKhau = ?, Email = ?, TrangThai = ? WHERE id = ?";
        
        try (Connection conn = DBConnect.getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {
            
            ps.setString(1, gv.getHoTen());
            ps.setString(2, gv.getTaiKhoan());
            ps.setString(3, gv.getMatKhau());
            ps.setString(4, gv.getEmail());
            ps.setBoolean(5, gv.isTrangThai());
            ps.setInt(6, gv.getId());
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Xóa giáo viên
    public boolean deleteGiaoVien(int id) {
        String query = "DELETE FROM NTDH_GIAO_VIEN WHERE id = ?";
        
        try (Connection conn = DBConnect.getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {
            
            ps.setInt(1, id);
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Kiểm tra đăng nhập
    public GiaoVien login(String taiKhoan, String matKhau) {
        String query = "SELECT * FROM NTDH_GIAO_VIEN WHERE TaiKhoan = ? AND MatKhau = ? AND TrangThai = 1";
        
        try (Connection conn = DBConnect.getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {
            
            ps.setString(1, taiKhoan);
            ps.setString(2, matKhau);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return mapResultSetToGiaoVien(rs);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    // Kiểm tra tài khoản đã tồn tại chưa
    public boolean isUsernameExist(String username) {
        String query = "SELECT 1 FROM NTDH_GIAO_VIEN WHERE TaiKhoan = ?";
        
        try (Connection conn = DBConnect.getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {
            
            ps.setString(1, username);
            try (ResultSet rs = ps.executeQuery()) {
                return rs.next();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Ánh xạ từ ResultSet sang GiaoVien
    private GiaoVien mapResultSetToGiaoVien(ResultSet rs) throws SQLException {
        return new GiaoVien(
                rs.getInt("id"),
                rs.getString("HoTen"),
                rs.getString("TaiKhoan"),
                rs.getString("MatKhau"),
                rs.getString("Email"),
                rs.getBoolean("TrangThai")
        );
    }
}
