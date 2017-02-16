/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mapping;

import fonction.Fonction;
import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.Locale;

/**
 *
 * @author Hobiana
 */
public class Panier {
    private ArrayList<PanierArticle> list_art;
    private int total=0;

    public ArrayList<PanierArticle> getList_art() {
        return list_art;
    }

    public void setList_art(ArrayList<PanierArticle> list_art) {
        this.list_art = list_art;
    }
    
    public int getTotal() {
        int temp=0;
        for(int i=0;i<this.getList_art().size();i++){
            temp+=this.getList_art().get(i).getMontant();
        }
        total=temp;
        return total;
    }
    
    public String getTotalString() {
        total=getTotal();
        return format(total);
    }
    
    public String getTotalRemiseTVA(){
        int totalHT=getTotal()+getTVA()-getRemise();
        return format(totalHT);
    }

    public void setTotal(int total) {
        this.total = total;
    }
    
    public String getTVAString() {
        return format((int) (total*0.2));
    }
    
    public int getTVA() {
        return (int) (total*0.2);
    }


    public int getRemise() {
        Fonction f=new Fonction();
        double remise=f.getRemise(total);
        return (int)(remise*total);
    }
    
    public String getRemiseString() {
        Fonction f=new Fonction();
        double remise=f.getRemise(total);
        return format((int)(remise*total));
    }

    
    // constructeur
    public Panier() {
        this.list_art = new ArrayList<PanierArticle>();
        this.total = 0;
        
    }
    
    public String format(int montant){
        Locale currentlocale=Locale.FRANCE;
        Integer mntnt = new Integer(montant);
        
        NumberFormat numberFormatter= NumberFormat.getNumberInstance(currentlocale);
        return numberFormatter.format(mntnt);
    }
    
    public int getNombreArticle()
    {
        int rep=0;
        for(int i=0;i<list_art.size();i++){
            rep+=list_art.get(i).getQuantite();
        }
        return rep;
    }    
    
}
