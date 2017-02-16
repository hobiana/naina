package mapping;

public class Article {
	private int idArticle;
	private int idcategorie;
        private int idSousCategorie;
	private String nomArticle;
	private String description;
        private String marque;
        private String image;

    public Article(int idArticle, int idcategorie, int idSousCategorie, String description,String marque,String image) {
        this.idArticle = idArticle;
        this.idcategorie = idcategorie;
        this.idSousCategorie = idSousCategorie;
        this.description = description;
        this.marque=marque;
        this.image=image;
    }

    public Article(int idcategorie, int idSousCategorie, String nomArticle, String description,String marque,String image) {
        this.idcategorie = idcategorie;
        this.idSousCategorie = idSousCategorie;
        this.nomArticle = nomArticle;
        this.description = description;
        this.marque=marque;
        this.image=image;
    }

    public int getIdArticle() {
        return idArticle;
    }

    public void setIdArticle(int idArticle) {
        this.idArticle = idArticle;
    }

    public int getIdcategorie() {
        return idcategorie;
    }

    public void setIdcategorie(int idcategorie) {
        this.idcategorie = idcategorie;
    }

    public int getIdSousCategorie() {
        return idSousCategorie;
    }

    public void setIdSousCategorie(int idSousCategorie) {
        this.idSousCategorie = idSousCategorie;
    }

    public String getNomArticle() {
        return nomArticle;
    }

    public void setNomArticle(String nomArticle) {
        this.nomArticle = nomArticle;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getMarque() {
        return marque;
    }

    public void setMarque(String marque) {
        this.marque = marque;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }
	
    
}
