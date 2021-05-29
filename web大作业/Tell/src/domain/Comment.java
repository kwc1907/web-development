package domain;

public class Comment {
    private int id;
    private int pid;
    private int uid;
    private String comment;
    private String date;
    private String username;
    public int getId() {
        return id;
    }

    public int getPid() {
        return pid;
    }

    public int getUid() {
        return uid;
    }

    public String getComment() {
        return comment;
    }

    public String getDate() {
        return date;
    }

    public String getUsername() {
        return username;
    }



    public void setId(int id) {
        this.id = id;
    }

    public void setPid(int pid) {
        this.pid = pid;
    }

    public void setUid(int uid) {
        this.uid = uid;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    @Override
    public String toString() {
        return "Comment{" +
                "id=" + id +
                ", pid=" + pid +
                ", uid=" + uid +
                ", comment='" + comment + '\'' +
                ", date='" + date + '\'' +
                ", username='" + username + '\'' +
                '}';
    }


}
