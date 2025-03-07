package model;

public class BaiLamChiTiet {
    private int maChiTiet;
    private int maBaiLam;
    private int maCauHoi;
    private int maDapAn;
    private boolean isCorrect;

    public BaiLamChiTiet(int maChiTiet, int maBaiLam, int maCauHoi, int maDapAn, boolean isCorrect) {
        this.maChiTiet = maChiTiet;
        this.maBaiLam = maBaiLam;
        this.maCauHoi = maCauHoi;
        this.maDapAn = maDapAn;
        this.isCorrect = isCorrect;
    }

    public int getMaChiTiet() { return maChiTiet; }
    public void setMaChiTiet(int maChiTiet) { this.maChiTiet = maChiTiet; }

    public int getMaBaiLam() { return maBaiLam; }
    public void setMaBaiLam(int maBaiLam) { this.maBaiLam = maBaiLam; }

    public int getMaCauHoi() { return maCauHoi; }
    public void setMaCauHoi(int maCauHoi) { this.maCauHoi = maCauHoi; }

    public int getMaDapAn() { return maDapAn; }
    public void setMaDapAn(int maDapAn) { this.maDapAn = maDapAn; }

    public boolean isCorrect() { return isCorrect; }
    public void setCorrect(boolean correct) { isCorrect = correct; }
}
