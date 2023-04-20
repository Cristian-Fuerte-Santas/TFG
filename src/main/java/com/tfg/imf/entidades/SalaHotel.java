package com.tfg.imf.entidades;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;



@Entity
@Table(name = "salaHotel")
public class SalaHotel {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer idSalaHotel;
	private String nombreSala;
	private int aforoSala;
	private String metrosSala;
	private boolean equipoSonidoSala;
	private boolean proyectorSala;
	private float precioSala;
	
	@ManyToOne
	@JoinColumn(name="id_hotel")
	private Hotel hotel;

	public SalaHotel() {
		super();
		System.out.println("Accediendo a la entidad SalaHotel.java");
	}

	public Integer getIdSalaHotel() {
		return idSalaHotel;
	}

	public void setIdSalaHotel(Integer idSalaHotel) {
		this.idSalaHotel = idSalaHotel;
	}

	public String getNombreSala() {
		return nombreSala;
	}

	public void setNombreSala(String nombreSala) {
		this.nombreSala = nombreSala;
	}

	public int getAforoSala() {
		return aforoSala;
	}

	public void setAforoSala(int aforoSala) {
		this.aforoSala = aforoSala;
	}

	public String getMetrosSala() {
		return metrosSala;
	}

	public void setMetrosSala(String metrosSala) {
		this.metrosSala = metrosSala;
	}

	public boolean isEquipoSonidoSala() {
		return equipoSonidoSala;
	}

	public void setEquipoSonidoSala(boolean equipoSonidoSala) {
		this.equipoSonidoSala = equipoSonidoSala;
	}

	public boolean isProyectorSala() {
		return proyectorSala;
	}

	public void setProyectorSala(boolean proyectorSala) {
		this.proyectorSala = proyectorSala;
	}

	public float getPrecioSala() {
		return precioSala;
	}

	public void setPrecioSala(float precioSala) {
		this.precioSala = precioSala;
	}

	public Hotel getHotel() {
		return hotel;
	}

	public void setHotel(Hotel hotel) {
		this.hotel = hotel;
	}

	@Override
	public String toString() {
		return "SalaHotel [idSalaHotel=" + idSalaHotel + ", nombreSala=" + nombreSala + ", aforoSala=" + aforoSala
				+ ", metrosSala=" + metrosSala + ", equipoSonidoSala=" + equipoSonidoSala + ", proyectorSala="
				+ proyectorSala + ", precioSala=" + precioSala + ", hotel=" + hotel + "]";
	}

	
	
	
	
	
}
