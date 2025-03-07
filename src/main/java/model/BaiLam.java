package model;


import java.sql.Timestamp;

public class BaiLam {
    private int maBaiLam;
    private int maHS;
    private int maDe;
    private Timestamp thoiGianNop;
    private float diem;

    public BaiLam(int maBaiLam, int maHS, int maDe, Timestamp thoiGianNop, float diem) {
        this.maBaiLam = maBaiLam;
        this.maHS = maHS;
        this.maDe = maDe;
        this.thoiGianNop = thoiGianNop;
        this.diem = diem;
    }

    public int getMaBaiLam() { return maBaiLam; }
    public void setMaBaiLam(int maBaiLam) { this.maBaiLam = maBaiLam; }

    public int getMaHS() { return maHS; }
    public void setMaHS(int maHS) { this.maHS = maHS; }

    public int getMaDe() { return maDe; }
    public void setMaDe(int maDe) { this.maDe = maDe; }

    public Timestamp getThoiGianNop() { return thoiGianNop; }
    public void setThoiGianNop(Timestamp thoiGianNop) { this.thoiGianNop = thoiGianNop; }

    public float getDiem() { return diem; }
    public void setDiem(float diem) { this.diem = diem; }
}
