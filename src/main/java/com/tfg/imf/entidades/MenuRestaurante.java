package com.tfg.imf.entidades;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.JsonIdentityReference;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;

@Entity
@Table(name = "menu_restaurante")
@JsonIdentityInfo(generator = ObjectIdGenerators.PropertyGenerator.class, property = "idMenuRestaurante")
public class MenuRestaurante {

	// 1. CREO ATRIBUTOS

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer idMenuRestaurante;
	private float precioMenuNormal;
	private float precioMenuVegetariano;
	private float precioMenuVegano;
	private float precioMenuCeliaco;

	// 2. CREO RELACIONES
	@ManyToOne
	@JoinColumn(name = "id_restaurante")
	@JsonIdentityReference(alwaysAsId = true)
	private Restaurante restaurante;

	@OneToMany(mappedBy = "menuRestaurante", cascade = CascadeType.ALL)
	private Set<ImagenesMenuRestaurante> listadoImagenesMenuRestaurante = new HashSet<>();

	public MenuRestaurante() {
		super();
		System.out.println("Accediendo a la entidad MenuRestaurante.java");
	}

	public Integer getIdMenuRestaurante() {
		return idMenuRestaurante;
	}

	public void setIdMenuRestaurante(Integer idMenuRestaurante) {
		this.idMenuRestaurante = idMenuRestaurante;
	}

	public float getPrecioMenuNormal() {
		return precioMenuNormal;
	}

	public void setPrecioMenuNormal(float precioMenuNormal) {
		this.precioMenuNormal = precioMenuNormal;
	}

	public float getPrecioMenuVegetariano() {
		return precioMenuVegetariano;
	}

	public void setPrecioMenuVegetariano(float precioMenuVegetariano) {
		this.precioMenuVegetariano = precioMenuVegetariano;
	}

	public float getPrecioMenuVegano() {
		return precioMenuVegano;
	}

	public void setPrecioMenuVegano(float precioMenuVegano) {
		this.precioMenuVegano = precioMenuVegano;
	}

	public float getPrecioMenuCeliaco() {
		return precioMenuCeliaco;
	}

	public void setPrecioMenuCeliaco(float precioMenuCeliaco) {
		this.precioMenuCeliaco = precioMenuCeliaco;
	}

	public Restaurante getRestaurante() {
		return restaurante;
	}

	public void setRestaurante(Restaurante restaurante) {
		this.restaurante = restaurante;
	}

	public Set<ImagenesMenuRestaurante> getListadoImagenesMenuRestaurante() {
		return listadoImagenesMenuRestaurante;
	}

	public void setListadoImagenesMenuRestaurante(Set<ImagenesMenuRestaurante> listadoImagenesMenuRestaurante) {
		this.listadoImagenesMenuRestaurante = listadoImagenesMenuRestaurante;
	}

	@Override
	public String toString() {
		return "MenuRestaurante [idMenuRestaurante=" + idMenuRestaurante + ", precioMenuNormal=" + precioMenuNormal
				+ ", precioMenuVegetariano=" + precioMenuVegetariano + ", precioMenuVegano=" + precioMenuVegano
				+ ", precioMenuCeliaco=" + precioMenuCeliaco + ", restaurante=" + restaurante + "]";
	}

}
