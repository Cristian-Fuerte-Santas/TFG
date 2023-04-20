package com.tfg.imf.entidades;



import java.util.ArrayList;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;





@Entity
@Table(name = "destino")
public class Destino {

	
	//1. CREO ATRIBUTOS
		
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY) //que la ID sea autoincrementar al añadir 
	private Integer idDestino; 
	private String ciudad; 
	
	
	//2. CREO RELACIONES
	
	@OneToMany(mappedBy = "destino") //mappedBy = entidad de clase principal que se va a mapear como clave foránea en clase débil: Hotel  
	private List<Hotel> hoteles = new ArrayList<>(); 
	
	@OneToMany(mappedBy = "destino") //mismo patron al tener la misma relacion de 1 a N 
	private List<Restaurante> restaurantes = new ArrayList<>(); 
	
	@OneToMany(mappedBy = "destino")
	private List<Actividad> actividades = new ArrayList<>(); 
	
	@OneToMany(mappedBy = "destino")
	private List<Transporte> transportes = new ArrayList<>();

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

	public List<Hotel> getHoteles() {
		return hoteles;
	}

	public void setHoteles(List<Hotel> hoteles) {
		this.hoteles = hoteles;
	}

	public List<Restaurante> getRestaurantes() {
		return restaurantes;
	}

	public void setRestaurantes(List<Restaurante> restaurantes) {
		this.restaurantes = restaurantes;
	}

	public List<Actividad> getActividades() {
		return actividades;
	}

	public void setActividades(List<Actividad> actividades) {
		this.actividades = actividades;
	}

	public List<Transporte> getTransportes() {
		return transportes;
	}

	public void setTransportes(List<Transporte> transportes) {
		this.transportes = transportes;
	}

	@Override
	public String toString() {
		return "Destino [idDestino=" + idDestino + ", ciudad=" + ciudad + ", hoteles=" + hoteles + ", restaurantes="
				+ restaurantes + ", actividades=" + actividades + ", transportes=" + transportes + "]";
	} 
	
	
	
	
	
}
