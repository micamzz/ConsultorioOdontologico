package servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import logica.Controladora;
import logica.Odontologo;
import logica.Paciente;


@WebServlet("/SvTurnos")
public class SvTurnos extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
	Controladora control;

    public SvTurnos() {
    }

	@Override
    public void init() throws ServletException {
        control = new Controladora();
    }
	

		protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		    
			List<Odontologo> listaOdontos = control.getOdontologos();
		    List<Paciente> listaPacientes = control.getPacientes();
		    List<logica.Turno> listaTurnos = control.getTurnos(); 
		   
		    
		    HttpSession misession = request.getSession();
		    misession.setAttribute("listaOdontos", listaOdontos);
		    misession.setAttribute("listaPacientes", listaPacientes);
		    misession.setAttribute("listaTurnos", listaTurnos);
		    
		    String accion = request.getParameter("accion");
		    
		    if (accion != null && accion.equals("ver")) {
		        response.sendRedirect("verTurnos.jsp");
		    } else {
		        /* Captura de todos los datos que vienen del doPost tras el error */
		        String error = request.getParameter("error");
		        if (error != null) {
		            String f = request.getParameter("f");
		            String h = request.getParameter("h");
		            String ido = request.getParameter("ido");
		            String idp = request.getParameter("idp");
		            String af = request.getParameter("af");

		            /* Redirigir con la cadena completa de datos para que el JSP los lea */
		            response.sendRedirect("altaTurnos.jsp?error=" + error + 
		                                  "&f=" + f + "&h=" + h + 
		                                  "&ido=" + ido + "&idp=" + idp + "&af=" + af);
		        } else {
		            response.sendRedirect("altaTurnos.jsp");
		        }
		    }
		}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	  
	    String fechaTurnoStr = request.getParameter("fecha_turno");
	    String horaTurno = request.getParameter("hora_turno");
	    String afeccion = request.getParameter("afeccion");
	    
	    int idOdonto = Integer.parseInt(request.getParameter("id_odonto"));
	    int idPaciente = Integer.parseInt(request.getParameter("id_paciente"));
	    
	    // Conversión de fecha (String a Date)
	    java.util.Date fechaTurno = null;
	    try {
	        java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd");
	        fechaTurno = sdf.parse(fechaTurnoStr);
	    } catch (java.text.ParseException e) {
	        e.printStackTrace();
	    }


	    String resultado = control.validarTurnoDetallado(fechaTurno, horaTurno, idOdonto, idPaciente);

	    if (resultado.equals("ok")) {
	        control.crearTurno(fechaTurno, horaTurno, afeccion, idOdonto, idPaciente);
	        response.sendRedirect("SvTurnos?accion=ver");
	    } else {
	        response.sendRedirect("SvTurnos?error=" + resultado + 
	            "&f=" + fechaTurnoStr + 
	            "&h=" + horaTurno + 
	            "&af=" + java.net.URLEncoder.encode(afeccion, "UTF-8") +
	            "&ido=" + idOdonto + 
	            "&idp=" + idPaciente);
	    }
	}
	
	
}
