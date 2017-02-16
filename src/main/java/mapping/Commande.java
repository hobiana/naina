package mapping;

import java.sql.Date;

public class Commande {
	private int idCommande;
	private int idClient;
	private int no_commande;
	private int quantiteCommande;
	private Date dateCommande;
	
	public int getIdCommande() {
		return idCommande;
	}
	public void setIdCommande(int idCommande) {
		this.idCommande = idCommande;
	}
	public int getIdClient() {
		return idClient;
	}
	public void setIdClient(int idClient) {
		this.idClient = idClient;
	}
	public int getNo_commande() {
		return no_commande;
	}
	public void setNo_commande(int no_commande) {
		this.no_commande = no_commande;
	}
	public int getQuantiteCommande() {
		return quantiteCommande;
	}
	public void setQuantiteCommande(int quantiteCommande) {
		this.quantiteCommande = quantiteCommande;
	}
	public Date getDateCommande() {
		return dateCommande;
	}
	public void setDateCommande(Date dateCommande) {
		this.dateCommande = dateCommande;
	}

    public Commande(int idClient, int no_commande, int quantiteCommande, Date dateCommande) {
        this.idClient = idClient;
        this.no_commande = no_commande;
        this.quantiteCommande = quantiteCommande;
        this.dateCommande = dateCommande;
    }

}
