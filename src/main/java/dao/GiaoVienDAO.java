package dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import model.GiaoVien;
import util.DBConnect;

public class GiaoVienDAO {
    // Lấy danh sách giáo viên
    public List<GiaoVien> getAll() {
        List<GiaoVien> list = new ArrayList<>();
        String query = "SELECT * FROM NTDH_GIAO_VIEN";
        try (Connection conn = DBConnect.getConnection();
             PreparedStatement ps = conn.prepareStatement(query);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                list.add(new GiaoVien(
                        rs.getInt("id"),
                        rs.getString("HoTen"),
                        rs.getString("TaiKhoan"),
                        rs.getString("MatKhau"),
                        rs.getString("Email"),
                        rs.getBoolean("TrangThai"),
                        rs.getTimestamp("NgayTao")
                ));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    // Thêm giáo viên
    public boolean insert(GiaoVien gv) {
        String query = "INSERT INTO NTDH_GIAO_VIEN (HoTen, TaiKhoan, MatKhau, Email, TrangThai) VALUES (?, ?, ?, ?, ?)";
        try (Connection conn = DBConnect.getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setString(1, gv.getHoTen());
            ps.setString(2, gv.getTaiKhoan());
            ps.setString(3, gv.getMatKhau());
            ps.setString(4, gv.getEmail());
            ps.setBoolean(5, gv.isTrangThai());
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    // Sửa giáo viên
    public boolean update(GiaoVien gv) {
        String query = "UPDATE NTDH_GIAO_VIEN SET HoTen=?, TaiKhoan=?, MatKhau=?, Email=?, TrangThai=? WHERE id=?";
        try (Connection conn = DBConnect.getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setString(1, gv.getHoTen());
            ps.setString(2, gv.getTaiKhoan());
            ps.setString(3, gv.getMatKhau());
            ps.setString(4, gv.getEmail());
            ps.setBoolean(5, gv.isTrangThai());
            ps.setInt(6, gv.getId());
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    // Xóa giáo viên
    public boolean delete(int id) {
        String query = "DELETE FROM NTDH_GIAO_VIEN WHERE id=?";
        try (Connection conn = DBConnect.getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setInt(1, id);
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
}
