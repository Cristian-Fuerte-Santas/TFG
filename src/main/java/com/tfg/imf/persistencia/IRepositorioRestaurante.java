package com.tfg.imf.persistencia;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.tfg.imf.entidades.Restaurante;

public interface IRepositorioRestaurante extends JpaRepository<Restaurante, Integer> {

	@Query(value = "SELECT * FROM restaurante", nativeQuery = true)
	List<Restaurante> verTodosLosRestaurantes();

}