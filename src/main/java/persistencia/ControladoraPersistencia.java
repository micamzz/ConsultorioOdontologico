package persistencia;

import logica.Usuario;

public class ControladoraPersistencia {

	// Instancia de clases controladoras Jpa
//	HorarioJpaController horaJpa = new HorarioJpaController();
//    OdontologoJpaController odontoJpa = new OdontologoJpaController();
//    PacienteJpaController pacJpa = new PacienteJpaController();
//    PersonaJpaController persJpa = new PersonaJpaController();
//    ResponsableJpaController respJpa = new ResponsableJpaController();
//    SecretarioJpaController secreJpa = new SecretarioJpaController();
//    TurnoJpaController turnoJpa = new TurnoJpaController();
    UsuarioJpaController usuJpa = new UsuarioJpaController();
    
 
    public ControladoraPersistencia() {
		super();
	}

	// Usuario - Método para que se cree en la base de datos
	public void crearUsuario(Usuario usu) {
		usuJpa.create(usu);	
	}
	
}
