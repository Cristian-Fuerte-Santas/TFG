package com.tfg.imf.entidades;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.Table;


@Entity
@Table(name = "transporte")
public class Transporte {

	// 1. CREO ATRIBUTOS

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer idTransporte;
	private String nombreEmpresaTransporte;
	private int cantidadAutobuses;
	private float precioDiaAutobus;

	// 2. CREO RELACIONES

	@ManyToOne
	@JoinColumn(name = "id_destino")
	private Destino destino;

	// Relacion ManyToMany: https://www.youtube.com/watch?v=T_cWyhhy0yw
	@ManyToMany(mappedBy = "transportesGuardados")
	private List<Usuario> usuariosGuardados = new ArrayList<>();

	public Transporte() {
		super();
		System.out.println("Accediendo a la entidad Transporte.java");
	}

	public Integer getIdTransporte() {
		return idTransporte;
	}

	public void setIdTransporte(Integer idTransporte) {
		this.idTransporte = idTransporte;
	}

	public String getNombreEmpresaTransporte() {
		return nombreEmpresaTransporte;
	}

	public void setNombreEmpresaTransporte(String nombreEmpresaTransporte) {
		this.nombreEmpresaTransporte = nombreEmpresaTransporte;
	}

	public int getCantidadAutobuses() {
		return cantidadAutobuses;
	}

	public void setCantidadAutobuses(int cantidadAutobuses) {
		this.cantidadAutobuses = cantidadAutobuses;
	}

	public float getPrecioDiaAutobus() {
		return precioDiaAutobus;
	}

	public void setPrecioDiaAutobus(float precioDiaAutobus) {
		this.precioDiaAutobus = precioDiaAutobus;
	}

	public Destino getDestino() {
		return destino;
	}

	public void setDestino(Destino destino) {
		this.destino = destino;
	}

	public List<Usuario> getUsuariosGuardados() {
		return usuariosGuardados;
	}

	public void setUsuariosGuardados(List<Usuario> usuariosGuardados) {
		this.usuariosGuardados = usuariosGuardados;
	}

	@Override
	public String toString() {
		return "Transporte [idTransporte=" + idTransporte + ", nombreEmpresaTransporte=" + nombreEmpresaTransporte
				+ ", cantidadAutobuses=" + cantidadAutobuses + ", precioDiaAutobus=" + precioDiaAutobus + ", destino="
				+ destino + ", usuariosGuardados=" + usuariosGuardados + "]";
	}
	
	
	

}
