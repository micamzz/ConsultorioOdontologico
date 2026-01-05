<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="logica.Odontologo"%>
<%@ page import="logica.Paciente"%>

<%@ include file="components/header.jsp"%>
<%@ include file="components/bodyprimeraparte.jsp"%>

<%
    
    String fPrevia = request.getParameter("f") != null ? request.getParameter("f") : "";
    String hPrevia = request.getParameter("h") != null ? request.getParameter("h") : "";
    String afPrevia = request.getParameter("af") != null ? request.getParameter("af") : "";
    String idOPrevio = request.getParameter("ido") != null ? request.getParameter("ido") : "";
    String idPPrevio = request.getParameter("idp") != null ? request.getParameter("idp") : "";

    List<Odontologo> listaOdontos = (List<Odontologo>) request.getSession().getAttribute("listaOdontos");
    List<Paciente> listaPacientes = (List<Paciente>) request.getSession().getAttribute("listaPacientes");
%>

<div class="container-fluid">
    <h1 class="h3 mb-2 text-gray-800">Reserva de Turnos</h1>
    
    <%-- ALERTAS DE ERROR --%>
    <% String error = request.getParameter("error");
       if (error != null) { %>
        <div class="alert alert-danger alert-dismissible fade show" role="alert">
            <i class="fas fa-exclamation-triangle"></i> 
            <% if (error.equals("error_odonto")) { %> El Odontólogo ya tiene un turno en ese horario. <% } 
               else if (error.equals("error_paciente")) { %> El Paciente ya tiene otro turno en ese horario. <% } 
               else if (error.equals("error_fecha_pasada")) { %> No se permiten fechas anteriores a hoy. <% } %>
            <button type="button" class="close" data-dismiss="alert"><span aria-hidden="true">&times;</span></button>
        </div>
    <% } %>

    <div class="card shadow mb-4">
        <div class="card-header py-3"><h6 class="m-0 font-weight-bold text-primary">Datos del Turno</h6></div>
        <div class="card-body">
            <form class="user" action="SvTurnos" method="POST">
                <div class="row">
                    <%-- PACIENTE --%>
                    <div class="col-md-6 mb-3">
                        <label class="form-label font-weight-bold">Paciente:</label>
                        <select class="form-control" name="id_paciente" required>
                            <option value="" disabled <%= idPPrevio.isEmpty() ? "selected" : "" %>>Seleccione...</option>
                            <% if (listaPacientes != null) { for (Paciente pac : listaPacientes) { %>
                                <option value="<%= pac.getId() %>" <%= (idPPrevio.equals(String.valueOf(pac.getId()))) ? "selected" : "" %>>
                                    <%= pac.getApellido().toUpperCase() %>, <%= pac.getNombre().toUpperCase() %>
                                </option>
                            <% } } %>
                        </select>
                    </div>
                    <%-- ODONTOLOGO --%>
                    <div class="col-md-6 mb-3">
                        <label class="form-label font-weight-bold">Odontólogo:</label>
                        <select class="form-control" name="id_odonto" required>
                            <option value="" disabled <%= idOPrevio.isEmpty() ? "selected" : "" %>>Seleccione...</option>
                            <% if (listaOdontos != null) { for (Odontologo odon : listaOdontos) { %>
                                <option value="<%= odon.getId() %>" <%= (idOPrevio.equals(String.valueOf(odon.getId()))) ? "selected" : "" %>>
                                    <%= odon.getApellido().toUpperCase() %>, <%= odon.getNombre().toUpperCase() %> (<%= odon.getTipoEspecialidad() %>)
                                </option>
                            <% } } %>
                        </select>
                    </div>
                </div>

                <div class="row">
                    <%-- FECHA --%>
                    <div class="col-md-6 mb-3">
                        <label class="form-label font-weight-bold">Fecha:</label>
                        <input type="date" class="form-control" name="fecha_turno" value="<%= fPrevia %>" 
                               min="<%= new java.text.SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date()) %>" required>
                    </div>
                    <%-- HORA --%>
                    <div class="col-md-6 mb-3">
                        <label class="form-label font-weight-bold">Horario:</label>
                        <select class="form-control" name="hora_turno" required>
                            <option value="" disabled <%= hPrevia.isEmpty() ? "selected" : "" %>>Seleccione hora...</option>
                            <% String[] horas = {"08:00", "08:30", "09:00", "09:30", "10:00", "10:30", "11:00", "11:30", "14:00", "14:30", "15:00", "15:30", "16:00", "16:30", "17:00", "17:30", "18:00", "18:30"};
                               for(String h : horas) { %>
                                <option value="<%= h %>" <%= hPrevia.equals(h) ? "selected" : "" %>><%= h %></option>
                            <% } %>
                        </select>
                    </div>
                </div>

                <%-- AFECCION --%>
                <div class="row">
                    <div class="col-md-12 mb-3">
                        <label class="form-label font-weight-bold">Motivo:</label>
                        <textarea class="form-control" name="afeccion" rows="3" style="border-radius: 1.5rem;"><%= afPrevia %></textarea>
                    </div>
                </div>

                <div class="text-center mt-4">
                    <button type="submit" class="btn btn-primary px-5">Agendar Turno</button>
                </div>
            </form>
        </div>
    </div>
</div>
<%@ include file="components/footer.jsp"%>