package com.tfg.imf.entidades;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "imagen_menu_restaurante")

public class ImagenesMenuRestaurante {
	
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer idImagenMenuRestaurante;
    private String urlImagenMenuRestaurante;
    
    
    @ManyToOne
    @JoinColumn(name = "id_menu_restaurante")
    private MenuRestaurante menuRestaurante;


	public ImagenesMenuRestaurante() {
		super();
		System.out.println("Accediendo a la entidad ImagenesMenuRestaurante.java");
	}


	public Integer getIdImagenMenuRestaurante() {
		return idImagenMenuRestaurante;
	}


	public void setIdImagenMenuRestaurante(Integer idImagenMenuRestaurante) {
		this.idImagenMenuRestaurante = idImagenMenuRestaurante;
	}


	public String getUrlImagenMenuRestaurante() {
		return urlImagenMenuRestaurante;
	}


	public void setUrlImagenMenuRestaurante(String urlImagenMenuRestaurante) {
		this.urlImagenMenuRestaurante = urlImagenMenuRestaurante;
	}



	public MenuRestaurante getMenuRestaurante() {
		return menuRestaurante;
	}


	public void setMenuRestaurante(MenuRestaurante menuRestaurante) {
		this.menuRestaurante = menuRestaurante;
	}


	@Override
	public String toString() {
		return "ImagenesMenuRestaurante [idImagenMenuRestaurante=" + idImagenMenuRestaurante
				+ ", urlImagenMenuRestaurante=" + urlImagenMenuRestaurante +  "]";
	}
    
    

}
