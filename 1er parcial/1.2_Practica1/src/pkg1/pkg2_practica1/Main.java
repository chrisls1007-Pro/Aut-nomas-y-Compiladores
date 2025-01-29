/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package pkg1.pkg2_practica1;

import javax.swing.JOptionPane;

/**
 *
 * @author chris
 */
public class Main {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        while (true) {
            String  palabras = JOptionPane.showInputDialog(null, "Ingrese una cadena de caracteres:", "Clasificador de Cadenas", JOptionPane.QUESTION_MESSAGE);

            if (palabras == null) {
                JOptionPane.showMessageDialog(null, "El programa ha finalizado por Christian López Solís", "Adiós", JOptionPane.INFORMATION_MESSAGE);
                break;
            }

            if ( palabras.trim().isEmpty()) {
                JOptionPane.showMessageDialog(null, "Entrada vacía. Por favor, ingrese una cadena válida.", "Error", JOptionPane.ERROR_MESSAGE);
                continue;
            }

            String clasificacion = clasificarPalabras(palabras);
            JOptionPane.showMessageDialog(null, "La cadena ingresada es: " + clasificacion, "Resultado", JOptionPane.INFORMATION_MESSAGE);
        }
    }

    public static String clasificarPalabras(String palabra) {
        palabra = palabra.trim();

        if (palabra.matches("\\d+")) {
            return "Un número entero";
        }

        if (palabra.matches("[a-zA-ZáéíóúÁÉÍÓÚñÑ]+")) {
            return "Una palabra";
        }

        if (palabra.matches("[a-zA-ZáéíóúÁÉÍÓÚñÑ0-9]+")) {
            return "Una compuesta";
        }

        return "El formato no es reconocido, no puede llevar espacios";
    }
}
