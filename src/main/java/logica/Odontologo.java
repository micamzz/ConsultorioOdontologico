package logica;

import java.util.Date;
import java.util.List;

public class Odontologo extends Persona {

	private int id_odontologo;
	private Especialidad tipoEspecialidad;
	private Usuario unUsuario;
	private Horario unHorario;
	
	//Relacion 1 a N
	private List <Turno> listaTurnos;
	
	
	
	public Odontologo() {
		super();
	}

	
	public Odontologo(String dni, String nombre, String apellido, String telefono, String direccion, Date fecha_nac,
			int id_odontologo, Especialidad tipoEspecialidad, Usuario unUsuario, Horario unHorario,
			List<Turno> listaTurnos) {
		super(dni, nombre, apellido, telefono, direccion, fecha_nac);
		this.id_odontologo = id_odontologo;
		this.tipoEspecialidad = tipoEspecialidad;
		this.unUsuario = unUsuario;
		this.unHorario = unHorario;
		this.listaTurnos = listaTurnos;
	}


	public int getId_odontologo() {
		return id_odontologo;
	}


	public void setId_odontologo(int id_odontologo) {
		this.id_odontologo = id_odontologo;
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
