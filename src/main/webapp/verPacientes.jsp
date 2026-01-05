<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="logica.Paciente"%>

<%@ include file="components/header.jsp"%>
<%@ include file="components/bodyprimeraparte.jsp"%>

<div class="container-fluid">
	<h1 class="h3 mb-2 text-gray-800">Gestión de Pacientes</h1>
	<p class="mb-4 text-gray-600">Listado completo de pacientes
		registrados. Puede gestionar turnos y datos personales desde esta
		tabla.</p>
		
		<%-- mensaje de error si tiene un turno y lo quiere borrar --%>
		<% if (request.getParameter("error") != null && request.getParameter("error").equals("con_turnos")) { %>
    <div class="alert alert-warning alert-dismissible fade show" role="alert">
        <strong>No se puede eliminar:</strong> El paciente tiene turnos agendados. 
        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
            <span aria-hidden="true">&times;</span>
        </button>
    </div>
<% } %>

<%-- mensaje si el paciente se pudo eliminar --%>
<% if (request.getParameter("status") != null && request.getParameter("status").equals("deleted")) { %>
    <div class="alert alert-success alert-dismissible fade show" role="alert">
        Paciente eliminado con éxito.
        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
            <span aria-hidden="true">&times;</span>
        </button>
    </div>
<% } %> 

<%-- Inicio de la Tabla --%>
	<div class="card shadow mb-4">
		<div
			class="card-header py-3 d-flex justify-content-between align-items-center">
			<h6 class="m-0 font-weight-bold text-primary">Base de Datos de
				Pacientes</h6>

			<a href="altaPacientes.jsp" class="btn btn-primary btn-sm shadow-sm">
				<i class="fas fa-plus fa-sm text-white-50 mr-1"></i> Nuevo Paciente
			</a>
		</div>

		<div class="card-body">
			<div class="table-responsive">
				<table class="table table-hover align-middle text-xs-custom"
					id="dataTable" width="100%" cellspacing="0">
					<thead class="bg-light text-primary">
						<tr>
							<th>ID</th>
							<th>DNI</th>
							<th>Nombre</th>
							<th>Apellido</th>
							<th>F. Nacimiento</th>
							<th>Dirección</th>
							<th>Teléfono</th>
							<th class="text-center">Obra Social</th>
							<th class="text-center">Acciones</th>
						</tr>
					</thead>
					<tbody>
						<% 
                            List<Paciente> listaPacientes = (List<Paciente>) request.getSession().getAttribute("listaPacientes");
                            
                            if (listaPacientes != null && !listaPacientes.isEmpty()) {
                                for (Paciente pac : listaPacientes) { 
                        %>
						<tr>
							<td class="font-weight-bold">#<%= pac.getId() %></td>
							<td><%= pac.getDni() %></td>
							<td class="text-dark text-uppercase"><%= pac.getNombre() %></td>
							<td class="text-dark text-uppercase"><%= pac.getApellido() %></td>
							<td><%= pac.getFecha_nac() %></td>
							<td><%= (pac.getDireccion() != null) ? pac.getDireccion() : "-" %></td>
							<td><%= (pac.getTelefono() != null) ? pac.getTelefono() : "-" %></td>
							<td class="text-center">
								<% if (pac.getTiene_OS()) { %> <span
								class="badge badge-success badge-especialidad shadow-sm">
									<i class="fas fa-check-circle mr-1"></i> Posee
							</span> <% } else { %> <span
								class="badge badge-secondary badge-especialidad shadow-sm">
									Particular </span> <% } %>
							</td>
							<td>
								<div class="d-flex justify-content-center" style="gap: 8px;">


									<form action="SvEditPacientes" method="GET" style="margin: 0;">
										<input type="hidden" name="id" value="<%= pac.getId() %>">
										<button type="submit"
											class="btn btn-light btn-sm btn-action text-info border shadow-sm"
											title="Editar">
											<i class="fas fa-pencil-alt"></i>
										</button>
									</form>


									<form action="SvElimPacientes" method="POST" style="margin: 0;"
										onsubmit="return confirm('¿Desea eliminar al paciente <%= pac.getApellido() %>?')">
										<input type="hidden" name="id" value="<%= pac.getId() %>">
										<button type="button"
											class="btn btn-light btn-sm btn-action text-danger border shadow-sm"
											data-toggle="modal" data-target="#deleteModal"
											onclick="prepareDelete('<%= pac.getId() %>', '<%= pac.getNombre() %>', '<%= pac.getApellido() %>')">
											<i class="fas fa-trash-alt"></i>
										</button>
									</form>
								</div>
							</td>
						</tr>
						<% 
                                } 
                            } else { 
                        %>
						<tr>
							<td colspan="9" class="text-center py-4">No hay pacientes
								registrados.</td>
						</tr>
						<% } %>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>




<%--  MODAL DE BOTON ELIMINAR--%>
<div class="modal fade" id="deleteModal" tabindex="-1" role="dialog"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered" role="document">
		<div class="modal-content border-0 shadow">
			<div class="modal-header bg-danger text-white">
				<h5 class="modal-title" id="exampleModalLabel">Eliminar Paciente</h5>
				<button class="close text-white" type="button" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">×</span>
				</button>
			</div>
			<div class="modal-body text-center py-4">
				<%--  <i class="fas fa-exclamation-triangle fa-3x text-warning mb-3"></i> --%>
				<span class="mb-1">¿Estás seguro de que quieres eliminar al paciente:   </span>
				<span id="pacienteNombre" class="font-weight-bold text-dark mb-3"></span>
				<span class="mb-1"> ? </span>
			</div>
			<div class="modal-footer bg-light justify-content-center">
				<button class="btn btn-secondary px-4" type="button"
					data-dismiss="modal">Cancelar</button>
				<form id="confirmDeleteForm" action="SvElimPaciente" method="POST"
					style="margin: 0;">
					<input type="hidden" name="id" id="deleteId" value="">
					<button type="submit" class="btn btn-danger px-4 shadow-sm">Eliminar</button>
				</form>
			</div>
		</div>
	</div>
</div>

<%@ include file="components/footer.jsp"%>