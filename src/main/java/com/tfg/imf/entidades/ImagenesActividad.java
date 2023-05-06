package com.tfg.imf.entidades;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table (name = "imagen_actividad" )
public class ImagenesActividad {
	
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer idImagenActividad;
    private String urlImagenActividad;
    
    @ManyToOne
    @JoinColumn(name = "id_actividad")
    private Actividad actividad;

	public ImagenesActividad() {
		super();
		System.out.println("Accediendo a la entidad ImagenesActividad.java");
	}

	public Integer getIdImagenActividad() {
		return idImagenActividad;
	}

	public void setIdImagenActividad(Integer idImagenActividad) {
		this.idImagenActividad = idImagenActividad;
	}

	public String getUrlImagenActividad() {
		return urlImagenActividad;
	}

	public void setUrlImagenActividad(String urlImagenActividad) {
		this.urlImagenActividad = urlImagenActividad;
	}

	public Actividad getActividad() {
		return actividad;
	}

	public void setActividad(Actividad actividad) {
		this.actividad = actividad;
	}
    
    
    

}
