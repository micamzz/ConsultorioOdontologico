package logica;

import java.util.Date;

public class Secretario extends Persona {
	
	private int id_secretario;
	private String sector; // cambiar a enun
	private Usuario unUsuario;
	
	
	
	// Constructores
	public Secretario() {
	}


	public Secretario(String dni, String nombre, String apellido, String telefono, String direccion, Date fecha_nac,
			int id_secretario, String sector, Usuario unUsuario) {
		super(dni, nombre, apellido, telefono, direccion, fecha_nac);
		this.id_secretario = id_secretario;
		this.sector = sector;
		this.unUsuario = unUsuario;
	}


    //Getters y Setters
	public int getId_secretario() {
		return id_secretario;
	}



	public void setId_secretario(int id_secretario) {
		this.id_secretario = id_secretario;
	}



	public String getSector() {
		return sector;
	}



	public void setSector(String sector) {
		this.sector = sector;
	}



	public Usuario getUnUsuario() {
		return unUsuario;
	}



	public void setUnUsuario(Usuario unUsuario) {
		this.unUsuario = unUsuario;
	}

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
