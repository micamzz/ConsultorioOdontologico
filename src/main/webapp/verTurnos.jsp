<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="logica.Turno"%>
<%@ page import="java.text.SimpleDateFormat"%>

<%@ include file="components/header.jsp"%>
<%@ include file="components/bodyprimeraparte.jsp"%>

<%
 
    List<Turno> listaTurnos = (List<Turno>) request.getSession().getAttribute("listaTurnos");
    SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
%>

<div class="container-fluid">
	<h1 class="h3 mb-2 text-gray-800">Agenda de Turnos</h1>
	<p class="mb-4 text-gray-600">Cronograma detallado de citas médicas
		y consultas programadas.</p>

	<div class="card shadow mb-4">
		<div
			class="card-header py-3 d-flex justify-content-between align-items-center">
			<h6 class="m-0 font-weight-bold text-primary">Listado de Citas</h6>
			<a href="SvTurnos" class="btn btn-primary btn-sm shadow-sm"> <i
				class="fas fa-calendar-plus fa-sm text-white-50 mr-1"></i> Nuevo
				Turno
			</a>
		</div>

		<div class="card-body">
			<div class="table-responsive">
				<table class="table table-hover align-middle text-xs-custom"
					id="dataTable" width="100%" cellspacing="0">
					<thead class="bg-light text-primary">
						<tr>
							<th>Fecha</th>
							<th>Hora</th>
							<th>Paciente</th>
							<th>Odontólogo</th>
							<th>Afección / Motivo</th>
							<th class="text-center">Acciones</th>
						</tr>
					</thead>
					<tbody>
						<% 
                            if (listaTurnos != null && !listaTurnos.isEmpty()) {
                                for (Turno tur : listaTurnos) { 
                        %>
						<tr>
							<td class="text-dark"><%= sdf.format(tur.getFecha_turno()) %>
							</td>
							<td><span
								class="text-dark">
									 <%= tur.getHora_turno() %> hs
							</span></td>
							<%-- PACIENTE--%>
							<td class="text-dark text-uppercase"><%= tur.getPacien().getApellido() %>,
								<%= tur.getPacien().getNombre() %></td>
							<td class="text-dark text-uppercase ">
								<%-- ODONTÓLOGO --%> <%= tur.getOdonto().getApellido() %>
							</td>
							<td class="text-dark"><%= (tur.getAfeccion() != null && !tur.getAfeccion().isEmpty()) ? tur.getAfeccion() : "Consulta General" %>
							</td>
							<td>
								<div class="d-flex justify-content-center" style="gap: 8px;">
									<%-- BOTON ELIMINAR --%>
									<button type="button"
										class="btn btn-light btn-sm btn-action text-danger border shadow-sm"
										data-toggle="modal" data-target="#deleteModal"
										onclick="prepareDeleteTurnos('<%= tur.getId_turno() %>', 
                              '<%= tur.getPacien().getApellido() %>', 
                              '<%= tur.getPacien().getNombre() %>', 
                              '<%= tur.getOdonto().getApellido() %>', 
                              '<%= tur.getOdonto().getNombre() %>', 
                              '<%= sdf.format(tur.getFecha_turno()) %>', 
                              '<%= tur.getHora_turno() %>')">
										<i class="fas fa-trash-alt"></i>
									</button>
								</div>
							</td>
						</tr>
						<% 
                                } 
                            } else { 
                        %>
						<tr>
							<td colspan="6" class="text-center py-4">No hay turnos
								agendados para mostrar.</td>
						</tr>
						<% } %>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>

<%-- ELIMINAR TURNO MODAL --%>
<div class="modal fade" id="deleteModal" tabindex="-1" role="dialog"
	aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered" role="document">
		<div class="modal-content border-0 shadow">
			<div class="modal-header bg-danger text-white">
				<h5 class="modal-title">Cancelar Turno</h5>
				<button class="close text-white" type="button" data-dismiss="modal">
					<span>×</span>
				</button>
			</div>
			<div class="modal-body text-center py-4">
				<i class="fas fa-calendar-times fa-3x text-warning mb-3"></i>
				<p class="mb-1 text-muted">¿Desea cancelar el turno del
					paciente?</p>
				<h5 id="infoTurnoPaciente" class="font-weight-bold text-dark"></h5>
				<p class="mb-1 text-muted">Con el profesional:</p>
				<h6 id="infoTurnoDr" class="font-weight-bold text-primary"></h6>
				<hr>
				<p id="infoTurnoFecha" class="mb-0 font-weight-bold text-danger"></p>
			</div>
			<div class="modal-footer bg-light justify-content-center">
				<button class="btn btn-secondary px-4" type="button"
					data-dismiss="modal">Volver</button>
				<form action="SvElimTurno" method="POST" style="margin: 0;">
					<input type="hidden" name="id" id="deleteId" value="">
					<button type="submit" class="btn btn-danger px-4 shadow-sm">Confirmar
						Cancelación</button>
				</form>
			</div>
		</div>
	</div>
</div>



<%@ include file="components/footer.jsp"%>