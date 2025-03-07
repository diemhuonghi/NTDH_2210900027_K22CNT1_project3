package model;

public class DapAn {
    private int maDA;
    private int maCH; 
    private String noiDung;
    private boolean laDapAnDung; 

    public DapAn(int maDA, int maCH, String noiDung, boolean laDapAnDung) {
        this.maDA = maDA;
        this.maCH = maCH;
        this.noiDung = noiDung;
        this.laDapAnDung = laDapAnDung;
    }

    public int getMaDA() { return maDA; }
    public void setMaDA(int maDA) { this.maDA = maDA; }

    public int getMaCH() { return maCH; }
    public void setMaCH(int maCH) { this.maCH = maCH; }

    public String getNoiDung() { return noiDung; }
    public void setNoiDung(String noiDung) { this.noiDung = noiDung; }

    public boolean isLaDapAnDung() { return laDapAnDung; }
    public void setLaDapAnDung(boolean laDapAnDung) { this.laDapAnDung = laDapAnDung; }
}
