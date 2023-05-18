package com.tfg.imf.entidades;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;

@Entity
@Table(name = "actividad")
@JsonIdentityInfo(generator = ObjectIdGenerators.PropertyGenerator.class, property = "idActividad")
public class Actividad {

	// 1. CREO ATRIBUTOS

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer idActividad;

	private String tipoActividad;
	private String nombreActividad;
	private String direccionActividad;
	private int aforoActividad;
	private float precioActividad;

	// 2. CREO RELACIONES
	@ManyToOne
	@JoinColumn(name = "id_destino")
	private Destino destino;

	// Relacion ManyToMany: https://www.youtube.com/watch?v=T_cWyhhy0yw
	@ManyToMany
	@JoinTable(name = "usuarios_actividades", joinColumns = @JoinColumn(name = "idActividad"), inverseJoinColumns = @JoinColumn(name = "idUsuario"))
	private List<Usuario> usuariosGuardados = new ArrayList<>();

	@OneToMany(mappedBy = "actividad", cascade = CascadeType.ALL)
	private Set<ImagenesActividad> listadoImagenesActividad = new HashSet<>();

	@OneToMany(mappedBy = "actividad", cascade = CascadeType.ALL, orphanRemoval = false)
	private List<Reserva> reservas = new ArrayList<>();

	public Actividad() {
		super();
		System.out.println("Accediendo a la entidad Actividad.java");
	}

	public Integer getIdActividad() {
		return idActividad;
	}

	public void setIdActividad(Integer idActividad) {
		this.idActividad = idActividad;
	}

	public String getTipoActividad() {
		return tipoActividad;
	}

	public void setTipoActividad(String tipoActividad) {
		this.tipoActividad = tipoActividad;
	}

	public String getNombreActividad() {
		return nombreActividad;
	}

	public void setNombreActividad(String nombreActividad) {
		this.nombreActividad = nombreActividad;
	}

	public String getDireccionActividad() {
		return direccionActividad;
	}

	public void setDireccionActividad(String direccionActividad) {
		this.direccionActividad = direccionActividad;
	}

	public int getAforoActividad() {
		return aforoActividad;
	}

	public void setAforoActividad(int aforoActividad) {
		this.aforoActividad = aforoActividad;
	}

	public float getPrecioActividad() {
		return precioActividad;
	}

	public void setPrecioActividad(float precioActividad) {
		this.precioActividad = precioActividad;
	}

	public Destino getDestino() {
		return destino;
	}

	public void setDestino(Destino destino) {
		this.destino = destino;
	}

	public List<Usuario> getUsuariosGuardados() {
		return usuariosGuardados;
	}

	public void setUsuariosGuardados(List<Usuario> usuariosGuardados) {
		this.usuariosGuardados = usuariosGuardados;
	}

	public Set<ImagenesActividad> getListadoImagenesActividad() {
		return listadoImagenesActividad;
	}

	public void setListadoImagenesActividad(Set<ImagenesActividad> listadoImagenesActividad) {
		this.listadoImagenesActividad = listadoImagenesActividad;
	}

	/*
	 * @Override public String toString() { return "Actividad [idActividad=" +
	 * idActividad + ", tipoActividad=" + tipoActividad + ", nombreActividad=" +
	 * nombreActividad + ", direccionActividad=" + direccionActividad +
	 * ", aforoActividad=" + aforoActividad + ", precioActividad=" + precioActividad
	 * + ", destino=" + destino + ", usuariosGuardados=" + usuariosGuardados + "]";
	 * }
	 * 
	 */

}
