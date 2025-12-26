package logica;

import java.util.Date;
import java.util.List;
import javax.persistence.Entity;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;


@Entity
public class Paciente extends Persona {
	
//	private int id_paciente;
	private Boolean tiene_OS;

	// Relacion de 1 a N 
	@OneToMany(mappedBy="pacien")
	private List <Turno> listaTurnos;
	
	
	public Paciente() {
		
	}
	
	
 Paciente(String dni, String nombre, String apellido, String telefono, String direccion, Date fecha_nac,
			Boolean tiene_OS,  List<Turno> listaTurnos) {
		super(dni, nombre, apellido, telefono, direccion, fecha_nac);
		this.tiene_OS = tiene_OS;
		this.listaTurnos = listaTurnos;
	}


	public Boolean getTiene_OS() {
		return tiene_OS;
	}


	public void setTiene_OS(Boolean tiene_OS) {
		this.tiene_OS = tiene_OS;
	}


	public List<Turno> getListaTurnos() {
		return listaTurnos;
	}

	public void setListaTurnos(List<Turno> listaTurnos) {
		this.listaTurnos = listaTurnos;
	}
	
	


	
	
	
	
}
