package test.enumdemo;

public class TestEnum2 {
	public static void main(String[] args) {
		Day day=Day.SATURDAY;
		switch (day) {
		case FRIDAY:
			System.out.println("Enum test:"+day);
			break;
		case MONDAY:
			System.out.println("Enum test:"+day);
			break;
		case SATURDAY:
			//day enum 은 문자열로 db에 저장될 수 있음  
			//System.out.println("Enum test:"+day+" "+day.toString().equals("SATURDAY"));
			System.out.println("Enum test:"+day);
			break;
		case SUNDAY:
			System.out.println("Enum test:"+day);
			break;
		case THURSDAY:
			System.out.println("Enum test:"+day);
			break;
		case TUSEDAY:
			System.out.println("Enum test:"+day);
			break;
		case WEDNESDAY:
			System.out.println("Enum test:"+day);
			break;	
		}
	}
}
