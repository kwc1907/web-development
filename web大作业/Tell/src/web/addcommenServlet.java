package web;

import com.fasterxml.jackson.databind.ObjectMapper;
import domain.Comment;
import domain.User;
import org.apache.commons.beanutils.BeanUtils;
import service.UserService;
import service.impl.UserServiceimpl;

import javax.servlet.GenericServlet;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.BufferedReader;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Enumeration;
import java.util.List;
import java.util.Map;

@WebServlet("/addcommenServlet")
public class addcommenServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String pid=request.getParameter("pid");
        User user=(User)request.getSession().getAttribute("user");
        int uid=user.getId();
        String com=request.getParameter("content");
        Comment comment=new Comment();
        comment.setPid(Integer.parseInt(pid));
        comment.setUid(uid);
        comment.setComment(com);
        comment.setUsername(user.getUsername());
        Date date1 = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String date= sdf.format(date1);
        comment.setDate(date);
        UserService service=new UserServiceimpl();
        service.addcomment(comment);
    }

    @Override
    protected void doPost (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doGet(request, response);
    }
}
