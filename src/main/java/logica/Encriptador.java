package logica;

import org.mindrot.jbcrypt.BCrypt; 

public class Encriptador {

   
    public static String encriptarContrasenia(String contrasenia) {
        return BCrypt.hashpw(contrasenia, BCrypt.gensalt());
    }


    public static boolean verificarContrasenia(String contraseniaIngresada, String hashAlmacenado) {
        return BCrypt.checkpw(contraseniaIngresada, hashAlmacenado);
    }
}