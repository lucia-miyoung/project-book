package common.security;

import java.util.List;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

public class MemberLoginSuccessHandler implements AuthenticationSuccessHandler{

	@Override
	public void onAuthenticationSuccess(HttpServletRequest req, HttpServletResponse res,
			Authentication authentication) throws IOException, ServletException {
		// TODO Auto-generated method stub
		
			List<String> roleNames = new ArrayList<String>();
			
		authentication.getAuthorities().forEach(authority -> {
			roleNames.add(authority.getAuthority());
		});
		
		System.out.println("Role names: " + roleNames);
		
		if(roleNames.contains("ROLE_ADMIN")) {
			res.sendRedirect("");
			return;
		}
		if(roleNames.contains("ROLE_MEMBER")) {
			res.sendRedirect("/main/main");
			return;
		}
		res.sendRedirect("/login/signin");
		
		
	}

}
