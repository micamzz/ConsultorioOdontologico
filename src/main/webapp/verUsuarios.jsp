<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="logica.*"%>

<%@ include file="components/header.jsp"%>
<%@ include file="components/bodyprimeraparte.jsp"%>

<div class="container-fluid">


	<h1 class="h3 mb-2 text-gray-800">Gestión de Usuarios</h1>
	<p class="mb-4 text-gray-600">Listado de cuentas con acceso al
		sistema. Puede administrar los permisos y credenciales desde esta
		sección.</p>

	<div class="card shadow mb-4">

		<div
			class="card-header py-3 d-flex justify-content-between align-items-center">
			<h6 class="m-0 font-weight-bold text-primary">Base de datos de
				usuarios</h6>
			<a href="altaUsuarios.jsp" class="btn btn-primary btn-sm shadow-sm">
				<i class="fas fa-plus fa-sm text-white-50 mr-1"></i> Nuevo Usuario
			</a>

		</div>

		<div class="card-body">
			<div class="table-responsive">
				<table class="table table-hover align-middle text-xs-custom"
					id="dataTable" width="100%" cellspacing="0">
					<thead class="bg-light text-primary">
						<tr>
							<th>ID</th>
							<th>Nombre de Usuario</th>
							<th>Rol asignado</th>
							<th class="text-center">Acciones</th>
						</tr>
					</thead>
					<tbody>
						<% 
                            List<Usuario> listaUsuarios = (List<Usuario>) request.getSession().getAttribute("listaUsuarios");
                            
                            if (listaUsuarios != null && !listaUsuarios.isEmpty()) {
                                for (Usuario usu : listaUsuarios) { 
                        %>
						<tr>
							<td class="font-weight-bold">#<%= usu.getId_usuario() %></td>
							<td class="text-dark"><%= usu.getNombreUsuario() %></td>
							<td><span
								class="badge badge-info badge-especialidad shadow-sm text-capitalize">
									<%= usu.getRol().name().toLowerCase() %>
							</span></td>

							<td>
								<div class="d-flex justify-content-center" style="gap: 10px;">

									<form name="editar" action="SvEditUsuarios" method="GET"
										style="margin: 0;">
										<input type="hidden" name="id"
											value="<%= usu.getId_usuario() %>">
										<button type="submit"
											class="btn btn-light btn-sm btn-action text-info border shadow-sm"
											title="Editar">
											<i class="fas fa-pencil-alt"></i>
										</button>
									</form>


									<form name="eliminar" action="SvElimUsuarios" method="POST"
										style="margin: 0;"
										onsubmit="return confirm('¿Está seguro de eliminar el usuario: <%= usu.getNombreUsuario() %>?')">
										<input type="hidden" name="id"
											value="<%= usu.getId_usuario() %>">
										<button type="button"
											class="btn btn-light btn-sm btn-action text-danger border shadow-sm"
											data-toggle="modal" data-target="#deleteModal"
											onclick="prepareDeleteUsu('<%= usu.getId_usuario() %>', '<%= usu.getNombreUsuario() %>')">
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
							<td colspan="4" class="text-center py-4 text-gray-500">No se
								encontraron usuarios registrados.</td>
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
				<h5 class="modal-title" id="exampleModalLabel">Eliminar Usuario</h5>
				<button class="close text-white" type="button" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">×</span>
				</button>
			</div>
			<div class="modal-body text-center py-4">
				<%--  <i class="fas fa-exclamation-triangle fa-3x text-warning mb-3"></i> --%>
				<span class="mb-1">¿Estás seguro de que quieres eliminar al
					usuario: </span>
				<span id="usuarioNombre" class="font-weight-bold text-dark mb-3"></span>
				<span class="mb-1"> ? </span>
			</div>
			<div class="modal-footer bg-light justify-content-center">
				<button class="btn btn-secondary px-4" type="button"
					data-dismiss="modal">Cancelar</button>
				<form id="confirmDeleteForm" action="SvElimUsuarios" method="POST"
					style="margin: 0;">
					<input type="hidden" name="id" id="deleteId" value="">
					<button type="submit" class="btn btn-danger px-4 shadow-sm">Eliminar</button>
				</form>
			</div>
		</div>
	</div>
</div>

<%@ include file="components/footer.jsp"%>