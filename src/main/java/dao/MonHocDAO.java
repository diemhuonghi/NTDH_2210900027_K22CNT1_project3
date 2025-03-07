package dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import model.MonHoc;

public class MonHocDAO {
    private Connection conn;

    public MonHocDAO(Connection conn) {
        this.conn = conn;
    }

    // Lấy danh sách môn học
    public List<MonHoc> getAllMonHoc() {
        List<MonHoc> list = new ArrayList<>();
        String query = "SELECT * FROM NTDH_MON_HOC";

        try (PreparedStatement ps = conn.prepareStatement(query);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                list.add(new MonHoc(
                    rs.getInt("MaMH"),
                    rs.getString("TenMH"),
                    rs.getBoolean("TrangThai")
                ));
            }
        } catch (SQLException e) {
            System.err.println("Lỗi lấy danh sách môn học: " + e.getMessage());
        }
        return list;
    }
    public MonHoc getMonHocById(int maMH) {
        MonHoc monHoc = null;
        String query = "SELECT * FROM NTDH_MON_HOC WHERE MaMH = ?";
        
        try (PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setInt(1, maMH);
            ResultSet rs = ps.executeQuery();
            
            if (rs.next()) {
                monHoc = new MonHoc(
                    rs.getInt("MaMH"),
                    rs.getString("TenMH"),
                    rs.getBoolean("TrangThai")
                );
            }
        } catch (SQLException e) {
            System.err.println("Lỗi lấy môn học: " + e.getMessage());
        }
        
        return monHoc;
    }


    // Thêm môn học
    public boolean addMonHoc(MonHoc monHoc) {
        String query = "INSERT INTO NTDH_MON_HOC (MaMH, TenMH, TrangThai) VALUES (?, ?, ?)";
        try (PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setInt(1, monHoc.getMaMH());
            ps.setString(2, monHoc.getTenMH());
            ps.setBoolean(3, monHoc.isTrangThai());
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            System.err.println("Lỗi thêm môn học: " + e.getMessage());
            return false;
        }
    }

    // Cập nhật môn học
    public boolean updateMonHoc(MonHoc monHoc) {
        String query = "UPDATE NTDH_MON_HOC SET TenMH = ?, TrangThai = ? WHERE MaMH = ?";
        try (PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setString(1, monHoc.getTenMH());
            ps.setBoolean(2, monHoc.isTrangThai());
            ps.setInt(3, monHoc.getMaMH());
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            System.err.println("Lỗi cập nhật môn học: " + e.getMessage());
            return false;
        }
    }

    // Xóa môn học
    public boolean deleteMonHoc(int maMH) {
        String query = "DELETE FROM NTDH_MON_HOC WHERE MaMH = ?";
        try (PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setInt(1, maMH);
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            System.err.println("Lỗi xóa môn học: " + e.getMessage());
            return false;
        }
    }
}
