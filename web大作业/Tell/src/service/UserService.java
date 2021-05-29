package service;

import domain.Comment;
import domain.Picture;
import domain.User;

import java.util.List;

public interface UserService {
    void regist(User user);
    boolean find(String name);

    User login(User user);

    List<Picture> findpersonpic(int uid);

    void addPicture(Picture picture);

    List<Picture> findallpic();

    void deletepic(String id);

    boolean islike(int id, int uid);

    int likecount(int id);

    int comcount(int id);

    int addlike(String pid, int uid);

    int dellike(String pid, int uid);

    boolean isfavour(int id, int uid);

    void addfavour(String pid, int uid);

    void delfavour(String pid, int uid);

    List<Picture> findfavourpic(int uid);

    Picture findpic(String pid);

    List<Comment> findcomment(String pid);

    void addcomment(Comment comment);

    void delcommen(String id,String pid);

    void updatepassword(String password,int uid);
}
