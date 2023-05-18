package com.tfg.imf.entidades;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;

@Entity
@Table(name = "reserva")
@JsonIdentityInfo(generator = ObjectIdGenerators.PropertyGenerator.class, property = "idReserva")
public class Reserva {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer idReserva;

	private float precioReserva;

	@ManyToOne(fetch = FetchType.LAZY, optional = false)
	@JoinColumn(name = "id_usuario", referencedColumnName = "idUsuario", nullable = false)
	private Usuario usuario;

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "id_restaurante", referencedColumnName = "idRestaurante", nullable = true)
	private Restaurante restaurante;

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "id_actividad", referencedColumnName = "idActividad", nullable = true)
	private Actividad actividad;

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "id_hotel", referencedColumnName = "idHotel", nullable = true)
	private Hotel hotel;

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "id_menu_restaurante", referencedColumnName = "idMenuRestaurante", nullable = true)
	private MenuRestaurante menuRestaurante;

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "id_sala_hotel", referencedColumnName = "idSalaHotel", nullable = true)
	private SalaHotel salaHotel;

	public Integer getIdReserva() {
		return idReserva;
	}

	public void setIdReserva(Integer idReserva) {
		this.idReserva = idReserva;
	}

	public float getPrecioReserva() {
		return precioReserva;
	}

	public void setPrecioReserva(float precioReserva) {
		this.precioReserva = precioReserva;
	}

	public Usuario getUsuario() {
		return usuario;
	}

	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}

	public Restaurante getRestaurante() {
		return restaurante;
	}

	public void setRestaurante(Restaurante restaurante) {
		this.restaurante = restaurante;
	}

	public Actividad getActividad() {
		return actividad;
	}

	public void setActividad(Actividad actividad) {
		this.actividad = actividad;
	}

	public Hotel getHotel() {
		return hotel;
	}

	public void setHotel(Hotel hotel) {
		this.hotel = hotel;
	}

	public MenuRestaurante getMenuRestaurante() {
		return menuRestaurante;
	}

	public void setMenuRestaurante(MenuRestaurante menuRestaurante) {
		this.menuRestaurante = menuRestaurante;
	}

	public SalaHotel getSalaHotel() {
		return salaHotel;
	}

	public void setSalaHotel(SalaHotel salaHotel) {
		this.salaHotel = salaHotel;
	}

}
