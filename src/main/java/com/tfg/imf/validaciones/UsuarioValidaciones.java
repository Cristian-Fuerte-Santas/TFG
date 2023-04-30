package com.tfg.imf.validaciones;

public class UsuarioValidaciones {

	public boolean isValidNombreEmpresa(String empresa) {

		return empresa != null && !empresa.isEmpty() && empresa.length() >= 2 && empresa.length() <= 40;

	}

	public boolean isValidNifEmpresa(String nifEmpresa) {

		String nifRegex = "^[A-Z]\\d{8}$";

		return nifEmpresa != null && !nifEmpresa.isEmpty() && nifEmpresa.matches(nifRegex);

	}

	public boolean isValidNombreUsuario(String nombreUsuario) {

		return nombreUsuario != null && !nombreUsuario.isEmpty() && nombreUsuario.length() > 2
				&& nombreUsuario.length() < 40;

	}

	public boolean isValidEmail(String email) {

		String emailRegex = "[a-zA-Z0-9_]+([.][a-zA-Z0-9_]+)*@[a-zA-Z0-9_]+([.][a-zA-Z0-9_]+)*[.][a-zA-Z]{2,5}";

		return email != null && !email.isEmpty() && email.matches(emailRegex);

	}

	public boolean isValidPassword(String password) {

		return password != null && !password.isEmpty() && password.length() >= 5 && password.length() <= 12;

	}

	/// Pendiente validacion de telefono

}