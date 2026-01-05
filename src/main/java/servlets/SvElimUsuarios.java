package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import logica.Controladora;


@WebServlet(name = "SvElimUsuarios", urlPatterns = {"/SvElimUsuarios"}) 

public class SvElimUsuarios extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	Controladora control;

	
	@Override
    public void init() throws ServletException {
        control = new Controladora();
    }
	
  
    public SvElimUsuarios() {
        super();
    
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}


	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
		
		if (control == null) { 
    		control = new Controladora();
    }
    	
		int id = Integer.parseInt(request.getParameter("id"));
		
		control.borrarUsuario(id);
		
		response.sendRedirect("SvUsuarios");
		
	}

}
