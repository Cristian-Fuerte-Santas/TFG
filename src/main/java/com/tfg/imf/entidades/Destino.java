package com.tfg.imf.entidades;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;

import java.util.HashSet;
import java.util.Set;

@Entity
@Table(name = "destino")
@JsonIdentityInfo(generator = ObjectIdGenerators.PropertyGenerator.class, property = "idDestino")
public class Destino {

	// 1. CREO ATRIBUTOS

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY) // que la ID sea autoincrementar al añadir
	private Integer idDestino;
	private String ciudad;

	// 2. CREO RELACIONES

	// ...

	@OneToMany(mappedBy = "destino") // mappedBy = entidad de clase principal que se va a mapear como clave foránea
										// en clase débil: Hotel
	private Set<Hotel> hoteles = new HashSet<>();

	@OneToMany(mappedBy = "destino") // mismo patron al tener la misma relacion de 1 a N
	private Set<Restaurante> restaurantes = new HashSet<>();

	@OneToMany(mappedBy = "destino")
	private Set<Actividad> actividades = new HashSet<>();

	public Destino() {
		super();
		System.out.println("Accediendo a la entidad Destino.java");
	}

	public Integer getIdDestino() {
		return idDestino;
	}

	public void setIdDestino(Integer idDestino) {
		this.idDestino = idDestino;
	}

	public String getCiudad() {
		return ciudad;
	}

	public void setCiudad(String ciudad) {
		this.ciudad = ciudad;
	}

	public Set<Hotel> getHoteles() {
		return hoteles;
	}

	public void setHoteles(Set<Hotel> hoteles) {
		this.hoteles = hoteles;
	}

	public Set<Restaurante> getRestaurantes() {
		return restaurantes;
	}

	public void setRestaurantes(Set<Restaurante> restaurantes) {
		this.restaurantes = restaurantes;
	}

	public Set<Actividad> getActividades() {
		return actividades;
	}

	public void setActividades(Set<Actividad> actividades) {
		this.actividades = actividades;
	}

}
