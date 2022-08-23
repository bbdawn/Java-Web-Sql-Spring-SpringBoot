package test.enumdemo;
public class Shoes {
    public int size;
    public Type type;
    public enum Type {
        WALKING, RUNNING, TRACKING
    }
	public Shoes(int size,Type type) {
		super();
		this.size = size;
		this.type=type;
	}
	@Override
	public String toString() {
		return "Shoes [size=" + size + ", type=" + type + "]";
	}
	
    
}
