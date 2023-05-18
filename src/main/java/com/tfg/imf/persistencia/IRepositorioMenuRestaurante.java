package com.tfg.imf.persistencia;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.tfg.imf.entidades.MenuRestaurante;

public interface IRepositorioMenuRestaurante extends JpaRepository<MenuRestaurante, Integer> {

	@Query(value = "SELECT * FROM menu_restaurante", nativeQuery = true)
	List<MenuRestaurante> verTodosLosMenusRestaurantes();

}
