package com.tfg.imf.entidades;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "imagen_hotel")
public class ImagenesHotel {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer idImagenHotel;
    private String urlImagenHotel;

    @ManyToOne
    @JoinColumn(name = "id_hotel")
    private Hotel hotel;

    public ImagenesHotel() {
    	
    	System.out.println("Accediendo a la entidad ImagenesHotel.java");
    }

	public Integer getIdImagenHotel() {
		return idImagenHotel;
	}

	public void setIdImagenHotel(Integer idImagenHotel) {
		this.idImagenHotel = idImagenHotel;
	}

	public String getUrlImagenHotel() {
		return urlImagenHotel;
	}

	public void setUrlImagenHotel(String urlImagenHotel) {
		this.urlImagenHotel = urlImagenHotel;
	}

	public Hotel getHotel() {
		return hotel;
	}

	public void setHotel(Hotel hotel) {
		this.hotel = hotel;
	}

	@Override
	public String toString() {
		return "ImagenesHotel [idImagenHotel=" + idImagenHotel + ", urlImagenHotel=" + urlImagenHotel + "]";
	}

    
}

