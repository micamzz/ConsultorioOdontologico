<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="logica.*"%>

<%@ include file="components/header.jsp"%>
<%@ include file="components/bodyprimeraparte.jsp"%>

<% Usuario usu = (Usuario) request.getSession().getAttribute("usuEditar"); %>

<div class="container-fluid">
    <h1 class="h3 mb-2 text-gray-800">Editar Usuario</h1>
    <p class="mb-4 text-gray-600">
       Usuario a editar: <strong><%= usu.getNombreUsuario() %></strong>.
    </p>

    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary">Configuración de Cuenta</h6>
        </div>
        <div class="card-body">
            <form class="user" action="SvEditUsuarios" method="POST">
                
                  <%--  Nombre de usuario--%>
                <div class="row">
                    <div class="col-md-6 mb-3">
                        <label class="form-label font-weight-bold">Nombre de Usuario</label>
                        <input type="text" class="form-control" name="nombreUsu" 
                               id="nombreUsu" value="<%= usu.getNombreUsuario() %>" required>
                    </div>
                    
                      <%--  Contraseña--%>
                    <div class="col-md-6 mb-3">
                        <label class="form-label font-weight-bold">Nueva Contraseña</label>
                        <input type="password" class="form-control" name="contrasenia" 
                               id="contrasenia" value="<%= usu.getContrasenia() %>" required>
                    </div>
                </div>
                    
                      <%--  Rol --%>
                <div class="row">
                    <div class="col-md-6 mb-3">
                        <label class="form-label font-weight-bold">Rol del Sistema</label>
                        <select class="form-control" name="rol" id="rol">
                            <% 
                                for (Rol r : Rol.values()) { 
                                    String selected = (r.name().equals(usu.getRol())) ? "selected" : ""; 
                                    String nombreRol = r.toString().toLowerCase();
                                    nombreRol = nombreRol.substring(0, 1).toUpperCase() + nombreRol.substring(1);
                            %>
                                <option value="<%= r.name() %>" <%= selected %>>
                                    <%= nombreRol %>
                                </option>
                            <% } %>
                        </select>
                    </div>
                </div>

                <hr>

  <%--  Botones --%>
                <div class="row mt-4">
                    <div class="col-md-12 text-center">
                        <button type="submit" class="btn btn-primary shadow-sm px-5"> Guardar Cambios </button>
                        <a href="SvUsuarios" class="btn btn-secondary shadow-sm px-5 ml-2">
                            Cancelar
                        </a>
                    </div>
                </div>

            </form>
        </div>
    </div>
</div>

<%@ include file="components/footer.jsp"%>