package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import logica.Controladora;

@WebServlet(name = "SvLogin", urlPatterns = {"/SvLogin"})
public class SvLogin extends HttpServlet {

    
    Controladora control = new Controladora();

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
    
        String usuario = request.getParameter("usuario");
        String contra = request.getParameter("contrasenia");
      
        boolean validacion = control.validarIngreso(usuario, contra);

        if (validacion) {            
            HttpSession misession = request.getSession(true);
            misession.setAttribute("usuario", usuario);
            
            response.sendRedirect("index.jsp");
        } else {
            response.sendRedirect("login.jsp?error=1");
        }
    }

    @Override
    public String getServletInfo() {
        return "Servlet para la autenticación de usuarios";
    }
}