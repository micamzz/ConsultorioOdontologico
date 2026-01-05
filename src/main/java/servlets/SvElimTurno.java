package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import logica.Controladora;

@WebServlet(name = "SvElimTurno", urlPatterns = {"/SvElimTurno"})
public class SvElimTurno extends HttpServlet {
    
    Controladora control = new Controladora(); 

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    
        int id_eliminar = Integer.parseInt(request.getParameter("id"));
        
  
        control.borrarTurno(id_eliminar);
        
        response.sendRedirect("SvTurnos?accion=ver");
    }
}