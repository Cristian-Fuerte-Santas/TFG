package com.tfg.imf.persistencia;



import org.springframework.data.jpa.repository.JpaRepository;

import com.tfg.imf.entidades.MenuRestaurante;


public interface IRepositorioMenuRestaurante  extends JpaRepository<MenuRestaurante, Integer> {

	
	
	
}

