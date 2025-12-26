<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
	<%@ page import="logica.Especialidad" %>
<html lang="en">

<!DOCTYPE html>
<html lang="en">

<%@ include file="components/header.jsp"%>
<%@ include file="components/bodyprimeraparte.jsp"%>

<h1>Alta Odontólogos</h1>


<form class="user" action="SvOdontologos" method="POST"> <div class="form-group col">
        <div class="col-sm-6 mb-3">
            <input type="text" class="form-control" name="dni" placeholder="DNI">
        </div>
        <div class="col-sm-6 mb-3">
            <input type="text" class="form-control" name="nombre" placeholder="Nombre">
        </div>
        <div class="col-sm-6 mb-3">
            <input type="text" class="form-control" name="apellido" placeholder="Apellido">
        </div>
        <div class="col-sm-6 mb-3">
            <input type="text" class="form-control" name="telefono" placeholder="Teléfono">
        </div>
        <div class="col-sm-6 mb-3">
            <input type="text" class="form-control" name="direccion" placeholder="Dirección">
        </div>
        <div class="col-sm-6 mb-3">
            <input type="date" class="form-control" name="fechanac"> </div>
        <div class="col-sm-6 mb-3">
    <label for="especialidad">Especialidad</label>
                      <select class="form-control" name="especialidad">
    <% for (Especialidad espe : Especialidad.values()) { 
        String nombre = espe.toString().toLowerCase();
        nombre = nombre.substring(0, 1).toUpperCase() + nombre.substring(1);
    %>
        <option value="<%= espe.name() %>">
            <%= nombre %>
        </option>
    <% } %>
</select>
</div>
        
        </div>

    <button type="submit" class="btn btn-primary btn-user btn-block">
        Crear Odontólogo
    </button>
</form>

<%@ include file="components/footer.jsp"%>