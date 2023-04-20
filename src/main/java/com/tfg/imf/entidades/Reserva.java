package com.tfg.imf.entidades;

import java.time.LocalDate;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;



@Entity
@Table(name = "reserva")
public class Reserva {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer idReserva;
	private LocalDate fechaInicio;
	private LocalDate fechaFin; 
	private float precioReserva;
	
	
	public Reserva() {
		super();
		System.out.println("Accediendo a la entidad Reserva.java");
	}


	public Integer getIdReserva() {
		return idReserva;
	}


	public void setIdReserva(Integer idReserva) {
		this.idReserva = idReserva;
	}


	public LocalDate getFechaInicio() {
		return fechaInicio;
	}


	public void setFechaInicio(LocalDate fechaInicio) {
		this.fechaInicio = fechaInicio;
	}


	public LocalDate getFechaFin() {
		return fechaFin;
	}


	public void setFechaFin(LocalDate fechaFin) {
		this.fechaFin = fechaFin;
	}


	public float getPrecioReserva() {
		return precioReserva;
	}


	public void setPrecioReserva(float precioReserva) {
		this.precioReserva = precioReserva;
	}


	@Override
	public String toString() {
		return "Reserva [idReserva=" + idReserva + ", fechaInicio=" + fechaInicio + ", fechaFin=" + fechaFin
				+ ", precioReserva=" + precioReserva + "]";
	}
	
	
	

}
