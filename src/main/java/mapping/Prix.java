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
public class Prix {
    private int idPrix;
    private int idArticle;
    private int prix;

    public Prix(int idPrix, int idArticle, int prix) {
        this.idPrix = idPrix;
        this.idArticle = idArticle;
        this.prix = prix;
    }

    public Prix(int idArticle, int prix) {
        this.idArticle = idArticle;
        this.prix = prix;
    }

    public Prix(int prix) {
        this.prix = prix;
    }

    public int getIdPrix() {
        return idPrix;
    }

    public void setIdPrix(int idPrix) {
        this.idPrix = idPrix;
    }

    public int getIdArticle() {
        return idArticle;
    }

    public void setIdArticle(int idArticle) {
        this.idArticle = idArticle;
    }

    public int getPrix() {
        return prix;
    }

    public void setPrix(int prix) {
        this.prix = prix;
    }
    
}
