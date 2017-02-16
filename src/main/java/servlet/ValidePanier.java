/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import fonction.Fonction;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import mapping.Client;
import mapping.FacturePDF;
import mapping.Panier;

/**
 *
 * @author Hobiana
 */
public class ValidePanier extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        Fonction f=new Fonction();
        
        HttpSession session = request.getSession();
        session.setMaxInactiveInterval(3600);
        
        Panier panier = (Panier) session.getAttribute("panier");
        Client c = (Client) session.getAttribute("client");
        int sequ=f.insertFactureMere(panier,c.getIdclient());
        try {
        } catch (Exception ex) {
            Logger.getLogger(ValidePanier.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        response.sendRedirect("http://localhost:8084/Baovola_Front/product_summary.jsp");
    }

}
