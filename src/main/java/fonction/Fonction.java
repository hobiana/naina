/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package fonction;

import db.DBUtils;
import java.sql.*;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import mapping.*;
import mapping.Categorie;

/**
 *
 * @author Hobiana
 */
public class Fonction {
    DBUtils db=new DBUtils();
    
    public static java.util.Date todate(String date) throws Exception{
        try{
            Calendar c=Calendar.getInstance();
            c.setTime(java.sql.Date.valueOf(date));
        }catch(Exception ex){
            throw new Exception("date invalide");
        }
        String[] ponct=new String[3];
        ponct[0]="/";
        ponct[1]=".";
        ponct[2]="-";
        String a=date;
        java.util.Date d=null;
        int temp=0;
        for(int i=0;i<ponct.length;i++){
            temp=date.indexOf(ponct[i]);
            if(temp!=-1){
                String pattern="yy"+ponct[i]+"MM"+ponct[i]+"dd";
                SimpleDateFormat sdf=new SimpleDateFormat(pattern);
                try {
                    d=sdf.parse(date);
                } catch (ParseException ex) {
                    throw new Exception("date invalide");
                }
                break;
            }
        }
        if(temp==-1){
            throw new Exception("date invalide");
        }
        return d;
    }
    
    public static String toformatdate(java.util.Date date){
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        return sdf.format(date);
    }
    
    public static String toformatdate2(java.util.Date date){
        SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
        return sdf.format(date);
    }
    
    public static String getDateDuJour() {
        java.util.Date d = new java.util.Date();
        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        String dat = dateFormat.format(d);
        return dat;
    }
    
    public int getNextsequence(String nomseq,Connection con)
    {
        String seq="select nextval('"+nomseq+"')";
        int sequ=0;
        
        try{

            java.sql.Statement stmt = con.createStatement();
            ResultSet sequence = stmt.executeQuery(seq);
            sequence.next();

            sequ = sequence.getInt(1);

            stmt.close();
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
        return sequ;
    }
    
    
    public void insertLEVEL(Level lv)
    {
        int sequence=-1;
        int valeur=-1;
        try{
            Connection con =db.getConn();
            
            java.sql.Statement stmt = con.createStatement();
            sequence=this.getNextsequence("level_id_acces_seq",con);
            
            String sql="insert into level values ("+sequence+","+lv.getLevel()+")";
            valeur=stmt.executeUpdate(sql);
            
            //con.commit();
            
            stmt.close();
            con.close();
            
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
    }
    
    public void insertCATEGORIE(Categorie c)
    {
        int sequence=-1;
        int valeur=-1;
        try{
            Connection con =db.getConn();
            
            java.sql.Statement stmt = con.createStatement();
            sequence=this.getNextsequence(" article_id_article_seq",con);
            
            String sql="insert into categorie values ("+sequence+",'"+c.getNomCategorie()+"',true)";
            valeur=stmt.executeUpdate(sql);
            
            stmt.close();
            con.close();
            
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
    }
    
    public void insertSOUSCATEGORIE(SousCategorie c)
    {
        int sequence=-1;
        int valeur=-1;
        try{
            Connection con =db.getConn();
            
            java.sql.Statement stmt = con.createStatement();
            sequence=this.getNextsequence(" sous_categorie_id_sous_categorie_seq",con);
            
            String sql="insert into sous_categorie values ("+sequence+","+c.getIdCategorie()+",'"+c.getNom()+"',true)";
            valeur=stmt.executeUpdate(sql);
            
            stmt.close();
            con.close();
            
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
    }
    
    public void insertPRIX_historique(Prix p,Connection con) throws Exception
    {
        int sequence=-1;
        int valeur=-1;
        
        String date=this.getDateDuJour();

        java.sql.Statement stmt = con.createStatement();
        sequence=this.getNextsequence(" historique_prix_idhp_seq",con);

        String sql="insert into historique_prix values ("+sequence+","+p.getIdArticle()+","+p.getPrix()+",'"+date+"')";
        valeur=stmt.executeUpdate(sql);

        stmt.close();
    }
    
    public void updatePRIX_actuelle(int id_article,int prix,Connection con) throws Exception
    {
        int sequence=-1;
        int valeur=-1;
        
        String date=this.getDateDuJour();

        java.sql.Statement stmt = con.createStatement();
        sequence=this.getNextsequence(" historique_prix_idhp_seq",con);

        String sql="update prix_actuelle set prix_unitaire="+prix+"where id_article="+id_article;
        valeur=stmt.executeUpdate(sql);

        stmt.close();
    }
    
    public void insertPRIX_actuelle(Prix p,Connection con) throws Exception
    {
        int sequence=-1;
        int valeur=-1;

        java.sql.Statement stmt = con.createStatement();
        sequence=this.getNextsequence("prix_actuelle_id_prix_seq",con);

        String sql="insert into prix_actuelle values ("+sequence+","+p.getIdArticle()+","+p.getPrix()+")";
        valeur=stmt.executeUpdate(sql);

        stmt.close();
    }
    
    public void insertARTICLE(Article a,Prix p)
    {
        int sequence=-1;
        int valeur=-1;
        try{
            Connection con =db.getConn();
            
            java.sql.Statement stmt = con.createStatement();
            sequence=this.getNextsequence("article_id_article_seq",con);
            
            String sql="insert into article values ("+sequence+","+a.getIdcategorie()+","+a.getIdSousCategorie()+",'"+a.getNomArticle()+"','"+a.getDescription()+"','"+a.getMarque()+"','"+a.getImage()+"',true)";
            valeur=stmt.executeUpdate(sql);
            
            p=new Prix(sequence,p.getPrix());
            this.insertPRIX_actuelle(p,con);
            this.insertPRIX_historique(p,con);
            
            stmt.close();
            con.close();
            
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
    }
    
    //taille
     public int getTableSize(String table,String condition,Connection con)
    {
        int taille=-1;
        try
        {
            String sql="select count(*) from "+table+" "+condition;
            java.sql.Statement stmt = con.createStatement();
            ResultSet compte = stmt.executeQuery(sql);
            compte.next();

            taille = compte.getInt(1);

            stmt.close();
        }
        catch (Exception e1)
        {
            System.out.println("tsy tafiditra tailleData");
            e1.printStackTrace();
        }
        return taille;
    }
     
     public int getTableSize(String table,String condition)
    {
        int taille=-1;
        try
        {
            Connection con =db.getConn();
            
            String sql="select count(*) from "+table+" "+condition;
            java.sql.Statement stmt = con.createStatement();
            ResultSet compte = stmt.executeQuery(sql);
            compte.next();

            taille = compte.getInt(1);

            stmt.close();
            con.close();
        }
        catch (Exception e1)
        {
            System.out.println("tsy tafiditra tailleData");
            e1.printStackTrace();
        }
        return taille;
    }
    
    //getters
    public Categorie[] getLISTCATEGORIE() throws Exception
    {
        Categorie[] cat=null;
         try{
            Connection con =db.getConn();
            
            String sql= "select id_categorie,nom from categorie where status=true";
            java.sql.Statement stmt = con.createStatement();
            ResultSet res = stmt.executeQuery(sql);
            int taille=getTableSize("categorie","where status=true",con);
            cat=new Categorie[taille];
            int i=0;
            while (res.next())
            {
                cat[i]=new Categorie(res.getInt(1),res.getString(2));
                i++;
            }
            stmt.close();
            con.close();
            
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
        return cat;
    }
    
    public SousCategorie[] getLIST_SOUSCATEGORIE(int idCategorie) throws Exception
    {
        SousCategorie[] cat=null;
         try{
            Connection con =db.getConn();
            
            String sql= "select id_sous_categorie,nom from sous_categorie where id_categorie="+idCategorie+" and status=true";
            java.sql.Statement stmt = con.createStatement();
            ResultSet res = stmt.executeQuery(sql);
            
            String sql2="where status=true and id_categorie="+idCategorie;
            int taille=getTableSize("sous_categorie",sql2,con);
            cat=new SousCategorie[taille];
            int i=0;
            while (res.next())
            {
                cat[i]=new SousCategorie(res.getInt(1),res.getString(2));
                i++;
            }
            stmt.close();
            con.close();
            
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
        return cat;
    }
    
    public String getPrixArticle(int id_article){
        String prix=null;
         try{
            Connection con =db.getConn();
            
            String sql= "select prix_unitaire from prix where id_article="+id_article+" order by id_article desc limit 1";
            
            java.sql.Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            
            while(rs.next()){
                prix=rs.getString(1);
            }
            stmt.close();
            con.close();
            
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
        return prix;
    }
    
    public Article2[] listArticle()
    {
        Article2[] art=null;
         try{
            Connection con =db.getConn();
            
            String sql= "select a.id_article,p.prix_unitaire,c.nom,sc.nom,a.nom,description,a.marque,a.image from article as a \n" +
                        "join prix_actuelle as p on p.id_article=a.id_article\n" +
                        "join categorie as c on c.id_categorie=a.id_categorie\n" +
                        "join sous_categorie as sc on sc.id_sous_categorie=a.id_sous_categorie\n"+
                        "where a.status=true";
   
            
            java.sql.Statement stmt = con.createStatement();
            ResultSet res = stmt.executeQuery(sql);
            
            int taille=getTableSize("article","where status=true",con);
            art=new Article2[taille];
            int i=0;
            while (res.next())
            {
                art[i]=new Article2(res.getString(1),res.getString(2),res.getString(3),res.getString(4),res.getString(5),res.getString(6),res.getString(7),res.getString(8));
                i++;
            }
            stmt.close();
            con.close();
            
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
        return art;
    }
    
    public ArrayList<Article2> rechercheARTICLE(String nom,String description,int min,int max)
    {
        ArrayList<Article2> art = new ArrayList();
         try{
            Connection con =db.getConn();
            
            String query="";
            if(nom!=null || description !=null || min!=-1 || max!=-1 ){
                if(nom!=null){
                    query+= "a.nom ILIKE '%"+nom+"%' ";
                    if(description!=null || min!=-1 || max!=-1) {
                        query = query + " AND ";
                    }
                }
                if(description!=null){
                    query+= "description ILIKE '%"+description+"%' ";
                    if(min!=-1 || max!=-1){
                        query = query + " AND ";
                    }
                }
                if(min!=-1){
                    query+= "p.prix_unitaire >= "+min+" ";
                    if( max!=-1){
                        query = query + " AND ";
                    }
                }
                if(max!=-1){
                    query+= "p.prix_unitaire <= "+max+"";
                }
            }
            else
                query="1=1";
            
            
            
            String sql= "select a.id_article,p.prix_unitaire,c.nom,sc.nom,a.nom,description,a.marque,a.image from article as a \n" +
                        "join prix_actuelle as p on p.id_article=a.id_article\n" +
                        "join categorie as c on c.id_categorie=a.id_categorie\n" +
                        "join sous_categorie as sc on sc.id_sous_categorie=a.id_sous_categorie where a.status=true and "+query;
   
            
            java.sql.Statement stmt = con.createStatement();
            ResultSet res = stmt.executeQuery(sql);
            
            while(res.next()){
                art.add(new Article2(res.getString(1),res.getString(2),res.getString(3),res.getString(4),res.getString(5),res.getString(6),res.getString(7),res.getString(8)));
            }
            stmt.close();
            con.close();
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
        return art;
    }
    
    public void delete_prix(int id_article,Connection con){
        int valeur=-1;
        try{            
            java.sql.Statement stmt = con.createStatement();
            
            String sql="delete from prix where id_article="+id_article;
            valeur=stmt.executeUpdate(sql);
            
            stmt.close();
            
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
    }
    
    public void delete_article(int id_article){
        int valeur=-1;
        try{
            Connection con =db.getConn();
            
            java.sql.Statement stmt = con.createStatement();
            String sql="update article set status=false where id_article="+id_article;
            valeur=stmt.executeUpdate(sql);
            
            stmt.close();
            con.close();
            
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
    }
    
    public void delete_article(int id_article,Connection con){
        int valeur=-1;
        try{
            
            java.sql.Statement stmt = con.createStatement();
            String sql="update article set status=false where id_article="+id_article;
            valeur=stmt.executeUpdate(sql);
            
            stmt.close();
            
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
    }
    
    public Article2 get_FicheArticle(int id_article){
        Article2 art=null;
         try{
            Connection con =db.getConn();
            
            String sql= "select a.id_article,p.prix_unitaire,c.nom,sc.nom,a.nom,description,a.marque,a.image from article as a \n" +
                        "join prix_actuelle as p on p.id_article=a.id_article\n" +
                        "join categorie as c on c.id_categorie=a.id_categorie\n" +
                        "join sous_categorie as sc on sc.id_sous_categorie=a.id_sous_categorie\n" +
                        "where a.id_article="+id_article;
   
            
            java.sql.Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            
            while(rs.next()){
                art=new Article2(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6),rs.getString(7),rs.getString(8));
            }
            stmt.close();
            con.close();
            
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
        return art;
    }
    
    public int getIdCategorie(String categorie){
        int id=-1;
         try{
            Connection con =db.getConn();
            
            String sql= "select id_categorie from categorie where nom='"+categorie+"'";
   
            
            java.sql.Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            
            while(rs.next()){
                id=rs.getInt(1);
            }
            stmt.close();
            con.close();
            
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
        return id;
    }
    
    public int getIdSousCategorie(String souscategorie){
        int id=-1;
         try{
            Connection con =db.getConn();
            
            String sql= "select id_sous_categorie from sous_categorie where nom='"+souscategorie+"' order by id_sous_categorie desc limit 1";
   
            
            java.sql.Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            
            while(rs.next()){
                id=rs.getInt(1);
            }
            stmt.close();
            con.close();
            
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
        return id;
    }
    
    public void modifier_Article(Article a,Prix p,String id_article){
        int valeur=-1;
        try{
            Connection con =db.getConn();
            
            java.sql.Statement stmt = con.createStatement();
            
            String sql="update article set id_categorie="+a.getIdcategorie()+", id_sous_categorie="+a.getIdSousCategorie()+", nom='"+a.getNomArticle()+"', description='"+ a.getDescription() +"', marque='"+a.getMarque()+"', image='"+a.getImage()+"'"
                    + " where id_article=  "+id_article;
            valeur=stmt.executeUpdate(sql);
            int id_art=Integer.parseInt(id_article);
            p=new Prix(id_art,p.getPrix());
            this.updatePRIX_actuelle(id_art,p.getPrix(),con);
            this.insertPRIX_historique(p,con);
            
            
            stmt.close();
            con.close();
            
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
    }
    
    public int[] get_id_article(int id_categorie,Connection con){
        int[] id=null;
         try{
            
            String sql= "select id_article from article where id_categorie="+id_categorie;
   
            
            java.sql.Statement stmt = con.createStatement();
            ResultSet res = stmt.executeQuery(sql);
            
            String sql2="where id_categorie="+id_categorie;
            int taille=getTableSize("article",sql2,con);
            id=new int[taille];
            int i=0;
            while (res.next())
            {
                id[i]=res.getInt(1);
                i++;
            }
            stmt.close();
            
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
        return id;
    }
    
    public void delete_article_du_categorie(int id_categorie,Connection con){
        int[] id_article=this.get_id_article(id_categorie,con);
        for(int i=0;i<id_article.length;i++){
            System.out.println(id_article[i]);
            this.delete_article(id_article[i],con);
        }
    }
    
    public void delete_sous_categorie(int id_categorie,Connection con){
        int valeur=-1;
        try{
            String sql= "update sous_categorie set status=false where id_categorie="+id_categorie;
            
            java.sql.Statement stmt = con.createStatement();
            valeur= stmt.executeUpdate(sql);
            
            stmt.close();
            
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
    }
    
    public void delete_categorie(int id_categorie){
        int valeur=-1;
        try{
            Connection con =db.getConn();
            
            this.delete_article_du_categorie(id_categorie,con);
            this.delete_sous_categorie(id_categorie, con);
            
            String sql= "update categorie set status=false where id_categorie="+id_categorie;
   
            
            java.sql.Statement stmt = con.createStatement();
            valeur= stmt.executeUpdate(sql);
            
            stmt.close();
            con.close();
            
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
    }
    
    public void insertCLIENT(Client c){
        int valeur=-1;
        try{
            Connection con =db.getConn();
            String sql= "insert into client values('"+c.getNom()+"','"+c.getDate_naissance()+"''"+c.getMdp()+"''"+c.getLogin()+"''"+c.getAdresse()+"''"+c.getNumero()+"''"+c.getEmail()+"')";
            
            java.sql.Statement stmt = con.createStatement();
            valeur= stmt.executeUpdate(sql);
            
            stmt.close();
            
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
    }
    
    public boolean checkClient(String email,String password){
        int count=-1;
         try{
            Connection con =db.getConn();
            
            String sql= "select count(*) from client where email='"+email+"' and mdp='"+password+"'";
   
            
            java.sql.Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            
            while(rs.next()){
                count=rs.getInt(1);
            }
            stmt.close();
            con.close();
            if(count==1){
                return true;
            }
            
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
        return false;
    }
    
    public Client getClient(String email,String mdp){
        Client c=null;
        try{
            Connection con =db.getConn();
            
            String sql= "select nom,adresse,numero,email,id_client from client where email='"+email+"' and mdp='"+mdp+"'";
   
            
            java.sql.Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            
            while(rs.next()){
                c=new Client(rs.getString(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5));
            }
            stmt.close();
            con.close();
            
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
        return c;
    }
    
    public int checkSiExisteDansPanier(Panier p,Article2 art){
        int rep=-1;
        for(int i=0;i<p.getList_art().size();i++){
            if(p.getList_art().get(i).getArt().getIdArticle().equals(art.getIdArticle())){
                rep=i;
            }
        }
        return rep;
    }
    
    public void insertFactureFille(PanierArticle pa,int idFacture_mere,String idarticle,Connection con){
        int valeur=-1;
        try{
            String sql= "insert into facture_fille values(nextval('facture_fille_idfacturefille_seq'),"+idFacture_mere+","+idarticle+","+pa.getQuantite()+")";
            
            java.sql.Statement stmt = con.createStatement();
            valeur= stmt.executeUpdate(sql);
            
            stmt.close();
            
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
    }
    
    public int insertFactureMere(Panier p,String idclient){
        int valeur=-1;
        try{
            Connection con =db.getConn();
            
            int sequence=this.getNextsequence("facture_mere_id_facture_seq", con);
            valeur=sequence;
            String sql= "insert into facture_mere values("+sequence+","+idclient+",'F"+String.format("%05d", sequence)+"',"+p.getTotal()+","+p.getRemise()+",20,'"+Fonction.getDateDuJour()+"')";
            java.sql.Statement stmt = con.createStatement();
            valeur= stmt.executeUpdate(sql);
            
            for (PanierArticle list_art : p.getList_art()) {
                insertFactureFille(list_art, sequence, list_art.getArt().getIdArticle(), con);
            }
            
            stmt.close();
            con.close();
            
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
        return valeur;
    }
    
    public double getRemise(int montant){
        double rep=-1;
         try{
            
            String sql= "select remise from remise where "+montant+">sommemin and "+montant+"<= sommemax";
   
            Connection con=db.getConn();
            java.sql.Statement stmt = con.createStatement();
            ResultSet res = stmt.executeQuery(sql);
            
            while (res.next())
            {
                rep=res.getDouble(1);
            }
            stmt.close();
            
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
        return rep;
    }
}
