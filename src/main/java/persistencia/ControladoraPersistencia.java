package persistencia;

import java.util.ArrayList;
import java.util.List;

import logica.Odontologo;
import logica.Paciente;
import logica.Turno;
import logica.Usuario;

public class ControladoraPersistencia {

	// Instancia de clases controladoras Jpa
	
    OdontologoJpaController odontoJpa = new OdontologoJpaController();
    PacienteJpaController pacJpa = new PacienteJpaController();
//    PersonaJpaController persJpa = new PersonaJpaController();
  TurnoJpaController turnoJpa = new TurnoJpaController();
    UsuarioJpaController usuJpa = new UsuarioJpaController();
    
 
    public ControladoraPersistencia() {
		super();
	}

	// USUARIO - Método para que se cree en la base de datos
	public void crearUsuario(Usuario usu) {
		usuJpa.create(usu);	
	}

	public List<Usuario> getUsuarios() {
		
		return usuJpa.findUsuarioEntities();
	}

	
	public void borrarUsuario(int id) {
		usuJpa.destroy(id);	
	}

	public Usuario traerUsuario(int id) {
		return usuJpa.findUsuario(id);
	}

	public void editarUsuario(Usuario usu) {
		try {
			usuJpa.edit(usu);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	// ODONTOLOGO 
	public void crearOdontologo(Odontologo odo) {
		odontoJpa.create(odo);
		
	}

	public List<Odontologo> getOdontologos() {
		return odontoJpa.findOdontologoEntities();
	}

	public Odontologo traerOdontologo(int id) {
		return odontoJpa.findOdontologo(id);
	}

	public void editarOdontologo(Odontologo odon) {
		try {
			odontoJpa.edit(odon);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	public void borrarOdontologo(int id) {
		odontoJpa.destroy(id);
		
	}

	// PACIENTES 
	public List<Paciente> getPacientes() {
		return pacJpa.findPacienteEntities();
	}

	public void crearPaciente(Paciente paciente) {
		pacJpa.create(paciente);
		
	}

	public Paciente traerPaciente(int id) {
		return pacJpa.findPaciente(id);
	}

	public void editarPaciente(Paciente pac) {
		try {
			pacJpa.edit(pac);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	// TURNOS
	public void crearTurno(Turno turno) {
		try {
			turnoJpa.create(turno);
	    } catch (Exception e) {
	        System.out.println("Error al persistir el turno: " + e.getMessage());
	    }
		
	}

	public List<Turno> getTurnos() {
		
		return turnoJpa.findTurnoEntities();
	}
	
	public void borrarTurno(int idEliminar) {
	    try {
	        turnoJpa.destroy(idEliminar);
	    } catch (Exception e) {
	        System.out.println("No se pudo eliminar el turno: " + e.getMessage());
	    }
	}
	
}
