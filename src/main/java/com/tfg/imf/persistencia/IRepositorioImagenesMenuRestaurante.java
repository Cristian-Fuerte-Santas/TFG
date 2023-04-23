package com.tfg.imf.persistencia;

import org.springframework.data.jpa.repository.JpaRepository;


import com.tfg.imf.entidades.ImagenesMenuRestaurante;

public interface IRepositorioImagenesMenuRestaurante extends JpaRepository<ImagenesMenuRestaurante, Integer>  {

}

