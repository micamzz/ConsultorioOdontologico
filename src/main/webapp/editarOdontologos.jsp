<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="logica.*"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat"%>

<%@ include file="components/header.jsp"%>
<%@ include file="components/bodyprimeraparte.jsp"%>

<% 
   
    misession = request.getSession();
    Odontologo odon = (Odontologo) misession.getAttribute("odontoEditar"); 
    
    String fechaFormateada = "";
    
    if (odon != null) {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        fechaFormateada = (odon.getFecha_nac() != null) ? sdf.format(odon.getFecha_nac()) : "";
%>

<div class="container-fluid">
    <h1 class="h3 mb-2 text-gray-800">Editar Odontólogo</h1>
    <p class="mb-4 text-gray-600">Modifique los campos necesarios para actualizar la información del profesional <strong><%= odon.getNombre() %> <%= odon.getApellido() %></strong>.</p>

    <div class="card shadow mb-4">

        <div class="card-body">
            <form class="user" action="SvEditOdontologo" method="POST">
                
                  <%--  Nombre,apellido y DNI--%>
                <div class="row">
                    <div class="col-md-4 mb-3">
                        <label class="form-label font-weight-bold">Nombre</label>
                        <input type="text" class="form-control" name="nombre" value="<%= odon.getNombre() %>" required>
                    </div>
                    <div class="col-md-4 mb-3">
                        <label class="form-label font-weight-bold">Apellido</label>
                        <input type="text" class="form-control" name="apellido" value="<%= odon.getApellido() %>" required>
                    </div>
                    <div class="col-md-4 mb-3">
                        <label class="form-label font-weight-bold">DNI</label>
                        <input type="text" class="form-control" name="dni" value="<%= odon.getDni() %>" required>
                    </div>
                </div>

               <%--  Fecha nac - telefono  --%>
                <div class="row">
                    <div class="col-md-6 mb-3">
                        <label class="form-label font-weight-bold">Fecha de Nacimiento</label>
                        <input type="date" class="form-control" name="fechanac" value="<%= fechaFormateada %>" required>
                    </div>
                    <div class="col-md-6 mb-3">
                        <label class="form-label font-weight-bold">Teléfono</label>
                        <input type="text" class="form-control" name="telefono" value="<%= (odon.getTelefono() != null) ? odon.getTelefono() : "" %>">
                    </div>
                </div>

  <%--  Direccion - Especialidad --%>
                <div class="row">
                    <div class="col-md-8 mb-3">
                        <label class="form-label font-weight-bold">Dirección</label>
                        <input type="text" class="form-control" name="direccion" value="<%= (odon.getDireccion() != null) ? odon.getDireccion() : "" %>">
                    </div>
                    <div class="col-md-4 mb-3">
                        <label class="form-label font-weight-bold">Especialidad</label>
                        <select class="form-control" name="especialidad">
                            <% for (Especialidad e : Especialidad.values()) { 
                                String selected = (e.equals(odon.getTipoEspecialidad())) ? "selected" : ""; 
                                String nombreEspe = e.toString().toLowerCase();
                                nombreEspe = nombreEspe.substring(0, 1).toUpperCase() + nombreEspe.substring(1);
                            %>
                            <option value="<%= e.name() %>" <%= selected %>>
                                <%= nombreEspe %>
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
                        <a href="SvOdontologos" class="btn btn-secondary shadow-sm px-5 ml-2">
                            Cancelar
                        </a>
                    </div>
                </div>

            </form>
        </div>
    </div>
</div>

<% 
    } else { 
        response.sendRedirect("SvOdontologos");
    } 
%>

<%@ include file="components/footer.jsp"%>