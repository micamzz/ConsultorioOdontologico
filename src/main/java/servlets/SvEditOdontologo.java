package servlets;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import logica.Controladora;
import logica.Especialidad;
import logica.Odontologo;


@WebServlet("/SvEditOdontologo")
public class SvEditOdontologo extends HttpServlet {
	private static final long serialVersionUID = 1L;
        
	Controladora control;

    @Override
    public void init() throws ServletException {
        control = new Controladora();
    }
 
    public SvEditOdontologo() {

    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int id = Integer.parseInt(request.getParameter("id"));
	    Odontologo odon = control.traerOdontologo(id);
	    
	    HttpSession misession = request.getSession();
	    misession.setAttribute("odontoEditar", odon); 
	    
	    response.sendRedirect("editarOdontologos.jsp");
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String dni = request.getParameter("dni");
	    String nombre = request.getParameter("nombre");
	    String apellido = request.getParameter("apellido");
	    String telefono = request.getParameter("telefono");
	    String direccion = request.getParameter("direccion");
	    String especialidadStr = request.getParameter("especialidad");
	    String fechaNacStr = request.getParameter("fechanac");
	    
	    Date fechaNac = null;
	    try {
	        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
	        fechaNac = format.parse(fechaNacStr);
	    } catch (Exception e) { e.printStackTrace(); }
	    
	    Especialidad especialidadEnum = Especialidad.valueOf(especialidadStr);

	    Odontologo odon = (Odontologo) request.getSession().getAttribute("odontoEditar");
	    
	    odon.setDni(dni);
	    odon.setNombre(nombre);
	    odon.setApellido(apellido);
	    odon.setTelefono(telefono);
	    odon.setDireccion(direccion);
	    odon.setFecha_nac(fechaNac);
	    odon.setTipoEspecialidad(especialidadEnum);
	    
	    control.editarOdontologo(odon);
	    
	    response.sendRedirect("SvOdontologos");
	}

}
