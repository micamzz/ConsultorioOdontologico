package logica;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import persistencia.ControladoraPersistencia;

public class Controladora {

	// Instancia de la controladora de Persistencia
	ControladoraPersistencia controlPersis = new ControladoraPersistencia();
	
	
	public Controladora() {
		
	}
	
	// USUARIOS - CRUD 
	
	public void crearUsuario( String nombreUsuario, String contrasenia, Rol rol) {
		
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

	public Boolean validarIngreso(String usuario, String contrasenia) {

		List <Usuario> listaUsuarios = controlPersis.getUsuarios();
	
	
		
		for (Usuario usu : listaUsuarios) {
			if(usu.getNombreUsuario().equals(usuario) && (usu.getContrasenia().equals(contrasenia))) {
				return true;
				}
			}
           return false;
	}

	
	// ODONTOLOGOS - CRUD 
	public void crearOdontologo(String dni, String nombre, String apellido, String telefono, String direccion,
			Date fechaNac, Especialidad especialidad) {
		
		Odontologo odo = new Odontologo();
		
		odo.setDni(dni);
		odo.setNombre(nombre);
		odo.setApellido(apellido);
		odo.setTelefono(telefono);
		odo.setDireccion(direccion);
		odo.setFecha_nac(fechaNac);
		odo.setTipoEspecialidad(especialidad);
		
	
		controlPersis.crearOdontologo(odo);
		
	
	}

	public List<Odontologo> getOdontologos() {
		
		return controlPersis.getOdontologos();
	}

	public Odontologo traerOdontologo(int id) {
		return controlPersis.traerOdontologo(id);
	}

	public void editarOdontologo(Odontologo odon) {
		controlPersis.editarOdontologo(odon);
		
	}

	public void borrarOdontologo(int id) {
		controlPersis.borrarOdontologo(id);
		
	}

	// PACIENTES
	public List<Paciente> getPacientes() {
		return controlPersis.getPacientes();
	}

	public void crearPaciente(String dni, String nombre, String apellido, String telefono, String direccion,
			Date fechaNac, boolean tieneOS) {
		
		Paciente paciente = new Paciente();
		
		paciente.setDni(dni);
		paciente.setNombre(nombre);
		paciente.setApellido(apellido);
		paciente.setTelefono(telefono);
		paciente.setDireccion(direccion);
		paciente.setFecha_nac(fechaNac);
		paciente.setTiene_OS(tieneOS);
		
		controlPersis.crearPaciente(paciente);
		
	}

	public Paciente traerPaciente(int id) {
		return controlPersis.traerPaciente(id);
	}

	public void editarPaciente(Paciente pac) {
		controlPersis.editarPaciente(pac);
		
	}

	// TURNOS
	public void crearTurno(Date fechaTurno, String horaTurno, String afeccion, int idOdonto, int idPaciente) {
		
		Turno turno = new Turno();
	    turno.setFecha_turno(fechaTurno);
	    turno.setHora_turno(horaTurno);
	    turno.setAfeccion(afeccion);
	    

	    Odontologo odonto = controlPersis.traerOdontologo(idOdonto);
	    Paciente pacien = controlPersis.traerPaciente(idPaciente);
	    

	    turno.setOdonto(odonto);
	    turno.setPacien(pacien);
	    
	    controlPersis.crearTurno(turno);
		
	}

	public List<Turno> getTurnos() {
		return controlPersis.getTurnos();
	}

	public void borrarTurno(int idEliminar) {
		controlPersis.borrarTurno(idEliminar);
		
	}


}
