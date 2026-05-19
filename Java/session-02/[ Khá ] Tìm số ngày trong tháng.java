import java.util.Scanner;

// click the <icon src="AllIcons.Actions.Execute"/> icon in the gutter.
public class Main {
    public static Scanner sc = new Scanner(System.in);

    private static String findTitleMonth(int n){
        switch (n){
            case 1:
                return "Tháng 1";
            case 2:
                return "Tháng 2";
            case 3:
                return "Tháng 3";
            case 4:
                return "Tháng 4";
            case 5:
                return "Tháng 5";
            case 6:
                return "Tháng 6";
            case 7:
                return "Tháng 7";
            case 8:
                return "Tháng 8";
            case 9:
                return "Tháng 9";
            case 10:
                return "Tháng 10";
            case 11:
                return "Tháng 11";
            case 12:
                return "Tháng 12";
            default: return "Tháng không hợp lệ";
        }
    }

    static void main() {
        while (true){
            int n=0;
            String day= "";

            do {
                System.out.print("Vui lòng nhập Tháng từ 1 đến 12: ");
                n = Integer.parseInt(sc.next());
                if(n<=0 || n>12){
                    System.out.println("Tháng không hợp lệ.!! Vui lòng nhập lại");
                }
            } while (n<=0);

            switch (n){
                case 1,3,5,7,8,10,12:
                    day= "31";
                    break;
                case 4,6,9,11:
                    day ="30";
                    break;
                case 2:
                    day ="28 hoặc 29";
                    break;
            }
            System.out.println(findTitleMonth(n)+" có "+ day +" ngày.");

        }
    }


}