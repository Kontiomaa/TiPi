package tipi.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.SessionAttributes;

@WebFilter({"/admin/*", "/user/*"})
@SessionAttributes("userProfile")
public class UserFilter implements Filter {

    @Override
    public void init(FilterConfig config) throws ServletException {
        // If you have any <init-param> in web.xml, then you could get them
        // here by config.getInitParameter("name") and assign it as field.
    }

    @Override
    public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest hsreq = (HttpServletRequest) req;
        HttpSession session = hsreq.getSession();
        if(SecurityContextHolder.getContext()
				.getAuthentication().getName() != "anonymousUser") {
        	if(session.getAttribute("userProfile") == null) {
        		SecurityContextHolder.clearContext();
        	}
        }
        chain.doFilter(req, res);
    }

    @Override
    public void destroy() {
        // If you have assigned any expensive resources as field of
        // this Filter class, then you could clean/close them here.
    }

}