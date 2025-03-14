package dao;

import model.BaiLamChiTiet;
import util.DBConnect;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class BaiLamChiTietDAO {
    
    public List<BaiLamChiTiet> getAllBaiLamChiTiet() {
        List<BaiLamChiTiet> list = new ArrayList<>();
        String query = "SELECT * FROM NTDH_BAI_LAM_CHI_TIET";
        
        try (Connection conn = DBConnect.getConnection();
             PreparedStatement ps = conn.prepareStatement(query);
             ResultSet rs = ps.executeQuery()) {
            
            while (rs.next()) {
                BaiLamChiTiet blct = new BaiLamChiTiet(
                    rs.getInt("id"),
                    rs.getInt("BaiLamID"),
                    rs.getInt("CauHoiID"),
                    rs.getInt("DapAnID")
                );
                list.add(blct);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
    public BaiLamChiTiet getBaiLamChiTietById(int id) {
        String query = "SELECT * FROM NTDH_BAI_LAM_CHI_TIET WHERE id = ?";
        
        try (Connection conn = DBConnect.getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {
            
            ps.setInt(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return new BaiLamChiTiet(
                        rs.getInt("id"),
                        rs.getInt("BaiLamID"),
                        rs.getInt("CauHoiID"),
                        rs.getInt("DapAnID")
                    );
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public void updateBaiLamChiTiet(BaiLamChiTiet blct) {
        String query = "UPDATE NTDH_BAI_LAM_CHI_TIET SET BaiLamID = ?, CauHoiID = ?, DapAnID = ? WHERE id = ?";
        
        try (Connection conn = DBConnect.getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {
            
            ps.setInt(1, blct.getBaiLamID());
            ps.setInt(2, blct.getCauHoiID());
            ps.setInt(3, blct.getDapAnID());
            ps.setInt(4, blct.getId());
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    public void deleteBaiLamChiTiet(int id) {
        String query = "DELETE FROM NTDH_BAI_LAM_CHI_TIET WHERE id = ?";
        
        try (Connection conn = DBConnect.getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {
            
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
   
    public void addBaiLamChiTiet(BaiLamChiTiet blct) {
        String query = "INSERT INTO NTDH_BAI_LAM_CHI_TIET (BaiLamID, CauHoiID, DapAnID) VALUES (?, ?, ?)";
        
        try (Connection conn = DBConnect.getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {
            
            ps.setInt(1, blct.getBaiLamID());
            ps.setInt(2, blct.getCauHoiID());
            ps.setInt(3, blct.getDapAnID());
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
