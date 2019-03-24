package org.yolo.holo.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.yolo.holo.vo.Dounor;
@WebFilter(value= {
      "/hlog/register",
      "/user"
})
public class LoginCheckFilter implements Filter {

   @Override
   public void destroy() {
      
   }

   @Override
   public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
         throws IOException, ServletException {
      
      HttpSession session = ((HttpServletRequest)request).getSession();
      Dounor loginDounor =  (Dounor)session.getAttribute("loginDounor");
      
      if(loginDounor==null) {
         ((HttpServletResponse)response).sendRedirect("/index");
      }else {
         chain.doFilter(request, response);
      }//if~else end
      
   }

   @Override
   public void init(FilterConfig filterConfig) throws ServletException {
      System.out.println("LoginCheckFilter init");
   }

}