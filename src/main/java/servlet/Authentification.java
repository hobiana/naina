/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import fonction.Fonction;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import mapping.Client;
import mapping.Panier;
import mapping.PanierArticle;

/**
 *
 * @author Hobiana
 */
public class Authentification extends HttpServlet {


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
        String email=request.getParameter("email");
        String mdp=request.getParameter("mdp");
        String uri=request.getParameter("uri");
        String idart=request.getParameter("idarticle");
        
        Fonction f=new Fonction();
        boolean check=f.checkClient(email, mdp);
        if(check==true){
            Client c=f.getClient(email, mdp);
            Panier panier=new Panier();
            
            HttpSession session = request.getSession();
            session.setMaxInactiveInterval(999999999);
            
            session.setAttribute("client", c);
            session.setAttribute("panier", panier);
        }
        response.sendRedirect("http://localhost:8084"+uri);
    }

}
