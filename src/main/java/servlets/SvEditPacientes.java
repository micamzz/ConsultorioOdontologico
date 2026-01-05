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
import logica.Paciente; 

@WebServlet(name = "SvEditPacientes", urlPatterns = {"/SvEditPacientes"})
public class SvEditPacientes extends HttpServlet {
    
    Controladora control = new Controladora();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
      
        int id = Integer.parseInt(request.getParameter("id"));
        Paciente pac = control.traerPaciente(id);
        
        HttpSession misession = request.getSession();
        misession.setAttribute("pacienteEditar", pac); 
        
        response.sendRedirect("editarPacientes.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
      
        String dni = request.getParameter("dni");
        String nombre = request.getParameter("nombre");
        String apellido = request.getParameter("apellido");
        String telefono = request.getParameter("telefono");
        String direccion = request.getParameter("direccion");
        String fechaNacStr = request.getParameter("fechanac");
        boolean tieneOS = Boolean.parseBoolean(request.getParameter("tiene_OS"));
        
        // Conversión de fecha
        Date fechaNac = null;
        try {
            SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
            fechaNac = format.parse(fechaNacStr);
        } catch (Exception e) { e.printStackTrace(); }

      
        Paciente pac = (Paciente) request.getSession().getAttribute("pacienteEditar");
        
        pac.setDni(dni);
        pac.setNombre(nombre);
        pac.setApellido(apellido);
        pac.setTelefono(telefono);
        pac.setDireccion(direccion);
        pac.setFecha_nac(fechaNac);
        pac.setTiene_OS(tieneOS);
        
        control.editarPaciente(pac);
        
        // Redirigir al servlet que recarga la lista
        response.sendRedirect("SvPacientes");
    }
}