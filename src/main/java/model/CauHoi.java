package model;

public class CauHoi {
    private int maCauHoi;
    private String noiDung;
    private int maDe;
    private int doKho;

    public CauHoi() {}

    public CauHoi(int maCauHoi, String noiDung, int maDe, int doKho) {
        this.maCauHoi = maCauHoi;
        this.noiDung = noiDung;
        this.maDe = maDe;
        this.doKho = doKho;
    }

    public int getMaCauHoi() {
        return maCauHoi;
    }

    public void setMaCauHoi(int maCauHoi) {
        this.maCauHoi = maCauHoi;
    }

    public String getNoiDung() {
        return noiDung;
    }

    public void setNoiDung(String noiDung) {
        this.noiDung = noiDung;
    }

    public int getMaDe() {
        return maDe;
    }

    public void setMaDe(int maDe) {
        this.maDe = maDe;
    }

    public int getDoKho() {
        return doKho;
    }

    public void setDoKho(int doKho) {
        this.doKho = doKho;
    }
}
