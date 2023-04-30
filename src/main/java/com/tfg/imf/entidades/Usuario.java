package com.tfg.imf.entidades;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;

import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;



@Entity
@Table(name = "usuario")
public class Usuario {

	// 1. CREO ATRIBUTOS
	
	//USO DE ANOTACIOENS PARA VALIDAR: https://programandoointentandolo.com/2019/03/spring-boot-validacion-spring-mvc-y-thymeleaf.html
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer idUsuario;

	@NotEmpty(message="El campo no puede estar vacio")
	//@Size(min = 2, max=40, message = "El nombre de Empresa debe ser entre 2 y 40 caracteres")
	private String nombreEmpresa;
	
	@Column(name = "nifEmpresa", length = 9)	
	//@NotEmpty(message="El campo no puede estar vacio")
	//@Pattern(regexp = "^[A-Z]\\d{8}$", message = "La primera letra debe ser mayúscula y debe seguirle 8 digitos") //(^[A-Z])que empiece por letra + (\\d{8}) y el resto de digitos + ($)final de cadena
	private String nifEmpresa;
	
	//@NotEmpty(message="El campo no puede estar vacio")	
	//@Size(min = 2, max=40, message = "El nombre de Empresa debe ser entre 2 y 40 caracteres")
	private String nombreUsuario;
	
	//https://es.stackoverflow.com/questions/453176/como-validar-correctamente-un-email-con-expresiones-regulares
	//@NotEmpty(message="El campo no puede estar vacio")
	//@Email(regexp = "[a-zA-Z0-9_]+([.][a-zA-Z0-9_]+)*@[a-zA-Z0-9_]+([.][a-zA-Z0-9_]+)*[.][a-zA-Z]{2,5}", message = "Antes y después de la @ los símbolos válidos son '.', '_','-'. El dominio debe ser mínimo de dos letras")
	private String emailUsuario;
	
	//@NotEmpty(message="El campo no puede estar vacio")
	private String telefonoUsuario;
	
	//@NotEmpty(message="El campo no puede estar vacio")
	//@Size(min = 8, max = 12, message = "La contraseña debe tener entre 8 y 12 digitos")
	private String contraseniaUsuario;

	
	
	public Usuario() {
		super();
		System.out.println("Accediendo a la entidad Usuario.java");
	}

	
	
	// 2. CREO RELACIONES
	// https://www.youtube.com/watch?v=T_cWyhhy0yw
	@ManyToMany
	@JoinTable(name = "usuarios_hoteles", joinColumns = @JoinColumn(name = "idUsuario"), inverseJoinColumns = @JoinColumn(name = "idHotel"))
	private List<Hotel> hotelesGuardados = new ArrayList<>();

	@ManyToMany
	@JoinTable(name = "usuarios_restaurantes", joinColumns = @JoinColumn(name = "idUsuario"), inverseJoinColumns = @JoinColumn(name = "idHotel"))
	private List<Hotel> restaurantesGuardados = new ArrayList<>();

	@ManyToMany
	@JoinTable(name = "usuarios_actividades", joinColumns = @JoinColumn(name = "idUsuario"), inverseJoinColumns = @JoinColumn(name = "idHotel"))
	private List<Hotel> actividadesGuardados = new ArrayList<>();

	@ManyToMany
	@JoinTable(name = "usuarios_transportes", joinColumns = @JoinColumn(name = "idUsuario"), inverseJoinColumns = @JoinColumn(name = "idHotel"))
	private List<Hotel> transportesGuardados = new ArrayList<>();

	
	
	
	public Integer getIdUsuario() {
		return idUsuario;
	}

	public void setIdUsuario(Integer idUsuario) {
		this.idUsuario = idUsuario;
	}

	public String getNombreEmpresa() {
		return nombreEmpresa;
	}

	public void setNombreEmpresa(String nombreEmpresa) {
		this.nombreEmpresa = nombreEmpresa;
	}

	public String getNifEmpresa() {
		return nifEmpresa;
	}

	public void setNifEmpresa(String nifEmpresa) {
		this.nifEmpresa = nifEmpresa;
	}

	public String getNombreUsuario() {
		return nombreUsuario;
	}

	public void setNombreUsuario(String nombreUsuario) {
		this.nombreUsuario = nombreUsuario;
	}

	public String getEmailUsuario() {
		return emailUsuario;
	}

	public void setEmailUsuario(String emailUsuario) {
		this.emailUsuario = emailUsuario;
	}

	public String getTelefonoUsuario() {
		return telefonoUsuario;
	}

	public void setTelefonoUsuario(String telefonoUsuario) {
		this.telefonoUsuario = telefonoUsuario;
	}

	public String getContraseniaUsuario() {
		return contraseniaUsuario;
	}

	public void setContraseniaUsuario(String contraseniaUsuario) {
		this.contraseniaUsuario = contraseniaUsuario;
	}

	public List<Hotel> getHotelesGuardados() {
		return hotelesGuardados;
	}

	public void setHotelesGuardados(List<Hotel> hotelesGuardados) {
		this.hotelesGuardados = hotelesGuardados;
	}

	public List<Hotel> getRestaurantesGuardados() {
		return restaurantesGuardados;
	}

	public void setRestaurantesGuardados(List<Hotel> restaurantesGuardados) {
		this.restaurantesGuardados = restaurantesGuardados;
	}

	public List<Hotel> getActividadesGuardados() {
		return actividadesGuardados;
	}

	public void setActividadesGuardados(List<Hotel> actividadesGuardados) {
		this.actividadesGuardados = actividadesGuardados;
	}

	public List<Hotel> getTransportesGuardados() {
		return transportesGuardados;
	}

	public void setTransportesGuardados(List<Hotel> transportesGuardados) {
		this.transportesGuardados = transportesGuardados;
	}
	
	
	
	
	
	
	

	@Override
	public String toString() {
		return "Usuario [idUsuario=" + idUsuario + ", nombreEmpresa=" + nombreEmpresa + ", nifEmpresa=" + nifEmpresa
				+ ", nombreUsuario=" + nombreUsuario + ", emailUsuario=" + emailUsuario + ", telefonoUsuario="
				+ telefonoUsuario + ", contraseniaUsuario=" + contraseniaUsuario + "]";
	}

}
