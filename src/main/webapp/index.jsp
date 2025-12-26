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
                        <p class="lead text-primary font-weight-bold">
                            Clínica Odontológica Alvarenga Gonzalez
                        </p>
                        <p class="mb-4">Desde este panel podrá administrar turnos, profesionales y pacientes de manera centralizada.</p>

                    </div>
                    <div class="col-md-4 text-center d-none d-md-block">
                        <img src="img/odontologia-img.png" class="img-fluid" style="max-height: 200px;" alt="Bienvenida">
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

    <div class="row">

        <div class="col-xl-3 col-md-6 mb-4">
            <div class="card border-left-primary shadow h-100 py-2">
                <div class="card-body">
                    <div class="row no-gutters align-items-center">
                        <div class="col mr-2">
                            <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">
                                Odontólogos Activos</div>
                            <div class="h5 mb-0 font-weight-bold text-gray-800">12</div> 
                        </div>
                        <div class="col-auto">
                            <i class="fas fa-user-md fa-2x text-gray-300"></i>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-xl-3 col-md-6 mb-4">
            <div class="card border-left-success shadow h-100 py-2">
                <div class="card-body">
                    <div class="row no-gutters align-items-center">
                        <div class="col mr-2">
                            <div class="text-xs font-weight-bold text-success text-uppercase mb-1">
                                Turnos Hoy</div>
                            <div class="h5 mb-0 font-weight-bold text-gray-800">25</div> 
                        </div>
                        <div class="col-auto">
                            <i class="fas fa-calendar-check fa-2x text-gray-300"></i>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        </div>

   
                    
<%@ include file="components/footer.jsp"%>