/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.ArrayList;

/**
 *
 * @author santo
 */
public class Base {
    private static ArrayList<Contato> contatosList;
    public static ArrayList<Contato> getContatosList(){
        if(contatosList == null){
            contatosList = new ArrayList<>();
            contatosList.add(new Contato("Fulano", "(13)99111-0001", new Data(1, 1, 2001)));
            contatosList.add(new Contato("Beltrano", "(13)99111-0002", new Data(2, 2, 2001)));
            contatosList.add(new Contato("Cicrano", "(13)99111-0003", new Data(3, 3, 2001)));
        }
        return contatosList;
    } 
}
