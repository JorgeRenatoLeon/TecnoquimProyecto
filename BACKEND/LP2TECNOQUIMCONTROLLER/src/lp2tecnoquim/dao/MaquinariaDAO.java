/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package lp2tecnoquim.dao;

import java.util.ArrayList;
import lp2tecnoquim.model.Maquinaria;


/**
 *
 * @author alulab14
 */
public interface MaquinariaDAO {
    
    void insertar(Maquinaria maquinaria);
    void actualizar(Maquinaria maquinaria);
    void eliminar(int id);
    ArrayList<Maquinaria> listar(String dato);
    
}