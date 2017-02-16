package mapping;


public class Categorie {
	private int idCategorie;
	private String nomCategorie;
	
	public String getNomCategorie() {
		return nomCategorie;
	}
	public void setNomCategorie(String nomCategorie) {
		this.nomCategorie = nomCategorie;
	}
	public int getIdCategorie() {
		return idCategorie;
	}
	public void setIdCategorie(int idCategorie) {
		this.idCategorie = idCategorie;
	}

    public Categorie(String nomCategorie) {
        this.nomCategorie = nomCategorie;
    }

    public Categorie(int idCategorie, String nomCategorie) {
        this.idCategorie = idCategorie;
        this.nomCategorie = nomCategorie;
    }

    
	
}
