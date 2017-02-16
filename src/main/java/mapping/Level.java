package mapping;

public class Level {
	private int idLevel;
	private int level;
	
	public int getIdLevel() {
		return idLevel;
	}
	public void setIdLevel(int idLevel) {
		this.idLevel = idLevel;
	}
	public int getLevel() {
		return level;
	}
	public void setLevel(int level) {
		this.level = level;
	}
	
	public Level(int id,int lev){
		idLevel=id;
		level=lev;
	}
}
