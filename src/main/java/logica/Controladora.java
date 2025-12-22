package logica;

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
	
}
