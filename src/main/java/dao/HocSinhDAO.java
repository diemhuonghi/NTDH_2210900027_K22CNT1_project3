package dao;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import model.HocSinh;
import util.DBConnect;

public class HocSinhDAO {

	public List<HocSinh> getAllHocSinh() {
	    List<HocSinh> list = new ArrayList<>();
	    String query = "SELECT MaHS, HoTen, TaiKhoan, MatKhau, Email, TrangThai, NgayTao FROM NTDH_HOC_SINH";

	    try (Connection conn = DBConnect.getConnection();
	         PreparedStatement ps = conn.prepareStatement(query);
	         ResultSet rs = ps.executeQuery()) {

	        while (rs.next()) {
	            HocSinh hs = new HocSinh(
	                rs.getInt("MaHS"),
	                rs.getString("HoTen"),
	                rs.getString("TaiKhoan"),
	                rs.getString("MatKhau"),
	                rs.getString("Email"),
	                rs.getBoolean("TrangThai"),
	                rs.getTimestamp("NgayTao")
	            );
	            list.add(hs);
	        }
	    } catch (SQLException e) {
	        System.err.println("Lỗi khi lấy danh sách học sinh: " + e.getMessage());
	    }
	    return list;
	}


    public void addHocSinh(HocSinh hs) {
        String query = "INSERT INTO NTDH_HOC_SINH (HoTen, TaiKhoan, MatKhau, Email, TrangThai, NgayTao) VALUES (?, ?, ?, ?, ?, ?)";
        try (Connection conn = DBConnect.getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {

            ps.setString(1, hs.getHoTen());
            ps.setString(2, hs.getTaiKhoan());
            ps.setString(3, hs.getMatKhau());
            ps.setString(4, hs.getEmail());
            ps.setBoolean(5, hs.isTrangThai());
            ps.setTimestamp(6, hs.getNgayTao());
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void deleteHocSinh(int maHS) {
        String query = "DELETE FROM NTDH_HOC_SINH WHERE MaHS = ?";
        try (Connection conn = DBConnect.getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setInt(1, maHS);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
