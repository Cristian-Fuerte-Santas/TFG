package com.tfg.imf.modelo;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;

@Service
public class GestorCarrito {

	public GestorCarrito() {
		super();
		System.out.println("Creando instancia de GestorCarrito");
	}

	
	//para añadir los elementos al carrito. Cojemos los datos de session, y asi no se crea una tabla en la base de datos para carrito
	@Transactional
	public void agregarItemAlCarrito(HttpSession session, Object item) {

		System.out.println("session.toString(): ");
		System.out.println("====================");
		System.out.println(session.toString());

		System.out.println("item.toString(): ");
		System.out.println("====================");
		System.out.println(item.toString());

		List<Object> carritoTemporal = (List<Object>) session.getAttribute("carritoTemporal");
		if (carritoTemporal == null) {
			carritoTemporal = new ArrayList<>();
		}
		carritoTemporal.add(item);
		session.setAttribute("carritoTemporal", carritoTemporal);
	}

}
