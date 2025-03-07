package model;
import java.sql.Timestamp;

public class HocSinh {
    private int maHS;
    private String hoTen;
    private String taiKhoan;
    private String matKhau;
    private String email;
    private boolean trangThai;
    private Timestamp ngayTao;

    public HocSinh() {}

    public HocSinh(int maHS, String hoTen, String taiKhoan, String matKhau, String email, boolean trangThai, Timestamp ngayTao) {
        this.maHS = maHS;
        this.hoTen = hoTen;
        this.taiKhoan = taiKhoan;
        this.matKhau = matKhau;
        this.email = email;
        this.trangThai = trangThai;
        this.ngayTao = ngayTao;
    }

    // Getter và Setter
    public int getMaHS() { return maHS; }
    public void setMaHS(int maHS) { this.maHS = maHS; }

    public String getHoTen() { return hoTen; }
    public void setHoTen(String hoTen) { this.hoTen = hoTen; }

    public String getTaiKhoan() { return taiKhoan; }
    public void setTaiKhoan(String taiKhoan) { this.taiKhoan = taiKhoan; }

    public String getMatKhau() { return matKhau; }
    public void setMatKhau(String matKhau) { this.matKhau = matKhau; }

    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }

    public boolean isTrangThai() { return trangThai; }
    public void setTrangThai(boolean trangThai) { this.trangThai = trangThai; }

    public Timestamp getNgayTao() { return ngayTao; }
    public void setNgayTao(Timestamp ngayTao) { this.ngayTao = ngayTao; }
}
