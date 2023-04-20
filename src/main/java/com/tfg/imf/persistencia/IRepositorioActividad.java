package com.tfg.imf.persistencia;

import org.springframework.data.jpa.repository.JpaRepository;

import com.tfg.imf.entidades.Actividad;

public interface IRepositorioActividad extends JpaRepository<Actividad, Integer> {

}
