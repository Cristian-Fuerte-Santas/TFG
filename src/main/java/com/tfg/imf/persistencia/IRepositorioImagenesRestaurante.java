package com.tfg.imf.persistencia;

import org.springframework.data.jpa.repository.JpaRepository;

import com.tfg.imf.entidades.ImagenesRestaurante;

public interface IRepositorioImagenesRestaurante extends JpaRepository<ImagenesRestaurante, Integer> {

}
