package com.tfg.imf.entidades;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;

import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;

import javax.persistence.Table;

import javax.validation.constraints.NotEmpty;

import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;

@Entity
@Table(name = "usuario")
@JsonIdentityInfo(generator = ObjectIdGenerators.PropertyGenerator.class, property = "idUsuario")
public class Usuario {

	// 1. CREO ATRIBUTOS

	// USO DE ANOTACIOENS PARA VALIDAR:
	// https://programandoointentandolo.com/2019/03/spring-boot-validacion-spring-mvc-y-thymeleaf.html

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer idUsuario;

	@NotEmpty(message = "El campo no puede estar vacio")
	private String nombreEmpresa;

	@Column(name = "nifEmpresa", length = 9)
	private String nifEmpresa;

	private String nombreUsuario;

	private String emailUsuario;

	private String telefonoUsuario;

	private String contraseniaUsuario;

	// 2. CREO RELACIONES
	// https://www.youtube.com/watch?v=T_cWyhhy0yw
	@ManyToMany
	@JoinTable(name = "usuarios_hoteles", joinColumns = @JoinColumn(name = "idUsuario"), inverseJoinColumns = @JoinColumn(name = "idHotel"))
	private List<Hotel> hotelesGuardados = new ArrayList<>();

	@ManyToMany
	@JoinTable(name = "usuarios_restaurantes", joinColumns = @JoinColumn(name = "idUsuario"), inverseJoinColumns = @JoinColumn(name = "idRestaurante"))
	private List<Hotel> restaurantesGuardados = new ArrayList<>();

	@ManyToMany
	@JoinTable(name = "usuarios_actividades", joinColumns = @JoinColumn(name = "idUsuario"), inverseJoinColumns = @JoinColumn(name = "idActividad"))
	private List<Actividad> actividadesGuardados = new ArrayList<>();

	@OneToMany(mappedBy = "usuario", cascade = CascadeType.ALL, orphanRemoval = true)
	private List<Reserva> reservas = new ArrayList<>();

	public Usuario() {
		super();
		System.out.println("Accediendo a la entidad Usuario.java");
	}

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

	public List<Actividad> getActividadesGuardados() {
		return actividadesGuardados;
	}

	public void setActividadesGuardados(List<Actividad> actividadesGuardados) {
		this.actividadesGuardados = actividadesGuardados;
	}

	@Override
	public String toString() {
		return "Usuario [idUsuario=" + idUsuario + ", nombreEmpresa=" + nombreEmpresa + ", nifEmpresa=" + nifEmpresa
				+ ", nombreUsuario=" + nombreUsuario + ", emailUsuario=" + emailUsuario + ", telefonoUsuario="
				+ telefonoUsuario + ", contraseniaUsuario=" + contraseniaUsuario + ", hotelesGuardados="
				+ hotelesGuardados + ", restaurantesGuardados=" + restaurantesGuardados + ", actividadesGuardados="
				+ actividadesGuardados + "]";
	}

}
