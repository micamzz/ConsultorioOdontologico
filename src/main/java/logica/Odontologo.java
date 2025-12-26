package logica;

import java.util.Date;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

@Entity
public class Odontologo extends Persona {


	@Enumerated(EnumType.STRING)
	private Especialidad tipoEspecialidad;
	@OneToOne
	private Usuario unUsuario;
	@OneToOne
	private Horario unHorario;
	
	//Relacion 1 a N
	// el MappedBy = es referencia lógica para poder acceder a los turnos desde el objeto odontólogo en Java.
	@OneToMany(mappedBy="odonto")
	private List <Turno> listaTurnos;
	

	public Odontologo(String dni, String nombre, String apellido, String telefono, String direccion, Date fecha_nac,
			Especialidad tipoEspecialidad, Usuario unUsuario, Horario unHorario, List<Turno> listaTurnos) {
		super(dni, nombre, apellido, telefono, direccion, fecha_nac);
		this.tipoEspecialidad = tipoEspecialidad;
		this.unUsuario = unUsuario;
		this.unHorario = unHorario;
		this.listaTurnos = listaTurnos;
	}


	public Odontologo() {

	}


	public Especialidad getTipoEspecialidad() {
		return tipoEspecialidad;
	}


	public void setTipoEspecialidad(Especialidad tipoEspecialidad) {
		this.tipoEspecialidad = tipoEspecialidad;
	}


	public Usuario getUnUsuario() {
		return unUsuario;
	}


	public void setUnUsuario(Usuario unUsuario) {
		this.unUsuario = unUsuario;
	}


	public Horario getUnHorario() {
		return unHorario;
	}


	public void setUnHorario(Horario unHorario) {
		this.unHorario = unHorario;
	}


	public List<Turno> getListaTurnos() {
		return listaTurnos;
	}


	public void setListaTurnos(List<Turno> listaTurnos) {
		this.listaTurnos = listaTurnos;
	}
	
	
	
	
	
	
	
	
	
	
}
