package web;

import com.fasterxml.jackson.databind.ObjectMapper;
import domain.User;
import org.apache.commons.beanutils.BeanUtils;
import service.UserService;
import service.impl.UserServiceimpl;
import util.DownLoadUtils;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Enumeration;
import java.util.List;
import java.util.Map;

@WebServlet("/downServlet")
public class downServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse resp) throws ServletException, IOException {
        String filename1=request.getParameter("filename");
        int t=filename1.indexOf("/");
        String filename=filename1.substring(t+1);
        ServletContext a=this.getServletContext();
        String path=a.getRealPath("/imgs/"+filename);
        FileInputStream f=new FileInputStream(path);
        String type=a.getMimeType(filename);
        resp.setHeader("content-type",type);
        String agent = request.getHeader("user-agent");
        //2.使用工具类方法编码文件名即可
        filename = DownLoadUtils.getFileName(agent, filename);
        resp.setHeader("content-disposition","attachment;filename="+filename);
        ServletOutputStream sos=resp.getOutputStream();
        byte[] buff=new byte[1024*50];
        int len=0;
        while((len=f.read(buff))!=-1)
        {
            sos.write(buff,0,len);
        }
        f.close();
        //resp.sendRedirect(request.getContextPath()+"/showAllPicServlet");
    }

    @Override
    protected void doPost (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doGet(request, response);
    }
}
