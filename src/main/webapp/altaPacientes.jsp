<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="logica.Paciente" %>

<%@ include file="components/header.jsp"%>
<%@ include file="components/bodyprimeraparte.jsp"%>

<div class="container-fluid">
    <h1 class="h3 mb-2 text-gray-800">Alta de Pacientes</h1>
    <p class="mb-4 text-gray-600">Complete la información requerida para registrar un nuevo paciente en el sistema de gestión clínica.</p>


    <% if (request.getParameter("status") != null && request.getParameter("status").equals("success")) { %>
    <div class="alert alert-success alert-dismissible fade show" role="alert">
        El paciente fue registrado correctamente.
        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
            <span aria-hidden="true">&times;</span>
        </button>
    </div>
<% } %>


    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary">Información Personal</h6>
        </div>
        <div class="card-body">
            <form class="user" action="SvPacientes" method="POST">

        
                <div class="row">
                    <div class="col-md-6 mb-3">
                        <label class="form-label font-weight-bold">Nombre</label>
                        <input type="text" class="form-control" name="nombre" placeholder="Nombre" required>
                    </div>
                    <div class="col-md-6 mb-3">
                        <label class="form-label font-weight-bold">Apellido</label>
                        <input type="text" class="form-control" name="apellido" placeholder="Apellido" required>
                    </div>
                </div>

          
                <div class="row">
                    <div class="col-md-6 mb-3">
                        <label class="form-label font-weight-bold">DNI</label>
                        <input type="text" class="form-control" name="dni" placeholder="Sin puntos ni espacios" required>
                    </div>
                    <div class="col-md-6 mb-3">
                        <label class="form-label font-weight-bold">Fecha de Nacimiento</label>
                        <input type="date" class="form-control" name="fechanac" required>
                    </div>
                </div>

            
                   <div class="row">
                    <div class="col-md-4 mb-3">
                        <label class="form-label font-weight-bold">Teléfono</label>
                        <input type="text" class="form-control" name="telefono" placeholder="Ej: 1122334455">
                    </div>
                    <div class="col-md-8 mb-3">
                        <label class="form-label font-weight-bold">Dirección</label>
                        <input type="text" class="form-control" name="direccion" placeholder="Calle, número y localidad">
                    </div>
                </div>

 
                <div class="row">
                    <div class="col-md-6 mb-3">
                        <label class="form-label font-weight-bold">¿Tiene Obra Social?</label>
                        <select class="form-control" name="tiene_OS">
                            <option value="true">Sí, posee cobertura</option>
                            <option value="false">No, atención particular</option>
                        </select>
                    </div>
                </div>

                <hr>
                
                <div class="row mt-4">
                    <div class="col-md-12 text-center">
                        <button type="submit" class="btn btn-primary shadow-sm px-5"> Registrar</button>
                    </div>
                </div>

            </form>
        </div>
    </div>
</div>

<%@ include file="components/footer.jsp"%>