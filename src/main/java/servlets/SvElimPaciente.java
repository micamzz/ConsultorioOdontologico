package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import logica.Controladora;


@WebServlet("/SvElimPaciente")
public class SvElimPaciente extends HttpServlet {
	private static final long serialVersionUID = 1L;

	Controladora control;

	@Override
    public void init() throws ServletException {
        control = new Controladora();
    }
	
    public SvElimPaciente() {

    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
              int id_eliminar = Integer.parseInt(request.getParameter("id"));

	        boolean eliminado = control.borrarPaciente(id_eliminar);

	        if (eliminado) {
	        	response.sendRedirect("verPacientes.jsp?status=deleted");
	        } else {
	          
	            response.sendRedirect("verPacientes.jsp?error=con_turnos");
	        }
	    }
	}


