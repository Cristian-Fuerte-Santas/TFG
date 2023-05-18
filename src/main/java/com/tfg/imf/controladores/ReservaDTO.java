package com.tfg.imf.controladores;

import com.tfg.imf.entidades.Reserva;


public class ReservaDTO {
	
    private Integer idReserva;
    private float precioReserva;
    private Integer idUsuario;
    private String nombreUsuario;
    private Integer idRestaurante;
    private String nombreRestaurante;
    private Integer idActividad;
    private String nombreActividad;
    private Integer idHotel;
    private String nombreHotel;
    private Integer idMenuRestaurante;
    private String nombreMenuRestaurante;
    private Integer idSalaHotel;
    private String nombreSalaHotel;
    private float precioRestaurante;
    private float precioActividad;
    private float precioHotel;
    private float precioMenuRestaurante;
    private float precioSalaHotel;
    private float precioMenuNormal;
    private float precioMenuVegetariano;
    private float precioMenuVegano;
    private float precioMenuCeliaco;


    public ReservaDTO(Reserva reserva) {
    	
        this.idReserva = reserva.getIdReserva();
        this.precioReserva = reserva.getPrecioReserva();
        this.idUsuario = reserva.getUsuario() != null ? reserva.getUsuario().getIdUsuario() : null;
        this.nombreUsuario = reserva.getUsuario() != null ? reserva.getUsuario().getNombreUsuario() : null;
        this.idRestaurante = reserva.getRestaurante() != null ? reserva.getRestaurante().getIdRestaurante() : null;
        this.nombreRestaurante = reserva.getRestaurante() != null ? reserva.getRestaurante().getNombreRestaurante() : null;
        this.idActividad = reserva.getActividad() != null ? reserva.getActividad().getIdActividad() : null;
        this.nombreActividad = reserva.getActividad() != null ? reserva.getActividad().getNombreActividad() : null;
        this.idHotel = reserva.getHotel() != null ? reserva.getHotel().getIdHotel() : null;
        this.nombreHotel = reserva.getHotel() != null ? reserva.getHotel().getNombreHotel() : null;
        this.idMenuRestaurante = reserva.getMenuRestaurante() != null ? reserva.getMenuRestaurante().getIdMenuRestaurante() : null;
        this.idSalaHotel = reserva.getSalaHotel() != null ? reserva.getSalaHotel().getIdSalaHotel() : null;
        this.nombreSalaHotel = reserva.getSalaHotel() != null ? reserva.getSalaHotel().getNombreSala() : null; 
        this.precioActividad = reserva.getActividad() != null ? reserva.getActividad().getPrecioActividad() : 0;
        this.precioHotel = reserva.getHotel() != null ? reserva.getHotel().getPrecioHotel() : 0;
        this.precioSalaHotel = reserva.getSalaHotel() != null ? reserva.getSalaHotel().getPrecioSala() : 0; 
        this.precioMenuNormal = reserva.getMenuRestaurante() != null ? reserva.getMenuRestaurante().getPrecioMenuNormal() : 0;
        this.precioMenuVegetariano = reserva.getMenuRestaurante() != null ? reserva.getMenuRestaurante().getPrecioMenuVegetariano() : 0;
        this.precioMenuVegano = reserva.getMenuRestaurante() != null ? reserva.getMenuRestaurante().getPrecioMenuVegano() : 0;
        this.precioMenuCeliaco = reserva.getMenuRestaurante() != null ? reserva.getMenuRestaurante().getPrecioMenuCeliaco() : 0;
 
    }

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

	public Integer getIdUsuario() {
		return idUsuario;
	}

	public void setIdUsuario(Integer idUsuario) {
		this.idUsuario = idUsuario;
	}

	public String getNombreUsuario() {
		return nombreUsuario;
	}

	public void setNombreUsuario(String nombreUsuario) {
		this.nombreUsuario = nombreUsuario;
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

	public Integer getIdActividad() {
		return idActividad;
	}

	public void setIdActividad(Integer idActividad) {
		this.idActividad = idActividad;
	}

	public String getNombreActividad() {
		return nombreActividad;
	}

	public void setNombreActividad(String nombreActividad) {
		this.nombreActividad = nombreActividad;
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

	public Integer getIdMenuRestaurante() {
		return idMenuRestaurante;
	}

	public void setIdMenuRestaurante(Integer idMenuRestaurante) {
		this.idMenuRestaurante = idMenuRestaurante;
	}

	public String getNombreMenuRestaurante() {
		return nombreMenuRestaurante;
	}

	public void setNombreMenuRestaurante(String nombreMenuRestaurante) {
		this.nombreMenuRestaurante = nombreMenuRestaurante;
	}

	public Integer getIdSalaHotel() {
		return idSalaHotel;
	}

	public void setIdSalaHotel(Integer idSalaHotel) {
		this.idSalaHotel = idSalaHotel;
	}

	public String getNombreSalaHotel() {
		return nombreSalaHotel;
	}

	public void setNombreSalaHotel(String nombreSalaHotel) {
		this.nombreSalaHotel = nombreSalaHotel;
	}

	public float getPrecioRestaurante() {
		return precioRestaurante;
	}

	public void setPrecioRestaurante(float precioRestaurante) {
		this.precioRestaurante = precioRestaurante;
	}

	public float getPrecioActividad() {
		return precioActividad;
	}

	public void setPrecioActividad(float precioActividad) {
		this.precioActividad = precioActividad;
	}

	public float getPrecioHotel() {
		return precioHotel;
	}

	public void setPrecioHotel(float precioHotel) {
		this.precioHotel = precioHotel;
	}

	public float getPrecioMenuRestaurante() {
		return precioMenuRestaurante;
	}

	public void setPrecioMenuRestaurante(float precioMenuRestaurante) {
		this.precioMenuRestaurante = precioMenuRestaurante;
	}

	public float getPrecioSalaHotel() {
		return precioSalaHotel;
	}

	public void setPrecioSalaHotel(float precioSalaHotel) {
		this.precioSalaHotel = precioSalaHotel;
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
    

}


