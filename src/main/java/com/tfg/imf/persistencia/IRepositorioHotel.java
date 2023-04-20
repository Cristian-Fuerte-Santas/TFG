package com.tfg.imf.persistencia;

import org.springframework.data.jpa.repository.JpaRepository;

import com.tfg.imf.entidades.Hotel;

public interface IRepositorioHotel extends JpaRepository<Hotel, Integer>  {

}
