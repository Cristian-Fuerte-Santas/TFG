package com.tfg.imf.persistencia;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.tfg.imf.entidades.Reserva;

public interface IRepositorioReserva extends JpaRepository<Reserva, Integer> {

	@Query(value = "SELECT * FROM reserva", nativeQuery = true)
	List<Reserva> verTodasLasReservas();

	@Query("SELECT r FROM Reserva r WHERE r.usuario.idUsuario = :idUsuario")
	List<Reserva> findReservasByIdUsuario(@Param("idUsuario") Integer idUsuario);

}
