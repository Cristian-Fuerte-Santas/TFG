package com.tfg.imf.persistencia;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.tfg.imf.entidades.SalaHotel;

public interface IRepositorioSalaHotel extends JpaRepository<SalaHotel, Integer> {

	@Query(value = "SELECT * FROM sala_hotel", nativeQuery = true)
	List<SalaHotel> verTodasLasSalasHotel();

}
