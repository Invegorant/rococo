package guru.qa.rococo.service.cors;

import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.security.web.csrf.CsrfToken;
import org.springframework.web.filter.OncePerRequestFilter;

import java.io.IOException;

/**
 * We need to set XSRF-TOKEN by ourselves.
 * You can take a look at recommended way to deal with it by go to a link.
 * <a href="https://github.com/spring-projects/spring-security/issues/12141#issuecomment-1321345077">
 */
public class CookieCsrfFilter extends OncePerRequestFilter {

    @Override
    protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response,
                                    FilterChain filterChain) throws ServletException, IOException {
        CsrfToken csrfToken = (CsrfToken) request.getAttribute(CsrfToken.class.getName());
        response.setHeader(csrfToken.getHeaderName(), csrfToken.getToken());
        filterChain.doFilter(request, response);
    }
}
