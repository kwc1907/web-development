package filter;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * 解决全站乱码问题，处理所有的请求
 */
@WebFilter("/*")
public class Filter1 implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest req, ServletResponse rep, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest request=(HttpServletRequest)req;
        String uri=request.getRequestURI();
        if(uri.contains("first.jsp")||uri.contains("/findServlet")||uri.contains("/foot.html")||uri.contains("/checkCode")||uri.contains("/registerUserServlet")||uri.contains("/loginServlet")||uri.contains("/index1.html")||uri.contains("login.jsp") || uri.contains("/register.html")||uri.contains("/css/")||uri.contains("/js/")|| uri.contains("/img/")||uri.contains("/fonts/"))
        {
            chain.doFilter(req,rep);
        }else
        {
            Object user=request.getSession().getAttribute("user");
            if(user!=null)
            {
                chain.doFilter(req,rep);
            }
            else{
                request.setAttribute("tishi","您尚未登录，请登录");
                request.getRequestDispatcher("/login.jsp").forward(request,rep);
            }
        }
    }

    @Override
    public void destroy() {

    }
}
