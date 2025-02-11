package pkg1.pkg5.programa.pkg3;

import java.io.*;
import java.util.regex.*;
import javax.swing.*;

/**
 *
 * @author chris
 */

public class Programa3 {
    public static void main(String[] args) {
        int opcion;
        
        do {
            JFileChooser PedirArchivo = new JFileChooser();
            if (PedirArchivo.showOpenDialog(null) != JFileChooser.APPROVE_OPTION) {
                JOptionPane.showMessageDialog(null, "Pero si no se seleccionó ningún archivo", "Error", JOptionPane.ERROR_MESSAGE);
                return;
            }
            
            File archivo = PedirArchivo.getSelectedFile();
            Pattern numero = Pattern.compile("^[+-]?[0-9]+$");
            Pattern palabra = Pattern.compile("^[a-zA-ZáéíóúÁÉÍÓÚñÑ]+$");
            Pattern combinada = Pattern.compile("^(?=.*[a-zA-Z])(?=.*[0-9]).+$");
            
            int totalCaracteres = 0, totalSinEspacios = 0, totalLexemas = 0;
            int totalPalabras = 0, totalNumeros = 0, totalCombinadas = 0;

            BufferedReader archivoTXT = null;
            try {
                archivoTXT = new BufferedReader(new FileReader(archivo));
                String linea;
                while ((linea = archivoTXT.readLine()) != null) {
                    totalCaracteres += linea.length();
                    String[] lexemas = linea.split("\\s+");
                    totalLexemas += lexemas.length;
                    
                    for (String lexema : lexemas) {
                        totalSinEspacios += lexema.length();
                        if (numero.matcher(lexema).matches()) {
                            totalNumeros++;
                        } else {
                            if (palabra.matcher(lexema).matches()) {
                                totalPalabras++;
                            } else {
                                if (combinada.matcher(lexema).matches()) {
                                    totalCombinadas++;
                                }
                            }
                        }   
                    }
                }
            } catch (IOException e) {
                JOptionPane.showMessageDialog(null, "Error al leer el archivo, intenatolo nuevamente, o cambia de archivo", "Error", JOptionPane.ERROR_MESSAGE);
            } finally {
                try {
                    if (archivoTXT != null) {
                        archivoTXT.close();
                    }
                } catch (IOException e) {
                    JOptionPane.showMessageDialog(null, "Error al cerrar el archivo", "Error", JOptionPane.ERROR_MESSAGE);
                }
            }

            JOptionPane.showMessageDialog(null, "Total de caracteres (con espacios): " + totalCaracteres + "\n"
                    + "Total de caracteres (sin espacios): " + totalSinEspacios + "\n"
                    + "Total de lexemas: " + totalLexemas + "\n"
                    + "Total de palabras: " + totalPalabras + "\n"
                    + "Total de números: " + totalNumeros + "\n"
                    + "Total de combinadas: " + totalCombinadas, "Mostrando tus resultados", JOptionPane.INFORMATION_MESSAGE);
            
            opcion = JOptionPane.showConfirmDialog(null, "¿Deseas procesar otro archivo o salimos?", "Repetir", JOptionPane.YES_NO_OPTION);
        } while (opcion == JOptionPane.YES_OPTION);
    }
}
