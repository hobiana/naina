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
import mapping.Client;

/**
 *
 * @author Hobiana
 */
public class InsertClient extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String firstname=request.getParameter("firstname");
        String lastname=request.getParameter("lastname");
        String user=request.getParameter("user");
        String password=request.getParameter("password");
        String comfirmpassword=request.getParameter("confirmpassword");
        String dateofbirth=request.getParameter("dateofbirth");
        String email=request.getParameter("email");
        String address=request.getParameter("address");
        String mobilephone=request.getParameter("mobilephone");
        
        try {
            /*
            String remoteAddr = request.getRemoteAddr();
            ReCaptchaImpl reCaptcha = new ReCaptchaImpl();
            reCaptcha.setPrivateKey("6LeIxAcTAAAAAGG-vFI1TnRWxMZNFuojJ4WifJWe");
            
            
            String challenge = request.getParameter("recaptcha_challenge_field");
            String uresponse = request.getParameter("recaptcha_response_field");
            ReCaptchaResponse reCaptchaResponse = reCaptcha.checkAnswer(remoteAddr, challenge, uresponse);
            
            if (reCaptchaResponse.isValid()) {
            
            } else {
            
            }*/
            
            Client c=new Client(firstname+" "+lastname, dateofbirth, password, user, address, mobilephone,email);
            Fonction f=new Fonction();
            f.insertCLIENT(c);
            
        } catch (Exception ex) {
            Logger.getLogger(InsertClient.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}
