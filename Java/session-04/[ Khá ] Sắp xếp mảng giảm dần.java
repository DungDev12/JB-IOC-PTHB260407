import java.util.Scanner;

// click the <icon src="AllIcons.Actions.Execute"/> icon in the gutter.
public class Main {
    public static Scanner sc = new Scanner(System.in);

    static void main() {
        System.out.print("Nhập số lượng phần từ của mảng: ");
        int n = Integer.parseInt(sc.next());
        int[] arrNumber = new int[n];

        for (int i = 0; i < n; i++) {
            System.out.print("Nhập phần tử thứ " + (i + 1) + ": ");
            arrNumber[i] = sc.nextInt();
        }

        for (int i = 0; i < n - 1; i++) {
            for (int j = 0; j < n - i - 1; j++) {
                if (arrNumber[j] < arrNumber[j + 1]) {
                    int temp = arrNumber[j];
                    arrNumber[j] = arrNumber[j + 1];
                    arrNumber[j + 1] = temp;
                }
            }
        }
        System.out.println("Mảng sau khi sắp xếp giảm dần:");

        for (int i = 0; i < n; i++) {
            System.out.print(arrNumber[i] + " ");
        }

        sc.close();
    }
}