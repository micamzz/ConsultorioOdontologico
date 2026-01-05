package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import logica.Controladora;
import logica.Rol;
import logica.Usuario;


@WebServlet("/SvEditUsuarios")
public class SvEditUsuarios extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    Controladora control = new Controladora ();
    
    public SvEditUsuarios() {

    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
         
		  int id = Integer.parseInt(request.getParameter ("id"));
	         Usuario usu = control.traerUsuario(id);
	         
	         HttpSession misession = request.getSession();
	         misession.setAttribute("usuEditar", usu);

	         response.sendRedirect("editarUsuarios.jsp");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       
		    String nombreUsu = request.getParameter("nombreUsu");
		    String contrasenia = request.getParameter("contrasenia");
		    String rolStr = request.getParameter("rol");
		    
		    /*Conversión de String a Enum */
		    Rol rolEnum = Rol.valueOf(rolStr);
		    
		    Usuario usu = (Usuario) request.getSession().getAttribute("usuEditar");
		    usu.setNombreUsuario(nombreUsu);
		    usu.setContrasenia(contrasenia);
		    usu.setRol(rolEnum); 
		    
		    control.editarUsuario(usu);
		    
		    response.sendRedirect("SvUsuarios");
	        
	}

}
