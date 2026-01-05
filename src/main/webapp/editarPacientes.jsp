<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="logica.Paciente"%>
<%@ page import="java.text.SimpleDateFormat"%>

<%@ include file="components/header.jsp"%>
<%@ include file="components/bodyprimeraparte.jsp"%>

<% 
    
    Paciente paciente = (Paciente) request.getSession().getAttribute("pacienteEditar"); 
    String fechaFormateada = "";
    
    if (paciente != null) {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        fechaFormateada = (paciente.getFecha_nac() != null) ? sdf.format(paciente.getFecha_nac()) : "";
%>

<div class="container-fluid">
    <h1 class="h3 mb-2 text-gray-800">Editar Paciente</h1>
    <p class="mb-4 text-gray-600">Actualice la información personal y de cobertura médica de <strong><%= paciente.getNombre() %> <%= paciente.getApellido() %></strong>.</p>

    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary">Edición de Datos</h6>
        </div>
        <div class="card-body">
            <form class="user" action="SvEditPacientes" method="POST">
                
                <%--  Nombre y Apellido --%>
                <div class="row">
                    <div class="col-md-6 mb-3">
                        <label class="form-label font-weight-bold">Nombre</label>
                        <input type="text" class="form-control" name="nombre" value="<%= paciente.getNombre() %>" required>
                    </div>
                    <div class="col-md-6 mb-3">
                        <label class="form-label font-weight-bold">Apellido</label>
                        <input type="text" class="form-control" name="apellido" value="<%= paciente.getApellido() %>" required>
                    </div>
                </div>

                <%--  DNI y Fecha de Nacimiento --%>
                <div class="row">
                    <div class="col-md-6 mb-3">
                        <label class="form-label font-weight-bold">DNI</label>
                        <input type="text" class="form-control" name="dni" value="<%= paciente.getDni() %>" required>
                    </div>
                    <div class="col-md-6 mb-3">
                        <label class="form-label font-weight-bold">Fecha de Nacimiento</label>
                        <input type="date" class="form-control" name="fechanac" value="<%= fechaFormateada %>" required>
                    </div>
                </div>

                <%--  Teléfono y Dirección --%>
                <div class="row">
                    <div class="col-md-4 mb-3">
                        <label class="form-label font-weight-bold">Teléfono</label>
                        <input type="text" class="form-control" name="telefono" value="<%= (paciente.getTelefono() != null) ? paciente.getTelefono() : "" %>">
                    </div>
                    <div class="col-md-8 mb-3">
                        <label class="form-label font-weight-bold">Dirección</label>
                        <input type="text" class="form-control" name="direccion" value="<%= (paciente.getDireccion() != null) ? paciente.getDireccion() : "" %>">
                    </div>
                </div>

                <%--  Obra Social --%>
                <div class="row">
                    <div class="col-md-6 mb-3">
                        <label class="form-label font-weight-bold">Cobertura Médica</label>
                        <select class="form-control" name="tiene_OS">
                            <option value="true" <%= (paciente.getTiene_OS()) ? "selected" : "" %>>Posee Obra Social</option>
                            <option value="false" <%= (!paciente.getTiene_OS()) ? "selected" : "" %>>Particular / Sin Cobertura</option>
                        </select>
                    </div>
                </div>

                <hr>

                <div class="row mt-4">
                    <div class="col-md-12 text-center">
                        <button type="submit" class="btn btn-primary shadow-sm px-5">
                            Guardar Cambios
                        </button>
                        <a href="SvPacientes" class="btn btn-secondary shadow-sm px-5 ml-2">Cancelar</a>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>

<% 
   
    } else { 
        response.sendRedirect("SvPacientes");
    } 
%>

<%@ include file="components/footer.jsp"%>