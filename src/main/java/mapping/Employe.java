package mapping;

import java.sql.Date;

public class Employe {
	private int idEmploye;
	private double salaire;
	private String poste;
	private String magasin;
	private String nom;
	private String CIN;
	private Date date_entree;
	private Date date_naissance;
	private String adresse;
	private String numero;
	private String email;

	public int getIdEmploye() {
		return idEmploye;
	}

	public void setIdEmploye(int idEmploye) {
		this.idEmploye = idEmploye;
	}

	public double getSalaire() {
		return salaire;
	}

	public void setSalaire(double salaire) {
		this.salaire = salaire;
	}

	public String getPoste() {
		return poste;
	}

	public void setPoste(String poste) {
		this.poste = poste;
	}

	public String getMagasin() {
		return magasin;
	}

	public void setMagasin(String magasin) {
		this.magasin = magasin;
	}

	public String getNom() {
		return nom;
	}

	public void setNom(String nom) {
		this.nom = nom;
	}

	public String getCIN() {
		return CIN;
	}

	public void setCIN(String cIN) {
		CIN = cIN;
	}

	public Date getDate_entree() {
		return date_entree;
	}

	public void setDate_entree(Date date_entree) {
		this.date_entree = date_entree;
	}

	public Date getDate_naissance() {
		return date_naissance;
	}

	public void setDate_naissance(Date date_naissance) {
		this.date_naissance = date_naissance;
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

    public Employe(double salaire, String poste, String magasin, String nom, String CIN, Date date_entree, Date date_naissance, String adresse, String numero, String email) {
        this.salaire = salaire;
        this.poste = poste;
        this.magasin = magasin;
        this.nom = nom;
        this.CIN = CIN;
        this.date_entree = date_entree;
        this.date_naissance = date_naissance;
        this.adresse = adresse;
        this.numero = numero;
        this.email = email;
    }
	
}
