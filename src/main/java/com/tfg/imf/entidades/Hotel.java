package com.tfg.imf.entidades;

import java.util.ArrayList;
import java.util.List;

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
import com.fasterxml.jackson.annotation.ObjectIdGenerators;

import java.util.HashSet;
import java.util.Set;

@Entity
@Table(name = "hotel")
@JsonIdentityInfo(generator = ObjectIdGenerators.PropertyGenerator.class, property = "idHotel")
public class Hotel {

	// 1. CREO ATRIBUTOS

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer idHotel;
	private String nombreHotel;
	private int categoriaHotel;
	private boolean piscinaHotel;
	private boolean gimnasioHotel;
	private boolean terrazaHotel;
	private boolean spaHotel;
	private int aforoHotel;
	private String direccionHotel;
	private float precioHotel;

	@OneToMany(mappedBy = "hotel", cascade = CascadeType.ALL)
	private Set<ImagenesHotel> listadoImagenesHotel = new HashSet<>();

	// 2. CREO RELACIONES
	@ManyToOne
	@JoinColumn(name = "id_destino")
	private Destino destino;

	@OneToMany(mappedBy = "hotel")
	private List<SalaHotel> salasHotel = new ArrayList<>();

	public Hotel() {
		super();
		System.out.println("Accendiendo a la entidad Hotel.java");
	}

	public Integer getIdHotel() {
		return idHotel;
	}

	public void setIdHotel(Integer idHotel) {
		this.idHotel = idHotel;
	}

	public String getNombreHotel() {
		return nombreHotel;
	}

	public void setNombreHotel(String nombreHotel) {
		this.nombreHotel = nombreHotel;
	}

	public int getCategoriaHotel() {
		return categoriaHotel;
	}

	public void setCategoriaHotel(int categoriaHotel) {
		this.categoriaHotel = categoriaHotel;
	}

	public boolean isPiscinaHotel() {
		return piscinaHotel;
	}

	public void setPiscinaHotel(boolean piscinaHotel) {
		this.piscinaHotel = piscinaHotel;
	}

	public boolean isGimnasioHotel() {
		return gimnasioHotel;
	}

	public void setGimnasioHotel(boolean gimnasioHotel) {
		this.gimnasioHotel = gimnasioHotel;
	}

	public boolean isTerrazaHotel() {
		return terrazaHotel;
	}

	public void setTerrazaHotel(boolean terrazaHotel) {
		this.terrazaHotel = terrazaHotel;
	}

	public boolean isSpaHotel() {
		return spaHotel;
	}

	public void setSpaHotel(boolean spaHotel) {
		this.spaHotel = spaHotel;
	}

	public int getAforoHotel() {
		return aforoHotel;
	}

	public void setAforoHotel(int aforoHotel) {
		this.aforoHotel = aforoHotel;
	}

	public String getDireccionHotel() {
		return direccionHotel;
	}

	public void setDireccionHotel(String direccionHotel) {
		this.direccionHotel = direccionHotel;
	}

	public float getPrecioHotel() {
		return precioHotel;
	}

	public void setPrecioHotel(float precioHotel) {
		this.precioHotel = precioHotel;
	}

	public Set<ImagenesHotel> getListadoImagenesHotel() {
		return listadoImagenesHotel;
	}

	public void setListadoImagenesHotel(Set<ImagenesHotel> listadoImagenesHotel) {
		this.listadoImagenesHotel = listadoImagenesHotel;
	}

	public Destino getDestino() {
		return destino;
	}

	public void setDestino(Destino destino) {
		this.destino = destino;
	}

	public List<SalaHotel> getSalasHotel() {
		return salasHotel;
	}

	public void setSalasHotel(List<SalaHotel> salasHotel) {
		this.salasHotel = salasHotel;
	}

	@Override
	public String toString() {
		return "Hotel [idHotel=" + idHotel + ", nombreHotel=" + nombreHotel + ", categoriaHotel=" + categoriaHotel
				+ ", piscinaHotel=" + piscinaHotel + ", gimnasioHotel=" + gimnasioHotel + ", terrazaHotel="
				+ terrazaHotel + ", spaHotel=" + spaHotel + ", aforoHotel=" + aforoHotel + ", direccionHotel="
				+ direccionHotel + ", precioHotel=" + precioHotel + ", destino=" + destino + ", salasHotel="
				+ salasHotel + "]";
	}

}
