package model;

import java.util.Date;

public class BaiLam {
    private int id;
    private int hocSinhID;
    private int deThiID;
    private float diem;
    private Date thoiGianNop;

    public BaiLam() {}

    public BaiLam(int id, int hocSinhID, int deThiID, float diem, Date thoiGianNop) {
        this.id = id;
        this.hocSinhID = hocSinhID;
        this.deThiID = deThiID;
        this.diem = diem;
        this.thoiGianNop = thoiGianNop;
    }

    // GETTER - SETTER
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }
    public int getHocSinhID() { return hocSinhID; }
    public void setHocSinhID(int hocSinhID) { this.hocSinhID = hocSinhID; }
    public int getDeThiID() { return deThiID; }
    public void setDeThiID(int deThiID) { this.deThiID = deThiID; }
    public float getDiem() { return diem; }
    public void setDiem(float diem) { this.diem = diem; }
    public Date getThoiGianNop() { return thoiGianNop; }
    public void setThoiGianNop(Date thoiGianNop) { this.thoiGianNop = thoiGianNop; }
}
