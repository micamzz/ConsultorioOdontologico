package logica;

import java.util.Date;
import java.util.List;

public class Paciente extends Persona {
	
	private int id_paciente;
	private Boolean tiene_OS;
	private String tipoSangre;
	private Responsable responsable;
	
	// Relacion de 1 a N 
	private List <Turno> listaTurnos;
	
	
	public Paciente() {
		
	}
	
	public Paciente(String dni, String nombre, String apellido, String telefono, String direccion, Date fecha_nac,
			int id_paciente, Boolean tiene_OS, String tipoSangre, Responsable responsable, List<Turno> listaTurnos) {
		super(dni, nombre, apellido, telefono, direccion, fecha_nac);
		this.id_paciente = id_paciente;
		this.tiene_OS = tiene_OS;
		this.tipoSangre = tipoSangre;
		this.responsable = responsable;
		this.listaTurnos = listaTurnos;
	}


	// Geters y Setter propios.
	public int getId_paciente() {
		return id_paciente;
	}


	public void setId_paciente(int id_paciente) {
		this.id_paciente = id_paciente;
	}


	public Boolean getTiene_OS() {
		return tiene_OS;
	}


	public void setTiene_OS(Boolean tiene_OS) {
		this.tiene_OS = tiene_OS;
	}


	public String getTipoSangre() {
		return tipoSangre;
	}


	public void setTipoSangre(String tipoSangre) {
		this.tipoSangre = tipoSangre;
	}

	public Responsable getResponsable() {
		return responsable;
	}

	public void setResponsable(Responsable responsable) {
		this.responsable = responsable;
	}

	public List<Turno> getListaTurnos() {
		return listaTurnos;
	}

	public void setListaTurnos(List<Turno> listaTurnos) {
		this.listaTurnos = listaTurnos;
	}
	
	


	
	
	
	
}
