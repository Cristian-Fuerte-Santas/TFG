package com.tfg.imf.persistencia;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.tfg.imf.entidades.Actividad;


public interface IRepositorioActividad extends JpaRepository<Actividad, Integer> {

	
	@Query(value = "SELECT * FROM actividad", nativeQuery = true)
	List<Actividad> verTodasLasActividades();
}
