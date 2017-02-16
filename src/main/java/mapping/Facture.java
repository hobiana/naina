package mapping;

public class Facture {
	private int idFacture;
	private int idPanier;
	
	public int getIdFacture() {
		return idFacture;
	}
	public void setIdFacture(int idFacture) {
		this.idFacture = idFacture;
	}
	public int getIdPanier() {
		return idPanier;
	}
	public void setIdPanier(int idPanier) {
		this.idPanier = idPanier;
	}

    public Facture(int idFacture, int idPanier) {
        this.idFacture = idFacture;
        this.idPanier = idPanier;
    }
        
}
