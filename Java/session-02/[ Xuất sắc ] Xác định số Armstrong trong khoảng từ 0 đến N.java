import java.util.Scanner;

// click the <icon src="AllIcons.Actions.Execute"/> icon in the gutter.
public class Main {
    public static Scanner sc = new Scanner(System.in);

    public static boolean isArmstrong(int num) {
        int originalNum = num;
        int sum = 0;

        int digits = String.valueOf(num).length();

        while (num > 0) {
            int digit = num % 10;
            sum += Math.pow(digit, digits);
            num /= 10;
        }

        return sum == originalNum;
    }
    static void main() {
        while(true){
            int n = 0;
            do {
                System.out.print("Nhập số nguyên dương: ");
                n = Integer.parseInt(sc.next());
                if(n >= 0 ){
                     break;
                }
                System.out.println("Số nhập vào không hợp lệ!! Vui lòng nhập lại!");
            } while (n <= 0);

            String numberToString = String.valueOf(n);
            int sum = 0;
            String printSystem = "";
            for (int i = 0; i <= n; i++){
                if(isArmstrong(i)){
                    printSystem += i + " ";
                }
            }

            System.out.println(printSystem);
        }
    }
}