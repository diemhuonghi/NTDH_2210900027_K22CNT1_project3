package dao;

import model.DeThi;
import util.DBConnect;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class DeThiDAO {
    
    // Lấy tất cả đề thi
    public List<DeThi> getAllDeThi() {
        List<DeThi> list = new ArrayList<>();
        String query = "SELECT * FROM NTDH_DE_THI";
        
        try (Connection conn = DBConnect.getConnection();
             PreparedStatement ps = conn.prepareStatement(query);
             ResultSet rs = ps.executeQuery()) {
            
            while (rs.next()) {
                DeThi dt = new DeThi(
                    rs.getInt("id"),
                    rs.getString("TieuDe"),
                    rs.getString("MoTa"),
                    rs.getInt("ThoiGianThi"),
                    rs.getTimestamp("NgayTao"),
                    rs.getInt("GiaoVienID"),
                    rs.getInt("MonHocID")
                );
                list.add(dt);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    // Thêm đề thi
    public void addDeThi(DeThi dt) {
        String query = "INSERT INTO NTDH_DE_THI (TieuDe, MoTa, ThoiGianThi, GiaoVienID, MonHocID) VALUES (?, ?, ?, ?, ?)";
        
        try (Connection conn = DBConnect.getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {
            
            ps.setString(1, dt.getTieuDe());
            ps.setString(2, dt.getMoTa());
            ps.setInt(3, dt.getThoiGianThi());
            ps.setInt(4, dt.getGiaoVienID());
            ps.setInt(5, dt.getMonHocID());
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // Cập nhật đề thi
    public void updateDeThi(DeThi dt) {
        String query = "UPDATE NTDH_DE_THI SET TieuDe = ?, MoTa = ?, ThoiGianThi = ?, GiaoVienID = ?, MonHocID = ? WHERE id = ?";
        
        try (Connection conn = DBConnect.getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {
            
            ps.setString(1, dt.getTieuDe());
            ps.setString(2, dt.getMoTa());
            ps.setInt(3, dt.getThoiGianThi());
            ps.setInt(4, dt.getGiaoVienID());
            ps.setInt(5, dt.getMonHocID());
            ps.setInt(6, dt.getId());
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    public DeThi getDeThiById(int id) {
        DeThi deThi = null;
        String sql = "SELECT * FROM NTDH_DE_THI WHERE id = ?";
        
        try (Connection conn = DBConnect.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            
            if (rs.next()) {
                deThi = new DeThi();
                deThi.setId(rs.getInt("id"));
                deThi.setTieuDe(rs.getString("tieu_de"));
                deThi.setMoTa(rs.getString("mo_ta"));
                deThi.setThoiGianThi(rs.getInt("thoi_gian_thi"));
                deThi.setGiaoVienID(rs.getInt("giao_vien_id"));
                deThi.setMonHocID(rs.getInt("mon_hoc_id"));
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Kiểm tra nếu có lỗi SQL
        }
        return deThi; // Nếu không tìm thấy, sẽ trả về null
    }

    // Xóa đề thi
    public void deleteDeThi(int id) {
        String query = "DELETE FROM NTDH_DE_THI WHERE id = ?";
        
        try (Connection conn = DBConnect.getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {
            
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
