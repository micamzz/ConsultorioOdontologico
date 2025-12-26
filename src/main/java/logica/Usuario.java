package logica;

import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Usuario {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id_usuario;
	private String nombreUsuario;
	private String contrasenia;
	@Enumerated(EnumType.STRING)
	private Rol rol;
	
	
    // Constructores 
	
	public Usuario() {
	}

	public Usuario(int id_usuario, String nombreUsuario, String contrasenia, Rol rol) {
		super();
		this.id_usuario = id_usuario;
		this.nombreUsuario = nombreUsuario;
		this.contrasenia = contrasenia;
		this.rol = rol;
	}

	// Getters y setters
	public int getId_usuario() {
		return id_usuario;
	}

	public void setId_usuario(int id_usuario) {
		this.id_usuario = id_usuario;
	}

	public String getNombreUsuario() {
		return nombreUsuario;
	}

	public void setNombreUsuario(String nombreUsuario) {
		this.nombreUsuario = nombreUsuario;
	}

	public String getContrasenia() {
		return contrasenia;
	}

	public void setContrasenia(String contrasenia) {
		this.contrasenia = contrasenia;
	}

	public Rol getRol() {
		return rol;
	}

	public void setRol(Rol rol) {
		this.rol = rol;
	}

}
