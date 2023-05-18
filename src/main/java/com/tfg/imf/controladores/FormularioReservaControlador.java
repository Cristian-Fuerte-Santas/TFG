package com.tfg.imf.controladores;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tfg.imf.modelo.GestorReserva;
import com.tfg.imf.persistencia.IRepositorioActividad;
import com.tfg.imf.persistencia.IRepositorioHotel;
import com.tfg.imf.persistencia.IRepositorioReserva;
import com.tfg.imf.persistencia.IRepositorioRestaurante;
import com.tfg.imf.persistencia.IRepositorioSalaHotel;
import com.tfg.imf.persistencia.IRepositorioUsuario;

import com.tfg.imf.entidades.*;

import java.util.List;
import java.util.Optional;

import java.util.ArrayList;

import java.util.Iterator;

@Controller
public class FormularioReservaControlador {

	@Autowired
	private GestorReserva gestorReserva;

	@Autowired
	private IRepositorioUsuario repositorioUsuario;

	@Autowired
	private IRepositorioActividad repositorioActividad;

	@Autowired
	private IRepositorioHotel repositorioHotel;

	@Autowired
	private IRepositorioRestaurante repositorioRestaurante;

	@Autowired
	private IRepositorioSalaHotel repositorioSalaHotel;

	@Autowired
	private IRepositorioReserva repositorioReserva;

	public FormularioReservaControlador() {
		super();
		System.out.println("Creando una instancia de FormularioReservaControlador");
	}

	@PostMapping("/confirmarReserva")
	public String confirmarReserva(@RequestParam("itemId") Integer itemId, HttpSession session, Model model) {

		System.out.println("FormularioReservaControlador.confirmarReserva");

		// imprime el itemId que se está recibiendo
		System.out.println("=================== ITEM ID ===============");
		System.out.println("ItemId recibido: " + itemId);

		System.out.println("Soy session to string: " + session.toString());

		// obtén la lista del carrito de la sesión
		List<Object> carritoTemporal = (List<Object>) session.getAttribute("carritoTemporal");

		// obtén el id del usuario de la sesión
		Integer idUsuario = (Integer) session.getAttribute("idUsuario");
		System.out.println("Soy el usuario del id: " + idUsuario);

		// imprime el carritoTemporal
		System.out.println("Carrito temporal: " + carritoTemporal);

		// busca el elemento en el carrito con el itemId proporcionado
		for (Object item : carritoTemporal) {

			if (item instanceof Hotel && ((Hotel) item).getIdHotel() == itemId) {

				// crea una nueva reserva
				Reserva reserva = new Reserva();

				// busca el Usuario en la base de datos
				Optional<Usuario> usuarioOptional = repositorioUsuario.findById(idUsuario);
				if (usuarioOptional.isPresent()) {
					Usuario usuario = usuarioOptional.get();
					reserva.setUsuario(usuario);
				} else {
					System.out.println("No se encontró al usuario con id: " + idUsuario);
					continue; // si no se encuentra al usuario, saltar a la siguiente iteración del bucle
				}

				// busca el Hotel en la base de datos
				Optional<Hotel> hotelOptional = repositorioHotel.findById(itemId);
				if (hotelOptional.isPresent()) {
					Hotel hotel = hotelOptional.get();
					reserva.setHotel(hotel);
				} else {
					System.out.println("No se encontró el hotel con id: " + itemId);
					continue; // si no se encuentra el hotel, saltar a la siguiente iteración del bucle
				}

				System.out.println("Soy reserva antes de insertarse: " + reserva.toString());

				// inserta la reserva en la base de datos
				gestorReserva.insertar(reserva);

				System.out.println("Reserva confirmada para el hotel con id: " + itemId);
			}

			else if (item instanceof SalaHotel && ((SalaHotel) item).getIdSalaHotel() == itemId) {

				// crea una nueva reserva
				Reserva reserva = new Reserva();

				// busca el Usuario en la base de datos
				Optional<Usuario> usuarioOptional = repositorioUsuario.findById(idUsuario);

				if (usuarioOptional.isPresent()) {
					Usuario usuario = usuarioOptional.get();
					reserva.setUsuario(usuario);
				} else {
					System.out.println("No se encontró al usuario con id: " + idUsuario);
					continue; // si no se encuentra al usuario, saltar a la siguiente iteración del bucle
				}

				// busca la Sala Hotel en la base de datos
				Optional<SalaHotel> salaHotelOptional = repositorioSalaHotel.findById(itemId);

				if (salaHotelOptional.isPresent()) {
					SalaHotel salaHotel = salaHotelOptional.get();
					reserva.setSalaHotel(salaHotel);
				} else {
					System.out.println("No se encontró el hotel con id: " + itemId);
					continue; // si no se encuentra el hotel, saltar a la siguiente iteración del bucle
				}

				System.out.println("Soy reserva antes de insertarse: " + reserva.toString());

				// inserta la reserva en la base de datos
				gestorReserva.insertar(reserva);

				System.out.println("Reserva confirmada para la sala hotel con id: " + itemId);

			}

			else if (item instanceof Restaurante && ((Restaurante) item).getIdRestaurante() == itemId) {

				// crea una nueva reserva
				Reserva reserva = new Reserva();

				// busca el Usuario en la base de datos
				Optional<Usuario> usuarioOptional = repositorioUsuario.findById(idUsuario);

				if (usuarioOptional.isPresent()) {
					Usuario usuario = usuarioOptional.get();
					reserva.setUsuario(usuario);
				} else {
					System.out.println("No se encontró al usuario con id: " + idUsuario);
					continue; // si no se encuentra al usuario, saltar a la siguiente iteración del bucle
				}

				// busca la Sala Hotel en la base de datos
				Optional<Restaurante> restauranteOptional = repositorioRestaurante.findById(itemId);

				if (restauranteOptional.isPresent()) {
					Restaurante restaurante = restauranteOptional.get();
					reserva.setRestaurante(restaurante);
				} else {
					System.out.println("No se encontró el restaurante con id: " + itemId);
					continue; // si no se encuentra el hotel, saltar a la siguiente iteración del bucle
				}
				// inserta la reserva en la base de datos
				gestorReserva.insertar(reserva);
				// lógica para confirmar la reserva del restaurante...
				System.out.println("Reserva confirmada para el restaurante con id: " + itemId);

			} else if (item instanceof Actividad && ((Actividad) item).getIdActividad() == itemId) {

				// crea una nueva reserva
				Reserva reserva = new Reserva();

				// busca el Usuario en la base de datos
				Optional<Usuario> usuarioOptional = repositorioUsuario.findById(idUsuario);

				if (usuarioOptional.isPresent()) {
					Usuario usuario = usuarioOptional.get();
					reserva.setUsuario(usuario);
				} else {
					System.out.println("No se encontró al usuario con id: " + idUsuario);
					continue; // si no se encuentra al usuario, saltar a la siguiente iteración del bucle
				}

				// busca la Sala Hotel en la base de datos
				Optional<Actividad> actividadOptional = repositorioActividad.findById(itemId);

				if (actividadOptional.isPresent()) {
					Actividad actividad = actividadOptional.get();
					reserva.setActividad(actividad);
				} else {
					System.out.println("No se encontró la actividad con id: " + itemId);
					continue; // si no se encuentra el hotel, saltar a la siguiente iteración del bucle
				}

				// inserta la reserva en la base de datos
				gestorReserva.insertar(reserva);

				// lógica para confirmar la reserva de la actividad...
				System.out.println("Reserva confirmada para la actividad con id: " + itemId);
			}
		}

		// Borramos ese elemento de la vista de carrito

		// Nuevo código para eliminar el item del carrito después de la reserva
		if (carritoTemporal != null) {
			Iterator<Object> iterator = carritoTemporal.iterator();
			while (iterator.hasNext()) {
				Object item = iterator.next();
				if ((item instanceof Hotel && ((Hotel) item).getIdHotel() == itemId)
						|| (item instanceof SalaHotel && ((SalaHotel) item).getIdSalaHotel() == itemId)
						|| (item instanceof Actividad && ((Actividad) item).getIdActividad() == itemId)
						|| (item instanceof Restaurante && ((Restaurante) item).getIdRestaurante() == itemId)) {
					iterator.remove();
				}
			}
			session.setAttribute("carritoTemporal", carritoTemporal);
		}

		// recargamos la pagina
		return "redirect:/carrito";
	}

	// se hace a traves del dto (data transfer objets) que se ha creado de reserva,
	// porque da problemas con el proxy de hibernate sino
	@GetMapping("/obtenerReservas/{idUsuario}")
	@ResponseBody
	public List<ReservaDTO> obtenerReservasPorUsuario(@PathVariable Integer idUsuario) {
		List<Reserva> reservas = repositorioReserva.findReservasByIdUsuario(idUsuario);
		List<ReservaDTO> reservasDTO = new ArrayList<>();

		for (Reserva reserva : reservas) {
			ReservaDTO dto = new ReservaDTO(reserva);
			reservasDTO.add(dto);
		}

		System.out.println("Reservas devueltas: " + reservasDTO);
		return reservasDTO;
	}

	@PostMapping("/eliminarReserva/{idReserva}")
	public ResponseEntity<Void> eliminarReserva(@PathVariable("idReserva") Integer idReserva, Model model) {
		// Aquí llama a tu servicio o repositorio para eliminar la reserva
		gestorReserva.borrar(idReserva);

		// Devuelve un código de estado HTTP 200 para indicar que la operación fue
		// exitosa
		return ResponseEntity.ok().build();
	}

}
