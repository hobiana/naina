package mapping;

import fonction.Fonction;
import java.util.Date;

public class Client {

    private String idclient;
    private String nom;
    private Date date_naissance;
    private String mdp;
    private String login;
    private String adresse;
    private String numero;
    private String email;

    public String getMdp() {
        return mdp;
    }

    public void setMdp(String mdp) {
        this.mdp = mdp;
    }

    public String getLogin() {
        return login;
    }

    public void setLogin(String login) {
        this.login = login;
    }

    public String getIdclient() {
        return idclient;
    }

    public void setIdclient(String idclient) {
        this.idclient = idclient;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public Date getDate_naissance() {
        return date_naissance;
    }

    public void setDate_naissance(String date_naissance) throws Exception {
        this.date_naissance = Fonction.todate(date_naissance);
    }

    public String getAdresse() {
        return adresse;
    }

    public void setAdresse(String adresse) {
        this.adresse = adresse;
    }

    public String getNumero() {
        return numero;
    }

    public void setNumero(String numero) {
        this.numero = numero;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Client(String id, String nom, String adresse, String numero, String email) {
        this.nom = nom;
        this.adresse = adresse;
        this.numero = numero;
        this.email = email;
        this.idclient = id;
    }

    public Client(String nom, String date_naissance, String mdp, String login, String adresse, String numero, String email) throws Exception {
        this.nom = nom;
        this.setDate_naissance(date_naissance);
        this.mdp = mdp;
        this.login = login;
        this.adresse = adresse;
        this.numero = numero;
        this.email = email;
    }

}
