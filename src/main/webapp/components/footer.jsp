<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
    <!-- Footer -->
            <footer class="sticky-footer bg-white">
                <div class="container my-auto">
                    <div class="copyright text-center my-auto">
                        <span>Copyright &copy; Your Website 2025</span>
                    </div>
                </div>
            </footer>
            <!-- End of Footer -->

        </div>
        <!-- End of Content Wrapper -->

    </div>
    <!-- End of Page Wrapper -->

    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>

    <!-- Logout Modal-->
 <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">¿Desea salir?</h5>
                <button class="close" type="button" data-dismiss="modal">×</button>
            </div>
            <div class="modal-body">Seleccione "Cerrar Sesión" si está listo para finalizar su sesión actual.</div>
            <div class="modal-footer">
                <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancelar</button>

                <form action="SvLogout" method="POST">
                    <button type="submit" class="btn btn-primary">Cerrar Sesión</button>
                </form>
            </div>
        </div>
    </div>
</div>


    <!-- Bootstrap core JavaScript-->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="js/sb-admin-2.min.js"></script>

    <!-- Page level plugins -->
    <script src="vendor/chart.js/Chart.min.js"></script>

    <!-- Page level custom scripts -->
    <script src="js/demo/chart-area-demo.js"></script>
    <script src="js/demo/chart-pie-demo.js"></script>
    

    <!-- Page level plugins -->
    <script src="vendor/datatables/jquery.dataTables.min.js"></script>
    <script src="vendor/datatables/dataTables.bootstrap4.min.js"></script>

    <!-- Page level custom scripts -->
    <script src="js/demo/datatables-demo.js"></script>
    
    <!-- Modal boton eliminar  PACIENTE-->
   <script>
    function prepareDelete(id, nombre, apellido) {
        document.getElementById('deleteId').value = id;
        document.getElementById('pacienteNombre').innerText = nombre + " " + apellido;
    }
</script>

<!-- Modal boton eliminar  ODONTOLOGO-->
<script>
    function prepareDeleteOdon(id, nombre, apellido) {
        document.getElementById('deleteId').value = id;
        document.getElementById('odontologoNombre').innerText =  nombre + " " + apellido;
    }
</script>

<!-- Modal boton eliminar  USUARIO-->
<script>
    function prepareDeleteUsu(id, nombre) {
        document.getElementById('deleteId').value = id;
        document.getElementById('usuarioNombre').innerText = nombre;
    }
</script>

<!-- Modal boton eliminar TURNOS -->
<script>
  
    function prepareDeleteTurnos(id, pacApe, pacNom, oApe, oNom, fecha, hora) {
        document.getElementById('deleteId').value = id;

        document.getElementById('infoTurnoPaciente').innerText = (pacApe + " " + pacNom).toUpperCase();
        document.getElementById('infoTurnoDr').innerText = ("DR. " + oApe + " " + oNom).toUpperCase();
        document.getElementById('infoTurnoFecha').innerText = "EL DÍA " + fecha + " A LAS " + hora + " HS";
    }
</script>

</body>
</html>