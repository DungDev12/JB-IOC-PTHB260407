import java.util.Scanner;

// click the <icon src="AllIcons.Actions.Execute"/> icon in the gutter.
public class Main {
    public static Scanner scanner = new Scanner(System.in);
    static void main() {
        int a,b,c,d;

        while (true){
            System.out.print("Nhập tử số 1 (a): ");
            a = scanner.nextInt();
            System.out.print("Nhập mẫu số 1 (b): ");
            b = scanner.nextInt();
            System.out.print("Nhập tử số 2 (c): ");
            c = scanner.nextInt();
            System.out.print("Nhập mẫu số 2 (d): ");
            d = scanner.nextInt();

            int tuSo;
            int mauSo;

            if(b == d){
                mauSo = b;
                tuSo = ((a*d)+(b*c)) / b;
            } else {
                tuSo = (a*d)+(b*c);
                mauSo = b*d;
            }

            System.out.println("\n --- Kết quả ---");
            System.out.println(tuSo+"/"+mauSo);
        }

    }
}