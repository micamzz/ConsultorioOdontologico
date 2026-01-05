package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import logica.Controladora;


@WebServlet(name = "SvElimOdontologo", urlPatterns = {"/SvElimOdontologo"})
public class SvElimOdontologo extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	Controladora control;

	
	@Override
    public void init() throws ServletException {
        control = new Controladora();
    }
	
  
    public SvElimOdontologo() {
    
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}


	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		if (control == null) { 
    		control = new Controladora();
    }
    	
		int id = Integer.parseInt(request.getParameter("id"));
		
		boolean eliminado = control.borrarOdontologo(id);

	    if (eliminado) {
	        response.sendRedirect("verOdontologos.jsp?status=deleted");
	    } else {
	       
	        response.sendRedirect("verOdontologos.jsp?error=con_turnos");
	    }
	}
		
	}


