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
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;

@Entity
@Table(name = "restaurante")
@JsonIdentityInfo(
		  generator = ObjectIdGenerators.PropertyGenerator.class, 
		  property = "idRestaurante")
public class Restaurante {

	// 1. CREO ATRIBUTOS

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer idRestaurante;

	private String nombreRestaurante;
	private String tipoRestaurante;
	private int categoriaRestaurante;
	private int aforoRestaurante;
	private String direccionRestaurante;

	@OneToMany(mappedBy = "restaurante", cascade = CascadeType.ALL)
	private Set<ImagenesRestaurante> listadoImagenesRestaurante = new HashSet<>();

	// 2. CREO RELACIONES
	@ManyToOne
	@JoinColumn(name = "id_destino")
	private Destino destino;

	@OneToMany(mappedBy = "restaurante")
	private List<MenuRestaurante> menusRestaurante = new ArrayList<>();

	// Relacion ManyToMany: https://www.youtube.com/watch?v=T_cWyhhy0yw
	@ManyToMany(mappedBy = "restaurantesGuardados")
	private List<Usuario> usuariosGuardados = new ArrayList<>();

	public Restaurante() {
		super();
		System.out.println("Accediendo a la entidad Restaurante.java");
	}

	public Integer getIdRestaurante() {
		return idRestaurante;
	}

	public void setIdRestaurante(Integer idRestaurante) {
		this.idRestaurante = idRestaurante;
	}

	public String getNombreRestaurante() {
		return nombreRestaurante;
	}

	public void setNombreRestaurante(String nombreRestaurante) {
		this.nombreRestaurante = nombreRestaurante;
	}

	public String getTipoRestaurante() {
		return tipoRestaurante;
	}

	public void setTipoRestaurante(String tipoRestaurante) {
		this.tipoRestaurante = tipoRestaurante;
	}

	public int getCategoriaRestaurante() {
		return categoriaRestaurante;
	}

	public void setCategoriaRestaurante(int categoriaRestaurante) {
		this.categoriaRestaurante = categoriaRestaurante;
	}

	public int getAforoRestaurante() {
		return aforoRestaurante;
	}

	public void setAforoRestaurante(int aforoRestaurante) {
		this.aforoRestaurante = aforoRestaurante;
	}

	public String getDireccionRestaurante() {
		return direccionRestaurante;
	}

	public void setDireccionRestaurante(String direccionRestaurante) {
		this.direccionRestaurante = direccionRestaurante;
	}

	public Set<ImagenesRestaurante> getListadoImagenesRestaurante() {
		return listadoImagenesRestaurante;
	}

	public void setListadoImagenesRestaurante(Set<ImagenesRestaurante> listadoImagenesRestaurante) {
		this.listadoImagenesRestaurante = listadoImagenesRestaurante;
	}

	public Destino getDestino() {
		return destino;
	}

	public void setDestino(Destino destino) {
		this.destino = destino;
	}

	public List<MenuRestaurante> getMenusRestaurante() {
		return menusRestaurante;
	}

	public void setMenusRestaurante(List<MenuRestaurante> menusRestaurante) {
		this.menusRestaurante = menusRestaurante;
	}

	public List<Usuario> getUsuariosGuardados() {
		return usuariosGuardados;
	}

	public void setUsuariosGuardados(List<Usuario> usuariosGuardados) {
		this.usuariosGuardados = usuariosGuardados;
	}
	
	


/*
	@Override
	public String toString() {
		return "Restaurante [idRestaurante=" + idRestaurante + ", nombreRestaurante=" + nombreRestaurante
				+ ", tipoRestaurante=" + tipoRestaurante + ", categoriaRestaurante=" + categoriaRestaurante
				+ ", aforoRestaurante=" + aforoRestaurante + ", direccionRestaurante=" + direccionRestaurante
				+ ", destino=" + destino + ", menusRestaurante=" + menusRestaurante + ", usuariosGuardados="
				+ usuariosGuardados + "]";
	}
	*/

}
