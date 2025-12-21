package logica;

import java.util.Date;

import javax.persistence.Entity;

@Entity
public class Responsable extends Persona {

//	private int id_responsable;
	private TipoResponsabilidad tipoResponsabilidad;
	
	
	// Constructores
	public Responsable() {
	}

   
	public Responsable(String dni, String nombre, String apellido, String telefono, String direccion, Date fecha_nac,
			TipoResponsabilidad tipoResponsabilidad) {
		super(dni, nombre, apellido, telefono, direccion, fecha_nac);
		this.tipoResponsabilidad = tipoResponsabilidad;
	}


	// Metodos getters y setters
//	public int getId_responsable() {
//		return id_responsable;
//	}
//
//	public void setId_responsable(int id_responsable) {
//		this.id_responsable = id_responsable;
//	}


	public TipoResponsabilidad getTipoResponsabilidad() {
		return tipoResponsabilidad;
	}


	public void setTipoResponsabilidad(TipoResponsabilidad tipoResponsabilidad) {
		this.tipoResponsabilidad = tipoResponsabilidad;
	}
	
	
	
	
	
	
	
	
	
}
