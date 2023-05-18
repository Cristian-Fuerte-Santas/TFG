package com.tfg.imf.persistencia;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.tfg.imf.entidades.Destino;

public interface IRepositorioDestino extends JpaRepository<Destino, Integer> {

	@Query(value = "SELECT * FROM destino", nativeQuery = true)
	List<Destino> verTodosLosDestinos();

}
