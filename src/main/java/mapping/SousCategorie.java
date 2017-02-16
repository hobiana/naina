/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mapping;

/**
 *
 * @author Hobiana
 */
public class SousCategorie {
    private int idSousCategorie;
    private int idCategorie;
    private String nom;

    public void setIdSousCategorie(int idSousCategorie) {
        this.idSousCategorie = idSousCategorie;
    }

    public void setIdCategorie(int idCategorie) {
        this.idCategorie = idCategorie;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public int getIdSousCategorie() {
        return idSousCategorie;
    }

    public int getIdCategorie() {
        return idCategorie;
    }

    public String getNom() {
        return nom;
    }

    public SousCategorie(String nom) {
        this.nom = nom;
    }

    public SousCategorie(int idCategorie, String nom) {
        this.idCategorie = idCategorie;
        this.nom = nom;
    }

    
    
    
}
