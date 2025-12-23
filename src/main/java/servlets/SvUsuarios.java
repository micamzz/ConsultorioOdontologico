package servlets;

import java.util.List;
import java.io.IOException;
import java.util.ArrayList;
import logica.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet(name = "SvUsuarios", urlPatterns = {"/SvUsuarios"}) 
public class SvUsuarios extends HttpServlet { 
	private static final long serialVersionUID = 1L;
	
	Controladora control;

	
	@Override
    public void init() throws ServletException {
        control = new Controladora();
    }
	
	
	protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
     
    	List <Usuario> listaUsuarios = new ArrayList <Usuario>();
    	
    	listaUsuarios = control.getUsuarios();
    	
    	/* Guarda la lista como un atributo de sesión
    	 */
    	HttpSession  misession = request.getSession();
    	misession.setAttribute("listaUsuarios", listaUsuarios);
    	
    	response.sendRedirect("verUsuarios.jsp");
    	
    	System.out.println("usuario :" + listaUsuarios.getFirst());
    	

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	
    	if (control == null) { 
    		control = new Controladora();
    		}
    	
    	String nombreUsu = request.getParameter("nombreUsu");
    	String contra = request.getParameter("contrasenia");
    	String rol = request.getParameter("rol");
    	
        control.crearUsuario(nombreUsu, contra, rol);
    	
    	response.sendRedirect("index.jsp");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}