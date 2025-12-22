<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html lang="en">

<!DOCTYPE html>
<html lang="en">

<%@ include file="components/header.jsp"%>
<%@ include file="components/bodyprimeraparte.jsp"%>

<h1>Alta Odontólogos</h1>

<form class="user">

	<div class="form-group col">

		<div class="col-sm-6 mb-3">
			<input type="text" class="form-control form-control-user" id="dni"
				placeholder="Número de Documento">
		</div>

		<div class="col-sm-6 mb-3">
			<input type="text" class="form-control form-control-user"
				id="nombre" placeholder="Nombre">
		</div>


		<div class="col-sm-6 mb-3">
			<input type="text" class="form-control form-control-user"
				id="apellido" placeholder="Apellido">
		</div>

		<div class="col-sm-6 mb-3">
			<input type="text" class="form-control form-control-user"
				id="telefono" placeholder="Teléfono	">
		</div>

          <div class="col-sm-6 mb-3">
			<input type="text" class="form-control form-control-user"
				id="direccion" placeholder="Dirección">
		</div>
		
		<div class="col-sm-6 mb-3">
			<input type="text" class="form-control form-control-user"
				id="fechanac" placeholder="Fecha de nacimiento">
		</div>
		
		<div class="col-sm-6 mb-3">
			<input type="text" class="form-control form-control-user"
				id="especialidad" placeholder="Especialidad">
		</div>
		
		 <!-- Faltaria lo de Horario y usuarios -->
	
	</div>



	<a href="" class="btn btn-primary btn-user btn-block">
		Crear alta </a>

</form>

<%@ include file="components/footer.jsp"%>