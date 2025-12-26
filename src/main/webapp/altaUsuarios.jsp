<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="logica.Rol" %>

<%@ include file="components/header.jsp"%>
<%@ include file="components/bodyprimeraparte.jsp"%>

<div class="container-fluid">
    <h1 class="h3 mb-4 text-gray-800">Alta de Usuarios</h1>
     <p class="mb-4 text-gray-600">En este apartado, podrá dar de alta a nuevos usuarios para que puedan acceder y manipular las diferentes funciones del sistema según su rol asignado.</p>

    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary">Credenciales del Sistema</h6>
        </div>
        <div class="card-body">
            <form class="user" action="SvUsuarios" method="POST">

                <div class="row">
                    <div class="col-md-6 mb-3">
                        <label class="form-label font-weight-bold">Nombre de Usuario</label>
                        <input type="text" class="form-control" name="nombreUsu" 
                               id="nombreUsu" placeholder="Ej: admin_clinica" required>
                    </div>
                    <div class="col-md-6 mb-3">
                        <label class="form-label font-weight-bold">Contraseña</label>
                        <input type="password" class="form-control" name="contrasenia" 
                               id="contrasenia" placeholder="••••••••" required>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-6 mb-3">
                        <label class="form-label font-weight-bold">Rol de Usuario</label>
                        <select class="form-control" name="rol" id="rol">
                            <% for (Rol r : Rol.values()) { 
                                String nombreRol = r.toString().toLowerCase();
                                nombreRol = nombreRol.substring(0, 1).toUpperCase() + nombreRol.substring(1);
                            %>
                                <option value="<%= r.name() %>"><%= nombreRol %></option>
                            <% } %>
                        </select>
                    </div>
                </div>

                <hr>
                
                <div class="row mt-4">
                    <div class="col-md-12 text-center">
                        <button type="submit" class="btn btn-primary shadow-sm px-5">
                           Crear Usuario
                        </button>
                    </div>
                </div>

            </form>
        </div>
    </div>
</div>

<%@ include file="components/footer.jsp"%>