package servlets;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import logica.Controladora;
import logica.Paciente;

@WebServlet(name = "SvPacientes", urlPatterns = {"/SvPacientes"})
public class SvPacientes extends HttpServlet {


    Controladora control = new Controladora();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        

        List<Paciente> listaPacientes = control.getPacientes();
        HttpSession misession = request.getSession();
        misession.setAttribute("listaPacientes", listaPacientes);
        
        response.sendRedirect("verPacientes.jsp");
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
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Date fechaNac = null;
        try {
            fechaNac = sdf.parse(fechaNacStr);
        } catch (ParseException e) {
            e.printStackTrace();
        }

  
        control.crearPaciente(dni, nombre, apellido, telefono, direccion, fechaNac, tieneOS);
        
 
        response.sendRedirect("altaPacientes.jsp?status=success");
    }
}