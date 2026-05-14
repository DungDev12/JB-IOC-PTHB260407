import java.util.Scanner;

// click the <icon src="AllIcons.Actions.Execute"/> icon in the gutter.
public class Main {
    public static Scanner scanner = new Scanner(System.in);
    static void main() {
        int firstNumber,secondNumber;

        System.out.print("Nhập số thứ nhất (firstNumber): ");
        firstNumber = scanner.nextInt();
        System.out.print("Nhập số thứ hai (secondNumber): ");
        secondNumber = scanner.nextInt();

        int tong = firstNumber + secondNumber;
        int hieu = firstNumber - secondNumber;
        int tich = firstNumber * secondNumber;
        int thuong = firstNumber / secondNumber;
        int phanDu = firstNumber % secondNumber;

        System.out.println("\n --- Kết quả ---");
        System.out.println("firstNumber = " + firstNumber);
        System.out.println("secondNumber = " + secondNumber);
        System.out.println("Tổng = " + tong);
        System.out.println("Hiệu = " + hieu);
        System.out.println("Tích = " + tich);
        System.out.println("Thương = " + thuong);
        System.out.println("Phần dư = " + phanDu);
    }
}
