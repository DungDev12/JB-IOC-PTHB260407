import java.util.Scanner;

// click the <icon src="AllIcons.Actions.Execute"/> icon in the gutter.
public class Main {
    public static Scanner scanner = new Scanner(System.in);
    static void main() {
        float width ,height ;
        float area ,perimeter;

        while (true){
            System.out.print("Nhập chiều rộng (width) - cm: ");
            width = scanner.nextFloat();
            System.out.print("Nhập chiều cao (height) - cm: ");
            height = scanner.nextFloat();

            area  = width * height;
            perimeter = 2 * (width + height);

            System.out.println("\n --- Kết quả ---");
            System.out.printf("Diện tích hình chữ nhật là: %.2f \n", area );
            System.out.printf("Chu vi hình chữ nhật là: %.2f \n", perimeter );
        }

    }
}
