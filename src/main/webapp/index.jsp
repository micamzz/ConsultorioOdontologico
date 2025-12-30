<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<%@ include file="components/header.jsp"%>
<%@ include file="components/bodyprimeraparte.jsp"%>
                             
<div class="container-fluid">

<div class="row">
    <div class="col-lg-12">
        <div class="card shadow mb-4 border-bottom-primary">
            <div class="card-body">
                <div class="row align-items-center">
                    <div class="col-md-8">
                        <h1 class="h3 mb-2 text-gray-800">Bienvenido al Sistema de Gestión administrativas</h1>
                        <p class="lead text-primary font-weight-bold"> Clínica Odontológica Alvarenga Gonzalez </p>
                      <%-- 
                       <p class="mb-4">Desde este panel podrá administrar turnos, profesionales y pacientes de manera centralizada.</p>
--%>
                    </div>
                    <div class="col-md-4 text-center d-none d-md-block">
                        <img src="img/odontologia-img.png" class="img-fluid" style="max-height: 200px;" alt="Bienvenida">
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<%--  ACCIONES RÁPIDAS --%>
<div class="row mt-4">
    <%-- Tarjeta: Nuevo Turno --%>
    <div class="col-lg-6 mb-4">
        <div class="card bg-primary text-white shadow">
            <div class="card-body">
                <div class="row align-items-center">
                    <div class="col mr-2">
                        <div class="text-white-50 small text-uppercase font-weight-bold">Gestión de Citas</div>
                        <div class="h4 font-weight-bold">Nuevo Turno</div>
                        <a href="SvTurnos" class="btn btn-light btn-sm font-weight-bold text-primary px-4 shadow-sm">Reservar</a>
                    </div>
                    <div class="col-auto">
                        <i class="fas fa-calendar-plus fa-3x text-white-50"></i>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <%--  Tarjeta Nuevo Paciente --%>
    <div class="col-lg-6 mb-4">
        <div class="card bg-success text-white shadow">
            <div class="card-body">
                <div class="row align-items-center">
                    <div class="col mr-2">
                        <div class="text-white-50 small text-uppercase font-weight-bold">Admisión</div>
                        <div class="h4 font-weight-bold">Agregar Paciente</div>
                        <a href="altaPacientes.jsp" class="btn btn-light btn-sm font-weight-bold text-success px-4 shadow-sm">Registrar</a>
                    </div>
                    <div class="col-auto">
                        <i class="fas fa-user-plus fa-3x text-white-50"></i>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

                
<%@ include file="components/footer.jsp"%>