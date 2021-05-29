package domain;

public class Picture {
    private int id;
    private String date;
    private String bewrite;
    private String picturepath;
    private int comcount;
    private int likecount;
    private int uid;
    private String username;
    private boolean likeflag;
    private boolean favourflag;
    public boolean isFavourflag() {
        return favourflag;
    }

    public void setFavourflag(boolean favourflag) {
        this.favourflag = favourflag;
    }


    public void setLikeflag(boolean likeflag) {
        this.likeflag = likeflag;
    }

    public boolean isLikeflag() {
        return likeflag;
    }
    public void setUsername(String username) {
        this.username = username;
    }

    public String getUsername() {
        return username;
    }


    public void setId(int id) {
        this.id = id;
    }

    public void setDate(String date) {
        this.date = date;
    }


    public int getId() {
        return id;
    }

    public String getDate() {
        return date;
    }



    public void setBewrite(String bewrite) {
        this.bewrite = bewrite;
    }

    public void setPicturepath(String picturepath) {
        this.picturepath = picturepath;
    }

    public void setComcount(int comcount) {
        this.comcount = comcount;
    }

    public void setLikecount(int likecount) {
        this.likecount = likecount;
    }

    public void setUid(int uid) {
        this.uid = uid;
    }

    public String getBewrite() {
        return bewrite;
    }

    public String getPicturepath() {
        return picturepath;
    }

    public int getComcount() {
        return comcount;
    }

    public int getLikecount() {
        return likecount;
    }

    public int getUid() {
        return uid;
    }



    @Override
    public String toString() {
        return "Picture{" +
                "bewrite='" + bewrite + '\'' +
                ", picturepath='" + picturepath + '\'' +
                ", comcount=" + comcount +
                ", likecount=" + likecount +
                ", uid=" + uid +
                '}';
    }


}
