package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import logica.Controladora;

@WebServlet(name = "SvUsuarios", urlPatterns = {"/SvUsuarios"}) 
public class SvUsuarios extends HttpServlet { 
	
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