/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author santo
 */
public class Data {
    private int dia;
    private int mes;
    private int ano;
    /**
     *Construtor que inicializa a data com 01/01/2000
     */
    public Data(){
        dia = 1;
        mes = 1;
        ano = 2000;
    }
    /**
     * Construtor que inicializa a data com os parâmetros
     * @param dia
     * @param mes
     * @param ano 
     */
    public Data(int dia, int mes, int ano){
        this.setData(dia, mes, ano);
    }
    
    public void setData(int dia, int mes, int ano){
        this.setDia(dia);
        this.setMes(mes);
        this.setAno(ano);
    }
    
    public String getData(){
        String data = "";
        if(dia<10) data += "0";
        data += dia+"/";
        if(mes<10) data += "0";
        data += mes+"/";
        data += ano;
        return data;
    }

    public int getDia() {
        return dia;
    }

    public void setDia(int dia) {
        if(dia<1) this.dia = 1;
        else if(dia > 31) this.dia = 31;
        else this.dia = dia;
    }

    public int getMes() {
        return mes;
    }

    public void setMes(int mes) {
        if(mes<1) this.mes = 1;
        else if(mes > 12) this.mes = 12;
        else this.mes = mes;
    }

    public int getAno() {
        return ano;
    }

    public void setAno(int ano) {
        this.ano = ano;
    }
}
