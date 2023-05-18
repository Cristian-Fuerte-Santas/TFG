package com.tfg.imf.entidades;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;

@Entity
@Table(name = "imagen_restaurante")

@JsonIdentityInfo(generator = ObjectIdGenerators.PropertyGenerator.class, property = "idImagenRestaurante")
public class ImagenesRestaurante {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer idImagenRestaurante;
	private String urlImagenRestaurante;

	@ManyToOne
	@JoinColumn(name = "id_restaurante")
	private Restaurante restaurante;

	public ImagenesRestaurante() {
		super();
		System.out.println("Accediendo a la entidad ImagenesRestaurante.java");
	}

	public Integer getIdImagenRestaurante() {
		return idImagenRestaurante;
	}

	public void setIdImagenRestaurante(Integer idImagenRestaurante) {
		this.idImagenRestaurante = idImagenRestaurante;
	}

	public String getUrlImagenRestaurante() {
		return urlImagenRestaurante;
	}

	public void setUrlImagenRestaurante(String urlImagenRestaurante) {
		this.urlImagenRestaurante = urlImagenRestaurante;
	}

	public Restaurante getRestaurante() {
		return restaurante;
	}

	public void setRestaurante(Restaurante restaurante) {
		this.restaurante = restaurante;
	}

}
