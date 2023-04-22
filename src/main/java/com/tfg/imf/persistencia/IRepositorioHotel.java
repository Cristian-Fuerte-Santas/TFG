package com.tfg.imf.persistencia;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.tfg.imf.entidades.Hotel;


public interface IRepositorioHotel extends JpaRepository<Hotel, Integer>  {
	
	@Query(value = "SELECT * FROM hotel", nativeQuery = true)
	List<Hotel> verTodosLosHoteles();
	

}
