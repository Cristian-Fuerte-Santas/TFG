package com.tfg.imf.entidades;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIdentityReference;

@Entity
@Table ( name = "imagen_SalaHotel")
public class ImagenesSalaHotel {
	 @Id
	    @GeneratedValue(strategy = GenerationType.IDENTITY)
	 private Integer idImagenSalaHotel;
	    private String urlImagenSalaHotel;
	
	    @ManyToOne
	    @JoinColumn(name = "id_SalaHotel")
	   
	    @JsonIdentityReference(alwaysAsId = true)
	    private SalaHotel salaHotel;

		public ImagenesSalaHotel() {
			super();
			System.out.println("Accediendo a la entidad SalaHotel.java");
		}

		public Integer getIdImagenSalaHotel() {
			return idImagenSalaHotel;
		}

		public void setIdImagenSalaHotel(Integer idImagenSalaHotel) {
			this.idImagenSalaHotel = idImagenSalaHotel;
		}

		public String getUrlImagenSalaHotel() {
			return urlImagenSalaHotel;
		}

		public void setUrlImagenSalaHotel(String urlImagenSalaHotel) {
			this.urlImagenSalaHotel = urlImagenSalaHotel;
		}

		public SalaHotel getSalaHotel() {
			return salaHotel;
		}

		public void setSalaHotel(SalaHotel salaHotel) {
			this.salaHotel = salaHotel;
		}

		@Override
		public String toString() {
			return "ImagenesSalaHotel [idImagenSalaHotel=" + idImagenSalaHotel + ", urlImagenSalaHotel="
					+ urlImagenSalaHotel + "]";
		}
	    
	    
	    
}
