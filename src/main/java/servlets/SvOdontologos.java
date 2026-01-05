package servlets;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.text.SimpleDateFormat;
import java.util.Date;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import logica.Controladora;
import logica.*;


@WebServlet(name = "SvOdontologos", urlPatterns = {"/SvOdontologos"})
public class SvOdontologos extends HttpServlet {
	
    Controladora control = new Controladora();
    
	@Override
    public void init() throws ServletException {
        control = new Controladora();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
        String dni = request.getParameter("dni");
        String nombre = request.getParameter("nombre");
        String apellido = request.getParameter("apellido");
        String telefono = request.getParameter("telefono");
        String direccion = request.getParameter("direccion");

     // --- PROCESAMIENTO DE FECHA ---
        String fechaNacStr = request.getParameter("fechanac");
        Date fechaNac = null;
        try {          
            SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
            fechaNac = format.parse(fechaNacStr);
        } catch (Exception e) {
            e.printStackTrace(); 

        }
        // --- PROCESAMIENTO DE ENUM ---
        String especialidadStr = request.getParameter("especialidad");
        Especialidad especialidad = Especialidad.valueOf(especialidadStr);

        control.crearOdontologo(dni, nombre, apellido, telefono, direccion, fechaNac, especialidad);
        
        response.sendRedirect("altaOdontologo.jsp?status=success");
        
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
        List<Odontologo> listaOdontos = control.getOdontologos();
        

    	/* Guarda la lista como un atributo de sesión */
    	HttpSession  misession = request.getSession();
    	misession.setAttribute("listaOdontologos", listaOdontos);
    	
    	response.sendRedirect("verOdontologos.jsp");
    
    }
}
