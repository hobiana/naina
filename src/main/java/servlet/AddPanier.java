/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import fonction.Fonction;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import mapping.Article2;
import mapping.Panier;
import mapping.PanierArticle;

/**
 *
 * @author Hobiana
 */
public class AddPanier extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int idArticle=Integer.parseInt(request.getParameter("idarticle"));
        String uri=request.getParameter("uri");
        
        Fonction f=new Fonction();
        Article2 art=f.get_FicheArticle(idArticle);
        
        HttpSession session = request.getSession();
        session.setMaxInactiveInterval(3600);
        
        Panier panier=null;
        if( null!=session.getAttribute("panier")){
            
            panier=(Panier)session.getAttribute("panier");
            
            int positionArticle=f.checkSiExisteDansPanier(panier, art);
            if(positionArticle!=-1){
                int quantite=panier.getList_art().get(positionArticle).getQuantite();
                int prix_unitaire_article=panier.getList_art().get(positionArticle).getArt().getPrixInt();
                
                panier.getList_art().get(positionArticle).setQuantite(quantite+1);
                panier.getList_art().get(positionArticle).setMontant(prix_unitaire_article, quantite+1);
            }
            else{
                panier.getList_art().add(new PanierArticle(art, 1));
            }
            
            
        }
        
        response.sendRedirect("http://localhost:8084"+uri);
    }

}
