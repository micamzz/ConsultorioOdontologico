package persistencia;

import java.util.ArrayList;
import java.util.List;

import logica.Odontologo;
import logica.Usuario;

public class ControladoraPersistencia {

	// Instancia de clases controladoras Jpa
//	HorarioJpaController horaJpa = new HorarioJpaController();
    OdontologoJpaController odontoJpa = new OdontologoJpaController();
//    PacienteJpaController pacJpa = new PacienteJpaController();
//    PersonaJpaController persJpa = new PersonaJpaController();
//    ResponsableJpaController respJpa = new ResponsableJpaController();
//    SecretarioJpaController secreJpa = new SecretarioJpaController();
//    TurnoJpaController turnoJpa = new TurnoJpaController();
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
	
}
