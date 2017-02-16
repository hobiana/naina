/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package fonction;

import db.DBUtils;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import mapping.Article;
import mapping.Article2;
import mapping.Categorie;
import mapping.Client;
import mapping.Level;
import mapping.Panier;
import mapping.PanierArticle;
import mapping.Prix;
import mapping.SousCategorie;
import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import static org.junit.Assert.*;

/**
 *
 * @author Hobiana
 */
public class FonctionTest {
    
    
    public FonctionTest() {
    }
    
    @BeforeClass
    public static void setUpClass() {
        
    }
    
    @AfterClass
    public static void tearDownClass() {
    }
    
    @Before
    public void setUp() {
        
    }
    
    @After
    public void tearDown() throws SQLException {
        DBUtils db=new DBUtils();
        Connection con=db.getConn();
        
        String deleteprix_historique="delete from historique_prix where idhp>12";
        String deleteprix_actuelle="delete from prix_actuelle where id_prix>12";
        String delete_article="delete from article where id_article>12";
        
        java.sql.Statement stmt = con.createStatement();
        stmt.executeUpdate(deleteprix_historique);
        stmt.executeUpdate(deleteprix_actuelle);
        stmt.executeUpdate(delete_article);
            
        stmt.close();
        con.close();
    }

    

    
    @Test
    public void testRechercheARTICLE() {
        System.out.println("rechercheARTICLE");
        String nom = "ASUS ROG Strix G702VM-GC072T";
        String description = "";
        int min = -1;
        int max = -1;
        Fonction instance = new Fonction();
        ArrayList<Article2> expResult = new ArrayList<Article2>();
        expResult.add(new Article2("1", "3500000", "ELECTRONICS", "Computer", "ASUS ROG Strix G702VM-GC072T", "ASUS ROG Strix G702VM-GC072T", "Asus"));
        ArrayList<Article2> result = instance.rechercheARTICLE(nom, description, min, max);
        assertEquals(expResult.size(), result.size());
    }
    
    @Test
    public void testInsertPRIX_historique() throws Exception {
        DBUtils db=new DBUtils();
        Connection con=db.getConn();
        
        System.out.println("insertPRIX_historique");
        Prix p = new Prix(10, 50000);
        Fonction instance = new Fonction();
        instance.insertPRIX_historique(p, con);
        int count=0;
        
        String sql="select count(*) from historique_prix";
        java.sql.Statement stmt = con.createStatement();
        ResultSet rs = stmt.executeQuery(sql);
            
        if(rs.next()){
            count=rs.getInt(1);
        }
        stmt.close();
        con.close();
        
        assertEquals(12, count-1);
        // TODO review the generated test code and remove the default call to fail.
        //fail("The test case is a prototype.");
    }

    
    @Test
    public void testInsertPRIX_actuelle() throws Exception {
        DBUtils db=new DBUtils();
        Connection con=db.getConn();
        
        System.out.println("insertPRIX_actuelle");
        Prix p = new Prix(10, 50000);
        Fonction instance = new Fonction();
        instance.insertPRIX_actuelle(p, con);
        int count=0;
        
        String sql="select count(*) from prix_actuelle";
        java.sql.Statement stmt = con.createStatement();
        ResultSet rs = stmt.executeQuery(sql);
            
        if(rs.next()){
            count=rs.getInt(1);
        }
        stmt.close();
        con.close();
        
        assertEquals(12, count-1);
        // TODO review the generated test code and remove the default call to fail.
        //fail("The test case is a prototype.");
    }

    
    @Test
    public void testInsertARTICLE() throws SQLException {
        DBUtils db=new DBUtils();
        Connection con=db.getConn();
        
        System.out.println("insertARTICLE");
        Article a = new Article(1, 1, 1, "blabla", "HP", "image/image.jpg");
        Prix p = new Prix(1, 50000);
        Fonction instance = new Fonction();
        instance.insertARTICLE(a, p);
        int count=0;
        
        String sql="select count(*) from article";
        java.sql.Statement stmt = con.createStatement();
        ResultSet rs = stmt.executeQuery(sql);
            
        if(rs.next()){
            count=rs.getInt(1);
        }
        stmt.close();
        con.close();
        
        assertEquals(12, count-1);
        // TODO review the generated test code and remove the default call to fail.
        //fail("The test case is a prototype.");
    }

    
    /*@Test
    public void testGetTableSize_3args() {
        System.out.println("getTableSize");
        String table = "";
        String condition = "";
        Connection con = null;
        Fonction instance = new Fonction();
        int expResult = 0;
        int result = instance.getTableSize(table, condition, con);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        //fail("The test case is a prototype.");
    }

    
    @Test
    public void testGetTableSize_String_String() {
        System.out.println("getTableSize");
        String table = "";
        String condition = "";
        Fonction instance = new Fonction();
        int expResult = 0;
        int result = instance.getTableSize(table, condition);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        //fail("The test case is a prototype.");
    }

    
    @Test
    public void testGetLISTCATEGORIE() throws Exception {
        System.out.println("getLISTCATEGORIE");
        Fonction instance = new Fonction();
        Categorie[] expResult = null;
        Categorie[] result = instance.getLISTCATEGORIE();
        assertArrayEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        //fail("The test case is a prototype.");
    }

    
    @Test
    public void testGetLIST_SOUSCATEGORIE() throws Exception {
        System.out.println("getLIST_SOUSCATEGORIE");
        int idCategorie = 0;
        Fonction instance = new Fonction();
        SousCategorie[] expResult = null;
        SousCategorie[] result = instance.getLIST_SOUSCATEGORIE(idCategorie);
        assertArrayEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        //fail("The test case is a prototype.");
    }

    
    @Test
    public void testGetPrixArticle() {
        System.out.println("getPrixArticle");
        int id_article = 0;
        Fonction instance = new Fonction();
        String expResult = "";
        String result = instance.getPrixArticle(id_article);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        //fail("The test case is a prototype.");
    }

    
    @Test
    public void testListArticle() {
        System.out.println("listArticle");
        Fonction instance = new Fonction();
        Article2[] expResult = null;
        Article2[] result = instance.listArticle();
        assertArrayEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        //fail("The test case is a prototype.");
    }

    
    @Test
    public void testDelete_prix() {
        System.out.println("delete_prix");
        int id_article = 0;
        Connection con = null;
        Fonction instance = new Fonction();
        instance.delete_prix(id_article, con);
        // TODO review the generated test code and remove the default call to fail.
        //fail("The test case is a prototype.");
    }

    
    @Test
    public void testDelete_article_int() {
        System.out.println("delete_article");
        int id_article = 0;
        Fonction instance = new Fonction();
        instance.delete_article(id_article);
        // TODO review the generated test code and remove the default call to fail.
        //fail("The test case is a prototype.");
    }

    
    @Test
    public void testDelete_article_int_Connection() {
        System.out.println("delete_article");
        int id_article = 0;
        Connection con = null;
        Fonction instance = new Fonction();
        instance.delete_article(id_article, con);
        // TODO review the generated test code and remove the default call to fail.
        //fail("The test case is a prototype.");
    }

    
    @Test
    public void testGet_FicheArticle() {
        System.out.println("get_FicheArticle");
        int id_article = 0;
        Fonction instance = new Fonction();
        Article2 expResult = null;
        Article2 result = instance.get_FicheArticle(id_article);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        //fail("The test case is a prototype.");
    }

    
    @Test
    public void testGetIdCategorie() {
        System.out.println("getIdCategorie");
        String categorie = "";
        Fonction instance = new Fonction();
        int expResult = 0;
        int result = instance.getIdCategorie(categorie);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        //fail("The test case is a prototype.");
    }

    
    @Test
    public void testGetIdSousCategorie() {
        System.out.println("getIdSousCategorie");
        String souscategorie = "";
        Fonction instance = new Fonction();
        int expResult = 0;
        int result = instance.getIdSousCategorie(souscategorie);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        //fail("The test case is a prototype.");
    }

    
    @Test
    public void testModifier_Article() {
        System.out.println("modifier_Article");
        Article a = null;
        Prix p = null;
        String id_article = "";
        Fonction instance = new Fonction();
        instance.modifier_Article(a, p, id_article);
        // TODO review the generated test code and remove the default call to fail.
        //fail("The test case is a prototype.");
    }

   
    @Test
    public void testGet_id_article() {
        System.out.println("get_id_article");
        int id_categorie = 0;
        Connection con = null;
        Fonction instance = new Fonction();
        int[] expResult = null;
        int[] result = instance.get_id_article(id_categorie, con);
        assertArrayEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        //fail("The test case is a prototype.");
    }

    
    @Test
    public void testDelete_article_du_categorie() {
        System.out.println("delete_article_du_categorie");
        int id_categorie = 0;
        Connection con = null;
        Fonction instance = new Fonction();
        instance.delete_article_du_categorie(id_categorie, con);
        // TODO review the generated test code and remove the default call to fail.
        //fail("The test case is a prototype.");
    }

    
    @Test
    public void testDelete_sous_categorie() {
        System.out.println("delete_sous_categorie");
        int id_categorie = 0;
        Connection con = null;
        Fonction instance = new Fonction();
        instance.delete_sous_categorie(id_categorie, con);
        // TODO review the generated test code and remove the default call to fail.
        //fail("The test case is a prototype.");
    }

   
    @Test
    public void testDelete_categorie() {
        System.out.println("delete_categorie");
        int id_categorie = 0;
        Fonction instance = new Fonction();
        instance.delete_categorie(id_categorie);
        // TODO review the generated test code and remove the default call to fail.
        //fail("The test case is a prototype.");
    }

    
    @Test
    public void testInsertCLIENT() {
        System.out.println("insertCLIENT");
        Client c = null;
        Fonction instance = new Fonction();
        instance.insertCLIENT(c);
        // TODO review the generated test code and remove the default call to fail.
        //fail("The test case is a prototype.");
    }

   
    @Test
    public void testCheckClient() {
        System.out.println("checkClient");
        String email = "";
        String password = "";
        Fonction instance = new Fonction();
        boolean expResult = false;
        boolean result = instance.checkClient(email, password);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        //fail("The test case is a prototype.");
    }

    
    public void testGetClient() {
        System.out.println("getClient");
        String email = "";
        String mdp = "";
        Fonction instance = new Fonction();
        Client expResult = null;
        Client result = instance.getClient(email, mdp);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        //fail("The test case is a prototype.");
    }

    
    @Test
    public void testCheckSiExisteDansPanier() {
        System.out.println("checkSiExisteDansPanier");
        Panier p = null;
        Article2 art = null;
        Fonction instance = new Fonction();
        int expResult = 0;
        int result = instance.checkSiExisteDansPanier(p, art);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        //fail("The test case is a prototype.");
    }

    
    @Test
    public void testInsertFactureFille() {
        System.out.println("insertFactureFille");
        PanierArticle pa = null;
        int idFacture_mere = 0;
        String idarticle = "";
        Connection con = null;
        Fonction instance = new Fonction();
        instance.insertFactureFille(pa, idFacture_mere, idarticle, con);
        // TODO review the generated test code and remove the default call to fail.
        //fail("The test case is a prototype.");
    }

    
    @Test
    public void testInsertFactureMere() {
        System.out.println("insertFactureMere");
        Panier p = null;
        String idclient = "";
        Fonction instance = new Fonction();
        int expResult = 0;
        int result = instance.insertFactureMere(p, idclient);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        //fail("The test case is a prototype.");
    }

   
    @Test
    public void testGetRemise() {
        System.out.println("getRemise");
        int montant = 0;
        Fonction instance = new Fonction();
        double expResult = 0.0;
        double result = instance.getRemise(montant);
        assertEquals(expResult, result, 0.0);
        // TODO review the generated test code and remove the default call to fail.
        //fail("The test case is a prototype.");
    }
    */
    
    
}
