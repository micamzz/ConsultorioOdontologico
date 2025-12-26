<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="logica.Especialidad" %>

<%@ include file="components/header.jsp"%>
<%@ include file="components/bodyprimeraparte.jsp"%>

<div class="container-fluid">
    <h1 class="h3 mb-4 text-gray-800">Alta de Odontólogos</h1>

    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary">Datos del Profesional</h6>
        </div>
        <div class="card-body">
            <form class="user" action="SvOdontologos" method="POST">

                <div class="row">
                
                    <div class="col-md-4 mb-3">
                        <label class="form-label">Nombre</label>
                        <input type="text" class="form-control" name="nombre" placeholder="Nombre" required>
                    </div>
                    <div class="col-md-4 mb-3">
                        <label class="form-label">Apellido</label>
                        <input type="text" class="form-control" name="apellido" placeholder="Apellido" required>
                    </div>
                       <div class="col-md-4 mb-3">
                        <label class="form-label">DNI</label>
                        <input type="text" class="form-control" name="dni" placeholder="Ej: 40123456" required>
                    </div>
                </div>

                <div class="row">
                <div class="col-md-6 mb-3">
                        <label class="form-label">Fecha de Nacimiento</label>
                        <input type="date" class="form-control" name="fechanac" required>
                    </div>
                    
                    <div class="col-md-6 mb-3">
                        <label class="form-label">Teléfono</label>
                        <input type="text" class="form-control" name="telefono" placeholder="Cod. área + número">
                    </div>
                   
                </div>

                <div class="row">
                    <div class="col-md-8 mb-3">
                        <label class="form-label">Dirección</label>
                        <input type="text" class="form-control" name="direccion" placeholder="Calle, número, localidad">
                    </div>
                    <div class="col-md-4 mb-3">
                        <label class="form-label">Especialidad</label>
                        <select class="form-control" name="especialidad">
                            <% for (Especialidad espe : Especialidad.values()) { 
                                String nombre = espe.toString().toLowerCase();
                                nombre = nombre.substring(0, 1).toUpperCase() + nombre.substring(1);
                            %>
                                <option value="<%= espe.name() %>"><%= nombre %></option>
                            <% } %>
                        </select>
                    </div>
                </div>

                <hr>
            
                <div class="row mt-4">
    <div class="col-md-12 text-center"> 
        <button type="submit" class="btn btn-primary shadow-sm px-5">
 Registrar Odontólogo
        </button>
    </div>
</div>

            </form>
        </div>
    </div>
</div>

<%@ include file="components/footer.jsp"%>