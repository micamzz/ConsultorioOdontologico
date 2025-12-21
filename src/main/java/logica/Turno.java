package logica;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
public class Turno {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id_turno;
	@Temporal(TemporalType.DATE)
	private Date fecha_turno;
	private String hora_turno;
	private String afeccion;
	
	/* Esta relacionado con el mapeo de la clase odontologo, relacion 1-N segun el nombre del objeto Odontologo
	 El name es la FK en la BDD*/
	@ManyToOne
	@JoinColumn(name="fk_odontologo")
	private Odontologo odonto;
	
	/* Esta relacionado con el mapeo de la clase paciente relacion 1-N */
	@ManyToOne
	@JoinColumn(name="fk_paciente")
	private Paciente pacien;
	
	
	// Constructores
	public Turno() {
	}


	public Turno(int id_turno, Date fecha_turno, String hora_turno, String afeccion) {
		super();
		this.id_turno = id_turno;
		this.fecha_turno = fecha_turno;
		this.hora_turno = hora_turno;
		this.afeccion = afeccion;
	}


	// Getters y setters
	
	public int getId_turno() {
		return id_turno;
	}


	public void setId_turno(int id_turno) {
		this.id_turno = id_turno;
	}


	public Date getFecha_turno() {
		return fecha_turno;
	}


	public void setFecha_turno(Date fecha_turno) {
		this.fecha_turno = fecha_turno;
	}


	public String getHora_turno() {
		return hora_turno;
	}


	public void setHora_turno(String hora_turno) {
		this.hora_turno = hora_turno;
	}


	public String getAfeccion() {
		return afeccion;
	}


	public void setAfeccion(String afeccion) {
		this.afeccion = afeccion;
	}

	
	
	
	
	
}
