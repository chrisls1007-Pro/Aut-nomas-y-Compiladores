/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package pkg1.pkg4_practica2;

import javax.swing.JOptionPane;

/**
 *
 * @author chris
 */
public class Main {

    public static void main(String[] args) {
        while (true) {
            String palabras = JOptionPane.showInputDialog("Ingresa una cadena de texto:");

            if (palabras == null) {
                JOptionPane.showMessageDialog(null, "El programa ha finalizado por Christian López Solís", "Adiós", JOptionPane.INFORMATION_MESSAGE);
                break;
            }
            
            if ( palabras.trim().isEmpty()) {
                JOptionPane.showMessageDialog(null, "Entrada vacía. Por favor, ingrese una cadena válida.", "Error", JOptionPane.ERROR_MESSAGE);
                continue;
            }

            int contadorEntero = 0, contadorPalabra = 0, contadorCompuesta = 0;

            String[] palabraS =  palabras.split("\\s+");

            for (String word : palabraS) {
                if (word.matches("\\d+")) { 
                    contadorEntero++;
                } else if (word.matches("[a-zA-Z]+")) {  
                    contadorPalabra++;
                } else if (word.matches("[a-zA-Z0-9]+")) { 
                    contadorCompuesta++;
                }
            }

            String resultMessage = "";

            if (contadorEntero > 0) {
                resultMessage += contadorEntero + " entero(s)\n";
            }

            if (contadorPalabra > 0) {
                resultMessage += contadorPalabra + " palabra(s)\n";
            }

            if (contadorCompuesta > 0) {
                resultMessage += contadorCompuesta + " compuesta(s)\n";
            }

            JOptionPane.showMessageDialog(null, resultMessage);

        }
    }
}


