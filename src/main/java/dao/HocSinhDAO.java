package dao;

import model.HocSinh;
import util.DBConnect;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class HocSinhDAO {
    
    // Lấy danh sách tất cả học sinh
    public List<HocSinh> getAllHocSinh() {
        List<HocSinh> list = new ArrayList<>();
        String query = "SELECT * FROM NTDH_HOC_SINH";
        
        try (Connection conn = DBConnect.getConnection();
             PreparedStatement ps = conn.prepareStatement(query);
             ResultSet rs = ps.executeQuery()) {
            
            while (rs.next()) {
                HocSinh hs = new HocSinh(
                    rs.getInt("id"),
                    rs.getString("HoTen"),
                    rs.getString("TaiKhoan"),
                    rs.getString("MatKhau"),
                    rs.getString("Email"),
                    rs.getString("LopHoc"),
                    rs.getBoolean("TrangThai")
                );
                list.add(hs);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
 // Lấy thông tin học sinh theo ID
    public HocSinh getHocSinhById(int id) {
        String query = "SELECT * FROM NTDH_HOC_SINH WHERE id = ?";
        
        try (Connection conn = DBConnect.getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {
            
            ps.setInt(1, id);
            
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return new HocSinh(
                        rs.getInt("id"),
                        rs.getString("HoTen"),
                        rs.getString("TaiKhoan"),
                        rs.getString("MatKhau"),
                        rs.getString("Email"),
                        rs.getString("LopHoc"),
                        rs.getBoolean("TrangThai")
                    );
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }


    // Đăng nhập
    public HocSinh login(String taiKhoan, String matKhau) {
        String query = "SELECT * FROM NTDH_HOC_SINH WHERE TaiKhoan = ? AND MatKhau = ? AND TrangThai = 1";
        
        try (Connection conn = DBConnect.getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {
            
            ps.setString(1, taiKhoan);
            ps.setString(2, matKhau);
            
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return new HocSinh(
                        rs.getInt("id"),
                        rs.getString("HoTen"),
                        rs.getString("TaiKhoan"),
                        rs.getString("MatKhau"),
                        rs.getString("Email"),
                        rs.getString("LopHoc"),
                        rs.getBoolean("TrangThai")
                    );
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
    public boolean dangKyHocSinh(HocSinh hs) {
        String sql = "INSERT INTO NTDH_HOC_SINH (hoTen, taiKhoan, matKhau, email, lopHoc, trangThai) VALUES (?, ?, ?, ?, ?, ?)";
        
        try (Connection conn = DBConnect.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
             
            stmt.setString(1, hs.getHoTen());
            stmt.setString(2, hs.getTaiKhoan());
            stmt.setString(3, hs.getMatKhau());
            stmt.setString(4, hs.getEmail());
            stmt.setString(5, hs.getLopHoc());
            stmt.setBoolean(6, hs.isTrangThai());

            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // Thêm học sinh
    public void addHocSinh(HocSinh hs) {
        String query = "INSERT INTO NTDH_HOC_SINH (HoTen, TaiKhoan, MatKhau, Email, LopHoc, TrangThai) VALUES (?, ?, ?, ?, ?, ?)";
        
        try (Connection conn = DBConnect.getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {
            
            ps.setString(1, hs.getHoTen());
            ps.setString(2, hs.getTaiKhoan());
            ps.setString(3, hs.getMatKhau());
            ps.setString(4, hs.getEmail());
            ps.setString(5, hs.getLopHoc());
            ps.setBoolean(6, hs.isTrangThai());
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // Cập nhật thông tin học sinh
    public void updateHocSinh(HocSinh hs) {
        String query = "UPDATE NTDH_HOC_SINH SET HoTen = ?, TaiKhoan = ?, MatKhau = ?, Email = ?, LopHoc = ?, TrangThai = ? WHERE id = ?";
        
        try (Connection conn = DBConnect.getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {
            
            ps.setString(1, hs.getHoTen());
            ps.setString(2, hs.getTaiKhoan());
            ps.setString(3, hs.getMatKhau());
            ps.setString(4, hs.getEmail());
            ps.setString(5, hs.getLopHoc());
            ps.setBoolean(6, hs.isTrangThai());
            ps.setInt(7, hs.getId());
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // Xóa học sinh
    public void deleteHocSinh(int id) {
        String query = "DELETE FROM NTDH_HOC_SINH WHERE id = ?";
        
        try (Connection conn = DBConnect.getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {
            
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    // Kiểm tra tài khoản đã tồn tại chưa
    public boolean isUsernameExist(String taiKhoan) {
        String query = "SELECT COUNT(*) FROM NTDH_HOC_SINH WHERE TaiKhoan = ?";
        
        try (Connection conn = DBConnect.getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {
            
            ps.setString(1, taiKhoan);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next() && rs.getInt(1) > 0) {
                    return true;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
}
