/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author santo
 */
public class Horario {
    private int hora;
    private int minuto;
    private int segundo;
    
    public Horario(int hora, int minuto, int segundo) {
        this.hora = hora;
        this.minuto = minuto;
        this.segundo = segundo;
    }
    public String getHorario(){
        String horario = "";
        
        if(hora<10) horario += "0";
        horario += hora + ":";
        if(minuto<10) horario += "0";
        horario += minuto + ":";
        if(segundo<10) horario += "0";
        horario += segundo; 
        return horario;
    }
}
