/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mapping;

import java.text.NumberFormat;
import java.util.Locale;

/**
 *
 * @author Hobiana
 */
public class Article2 {
    private String idArticle;
    private String prix;
    private String categorie;
    private String SousCategorie;
    private String nomArticle;
    private String description;
    private String marque;
    private String image;

    public Article2(String idArticle, String prix, String categorie, String SousCategorie, String nomArticle, String description,String marque,String image) {
        this.idArticle = idArticle;
        this.prix = prix;
        this.categorie = categorie;
        this.SousCategorie = SousCategorie;
        this.nomArticle = nomArticle;
        this.description = description;
        this.marque=marque;
        this.image=image;
    }

    public Article2(String idArticle, String prix, String categorie, String SousCategorie, String nomArticle, String description, String marque) {
        this.idArticle = idArticle;
        this.prix = prix;
        this.categorie = categorie;
        this.SousCategorie = SousCategorie;
        this.nomArticle = nomArticle;
        this.description = description;
        this.marque = marque;
    }

    
    public String getMarque() {
        return marque;
    }

    public void setMarque(String marque) {
        this.marque = marque;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }
    
    public String getIdArticle() {
        return idArticle;
    }
    
    public String getPrix() {
        return prix;
    }
    
    public int getPrixInt() {
        return Integer.parseInt(prix);
    }
    
    public String getPrixString() {
        return format(Integer.parseInt(prix));
    }

    public void setPrix(String prix) {
        this.prix = prix;
    }
    public void setIdArticle(String idArticle) {
        this.idArticle = idArticle;
    }

    public String getCategorie() {
        return categorie;
    }

    public void setCategorie(String categorie) {
        this.categorie = categorie;
    }

    public String getSousCategorie() {
        return SousCategorie;
    }

    public void setSousCategorie(String SousCategorie) {
        this.SousCategorie = SousCategorie;
    }

    public String getNomArticle() {
        return nomArticle;
    }

    public void setNomArticle(String nomArticle) {
        this.nomArticle = nomArticle;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
    
    public String format(int montant){
        Locale currentlocale=Locale.FRANCE;
        Integer mntnt = new Integer(montant);
        
        NumberFormat numberFormatter= NumberFormat.getNumberInstance(currentlocale);
        return numberFormatter.format(mntnt);
    }
    
}
