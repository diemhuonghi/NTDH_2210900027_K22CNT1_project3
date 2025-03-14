package model;

import java.util.Date;

public class DeThi {
    private int id;
    private String tieuDe;
    private String moTa;
    private int thoiGianThi;
    private Date ngayTao;
    private int giaoVienID;
    private int monHocID;

    public DeThi() {}

    public DeThi(int id, String tieuDe, String moTa, int thoiGianThi, Date ngayTao, int giaoVienID, int monHocID) {
        this.id = id;
        this.tieuDe = tieuDe;
        this.moTa = moTa;
        this.thoiGianThi = thoiGianThi;
        this.ngayTao = ngayTao;
        this.giaoVienID = giaoVienID;
        this.monHocID = monHocID;
    }

    // GETTER - SETTER
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }
    public String getTieuDe() { return tieuDe; }
    public void setTieuDe(String tieuDe) { this.tieuDe = tieuDe; }
    public String getMoTa() { return moTa; }
    public void setMoTa(String moTa) { this.moTa = moTa; }
    public int getThoiGianThi() { return thoiGianThi; }
    public void setThoiGianThi(int thoiGianThi) { this.thoiGianThi = thoiGianThi; }
    public Date getNgayTao() { return ngayTao; }
    public void setNgayTao(Date ngayTao) { this.ngayTao = ngayTao; }
    public int getGiaoVienID() { return giaoVienID; }
    public void setGiaoVienID(int giaoVienID) { this.giaoVienID = giaoVienID; }
    public int getMonHocID() { return monHocID; }
    public void setMonHocID(int monHocID) { this.monHocID = monHocID; }
}
