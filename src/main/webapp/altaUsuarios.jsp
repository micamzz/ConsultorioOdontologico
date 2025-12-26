<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ page import="logica.Rol" %>
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
    <label for="rol">Seleccione un Rol:</label>
    <select class="form-control" name="rol" id="rol" 
            style="border-radius: 10rem; height: 3.1rem; text-transform: capitalize;">
        
        <% for (Rol r : Rol.values()) { 
            String nombreRol = r.toString().toLowerCase();
        %>
            <option value="<%= r.name() %>">
                <%= nombreRol %>
            </option>
        <% } %>
    </select>
</div>

	
	</div>


	<button class="btn btn-primary btn-user btn-block" type="submit">
		Crear Usuario </button>

</form>

<%@ include file="components/footer.jsp"%>