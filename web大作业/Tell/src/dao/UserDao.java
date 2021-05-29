package dao;

import domain.*;

import java.util.List;

public interface UserDao {
    boolean find(String name);

    void regist(User user);

    User login(String username, String password);

    List<Picture> findpersonpic(int uid);

    void addPicture(Picture picture);

    List<Picture> findallpic();

    void deletepic(int parseInt);

    Like islike(int parseInt, int uid);

    int likecount(int id);

    int comcount(int id);

    int addlike(int parseInt, int uid);

    int dellike(int parseInt, int uid);

    Favour isfavour(int id, int uid);

    void addfavour(int parseInt, int uid);

    void delfavour(int parseInt, int uid);

    List<Picture> findfavourpic(int uid);

    Picture findpic(int parseInt);

    List<Comment> findcomment(int parseInt);

    void addcomment(Comment comment);

    void delcommen(int id,int pid);

    void updatepassword(String password,int uid);
}
