import java.util.Scanner;

// click the <icon src="AllIcons.Actions.Execute"/> icon in the gutter.
public class Main {
    public static Scanner scanner = new Scanner(System.in);
    static void main() {
        System.out.print("Vui lòng nhập bán kính (cm): ");
        int r = scanner.nextInt();

        double A = 3.14 * r;
        System.out.printf("Diện tích bán kính là: %.2f cm", A);
    }
}