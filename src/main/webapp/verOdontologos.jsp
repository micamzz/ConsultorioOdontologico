<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="logica.Odontologo"%>

<%@ include file="components/header.jsp"%>
<%@ include file="components/bodyprimeraparte.jsp"%>


<div class="container-fluid">
	<h1 class="h3 mb-2 text-gray-800">Gestión de Profesionales</h1>
	<p class="mb-4 text-gray-600">Listado detallado de odontólogos
		registrados.</p>
		
<%-- mensaje de odontologo con turno --%>
    <% if (request.getParameter("error") != null && request.getParameter("error").equals("con_turnos")) { %>
        <div class="alert alert-warning alert-dismissible fade show" role="alert">
            <i class="fas fa-exclamation-triangle"></i> 
            <strong>Imposible borrar:</strong> El profesional tiene <b>turnos agendados</b> en el sistema.
            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                <span aria-hidden="true">&times;</span>
            </button>
        </div>
    <% } %>

<%-- mensaje de exito --%>
    <% if (request.getParameter("status") != null && request.getParameter("status").equals("deleted")) { %>
        <div class="alert alert-success alert-dismissible fade show" role="alert">
            <i class="fas fa-user-check"></i> Odontólogo eliminado correctamente.
            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                <span aria-hidden="true">&times;</span>
            </button>
        </div>
    <% } %>
    
    
    <%-- TABLA --%>
	<div class="card shadow mb-4">
		<div
			class="card-header py-3 d-flex justify-content-between align-items-center">
			<h6 class="m-0 font-weight-bold text-primary">Base de datos de
				odontólogos</h6>
			<a href="altaOdontologo.jsp" class="btn btn-primary btn-sm shadow-sm">
				<i class="fas fa-plus fa-sm text-white-50 mr-1"></i> Nuevo
				Odontólogo
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
							<th>Especialidad</th>
							<th class="text-center">Acciones</th>
						</tr>
					</thead>
					<tbody>
						<% 
                            List<Odontologo> listaOdon = (List<Odontologo>) request.getSession().getAttribute("listaOdontologos");
                            
                            if (listaOdon != null && !listaOdon.isEmpty()) {
                                for (Odontologo odon : listaOdon) { 
                        %>
						<tr>
							<td class="font-weight-bold">#<%= odon.getId() %></td>
							<td><%= odon.getDni() %></td>
							<td class="text-dark text-uppercase"><%= odon.getNombre() %></td>
							<td class="text-dark text-uppercase"><%= odon.getApellido() %></td>
							<td><%= odon.getFecha_nac() %></td>
							<td><%= (odon.getDireccion() != null) ? odon.getDireccion() : "-" %></td>
							<td><%= (odon.getTelefono() != null) ? odon.getTelefono() : "-" %></td>
							<td><span
								class="badge badge-info badge-especialidad shadow-sm text-capitalize">
									<% 
                                        if (odon.getTipoEspecialidad() != null) {
                                            out.print(odon.getTipoEspecialidad().toString().toLowerCase().replace("_", " "));
                                        } else {
                                            out.print("General");
                                        }
                                    %>
							</span></td>
							<td>
								<div class="d-flex justify-content-center" style="gap: 5px;">
									<%-- Botón Editar --%>
									<form action="SvEditOdontologo" method="GET" style="margin: 0;">
										<input type="hidden" name="id" value="<%= odon.getId() %>">
										<button type="submit"
											class="btn btn-light btn-sm btn-action text-info border shadow-sm"
											title="Editar">
											<i class="fas fa-pencil-alt"></i>
										</button>
									</form>

									<%-- Botón Eliminar --%>
									<form action="SvElimOdontologo" method="POST"
										style="margin: 0;"
										onsubmit="return confirm('¿Eliminar a <%= odon.getApellido() %>?')">
										<input type="hidden" name="id" value="<%= odon.getId() %>">
										<button type="button"
											class="btn btn-light btn-sm btn-action text-danger border shadow-sm"
											data-toggle="modal" data-target="#deleteModal"
											onclick="prepareDeleteOdon('<%= odon.getId() %>', '<%= odon.getNombre() %>', '<%= odon.getApellido() %>')">
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
							<td colspan="9" class="text-center py-4">No se encontraron
								registros.</td>
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
				<h5 class="modal-title" id="exampleModalLabel">Eliminar Odontólogo</h5>
				<button class="close text-white" type="button" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">×</span>
				</button>
			</div>
			<div class="modal-body text-center py-4">
				<%--  <i class="fas fa-exclamation-triangle fa-3x text-warning mb-3"></i> --%>
				<span class="mb-1">¿Estás seguro de que quieres eliminar al
					odontólogo: </span>
				<span id="odontologoNombre" class="font-weight-bold text-dark mb-3"></span>
				<span class="mb-1"> ? </span>
			</div>
			<div class="modal-footer bg-light justify-content-center">
				<button class="btn btn-secondary px-4" type="button"
					data-dismiss="modal">Cancelar</button>
				<form id="confirmDeleteForm" action="SvElimOdontologo" method="POST"
					style="margin: 0;">
					<input type="hidden" name="id" id="deleteId" value="">
					<button type="submit" class="btn btn-danger px-4 shadow-sm">Eliminar</button>
				</form>
			</div>
		</div>
	</div>
</div>

<%@ include file="components/footer.jsp"%>