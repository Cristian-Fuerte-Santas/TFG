package com.tfg.imf.entidades;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;



@Entity
@Table(name="menuHotel")
public class MenuHotel {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer idMenuResurante;	
	private float precioMenuNormal;
	private float precioMenuVegetariano;
	private float precioMenuVegano;
	private float precioMenuCeliaco;
	
	
	public MenuHotel() {
		super();
		System.out.println("Accediendo a la entidad MenuHotel.java");
	}


	public Integer getIdMenuResurante() {
		return idMenuResurante;
	}


	public void setIdMenuResurante(Integer idMenuResurante) {
		this.idMenuResurante = idMenuResurante;
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


	@Override
	public String toString() {
		return "MenuHotel [idMenuResurante=" + idMenuResurante + ", precioMenuNormal=" + precioMenuNormal
				+ ", precioMenuVegetariano=" + precioMenuVegetariano + ", precioMenuVegano=" + precioMenuVegano
				+ ", precioMenuCeliaco=" + precioMenuCeliaco + "]";
	}
	
	
}
