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
public class AddArticleToPanier extends HttpServlet {

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int idArticle = Integer.parseInt(request.getParameter("idarticle"));
        int quantite = Integer.parseInt(request.getParameter("quantite"));

        Fonction f = new Fonction();
        Article2 art = f.get_FicheArticle(idArticle);

        HttpSession session = request.getSession();
        session.setMaxInactiveInterval(3600);

        Panier panier = null;
        if (null != session.getAttribute("panier")) {
            panier = (Panier) session.getAttribute("panier");

            int positionArticle = f.checkSiExisteDansPanier(panier, art);
            if (positionArticle != -1) {
                int quantiteAncient = panier.getList_art().get(positionArticle).getQuantite();
                int prix_unitaire_article = panier.getList_art().get(positionArticle).getArt().getPrixInt();

                panier.getList_art().get(positionArticle).setQuantite(quantiteAncient + quantite);
                panier.getList_art().get(positionArticle).setMontant(prix_unitaire_article, quantiteAncient + quantite);
            } 
            else {
                panier.getList_art().add(new PanierArticle(art, quantite));
            }

        }

        response.sendRedirect("http://localhost:8084/Baovola_Front/product_summary.jsp");
    }

}
