package mapping;

import java.text.NumberFormat;
import java.util.Locale;

public class PanierArticle {
	private Article2 art;
        private int quantite;
        private int montant;

    public Article2 getArt() {
        return art;
    }

    public void setArt(Article2 art) {
        this.art = art;
    }

    public int getQuantite() {
        return quantite;
    }
    
    public String getQuantiteString(){
        return Integer.toString(quantite);
    }

    public void setQuantite(int quantite) {
        this.quantite = quantite;
    }

    public int getMontant() {
        return montant;
    }
    
    public String getMontantString() {
        return format(montant);
    }

    public void setMontant(int prix_unitaire,int quantite) {
        this.montant = prix_unitaire*quantite;
    }
    
    public PanierArticle(Article2 art, int quantite) {
        this.art = art;
        this.quantite = quantite;
        this.setMontant(Integer.parseInt(this.art.getPrix()), quantite);
    }
        
    public String format(int montant){
        Locale currentlocale=Locale.FRANCE;
        Integer mntnt = new Integer(montant);
        
        NumberFormat numberFormatter= NumberFormat.getNumberInstance(currentlocale);
        return numberFormatter.format(mntnt);
    }
        

}
