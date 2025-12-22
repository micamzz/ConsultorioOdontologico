<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html lang="en">

<!DOCTYPE html>
<html lang="en">

<%@ include file="components/header.jsp"%>
<%@ include file="components/bodyprimeraparte.jsp"%>

<h1>Alta Usuarios</h1>

<form class="user" action="SvUsuarios" method="POST">

	<div class="form-group col">

		<div class="col-sm-6 mb-3">
			<input type="text" class="form-control form-control-user" id="nombreUsu" name="nombreUsu"
				placeholder="Nombre de Usuario">
		</div>

		<div class="col-sm-6 mb-3">
			<input type="password" class="form-control form-control-user"
				id="contrasenia" name="contrasenia" placeholder="Contraseña">
		</div>


		<div class="col-sm-6 mb-3">
			<input type="text" class="form-control form-control-user"
				id="rol" name="rol"  placeholder="Rol">
		</div>

		 <!-- Faltaria lo de Horario y usuarios -->
	
	</div>


	<button class="btn btn-primary btn-user btn-block" type="submit">
		Crear Usuario </button>

</form>

<%@ include file="components/footer.jsp"%>