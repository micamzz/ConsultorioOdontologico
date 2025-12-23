package logica;

import java.util.ArrayList;
import java.util.List;

import persistencia.ControladoraPersistencia;

public class Controladora {

	// Instancia de la controladora de Persistencia
	ControladoraPersistencia controlPersis = new ControladoraPersistencia();
	
	
	public Controladora() {
		
	}
	
	// Metodos Usuarios
	
	public void crearUsuario( String nombreUsuario, String contrasenia, String rol) {
		
		Usuario usu = new Usuario();
		usu.setNombreUsuario(nombreUsuario);
		usu.setContrasenia(contrasenia);
		usu.setRol(rol);
		controlPersis.crearUsuario(usu);
		
	}



	public List<Usuario> getUsuarios() {
	
		return controlPersis.getUsuarios();
	}

	public Usuario traerUsuario(int id) {
	    return controlPersis.traerUsuario(id);
	}

	public void borrarUsuario(int id) {
	    try {

	        Usuario usu = controlPersis.traerUsuario(id); 
	        if (usu != null) {
	            controlPersis.borrarUsuario(id);
	        }
	    } catch (Exception e) {
	        System.out.println("Error al borrar: " + e.getMessage());
	    }
	}

	public void editarUsuario(Usuario usu) {
		controlPersis.editarUsuario(usu);
		
	}
}
