import java.util.Scanner;

// click the <icon src="AllIcons.Actions.Execute"/> icon in the gutter.
public class Main {

     static void main(String[] args) {

        Scanner sc = new Scanner(System.in);

        System.out.print("Nhập số phần tử của mảng: ");
        int n = sc.nextInt();

        if (n == 0) {
            System.out.println("Mảng không có phần tử");
            return;
        }

        int[] arr = new int[n];

        for (int i = 0; i < n; i++) {
            System.out.print("Nhập phần tử thứ " + (i + 1) + ": ");
            arr[i] = sc.nextInt();
        }

        int[] result = new int[n];
        int index = 0;

        for (int i = 0; i < n; i++) {
            if (arr[i] % 2 == 0) {
                result[index] = arr[i];
                index++;
            }
        }

        for (int i = 0; i < n; i++) {
            if (arr[i] % 2 != 0) {
                result[index] = arr[i];
                index++;
            }
        }

        System.out.println("Mảng sau khi sắp xếp:");
        for (int i = 0; i < n; i++) {
            System.out.print(result[i] + " ");
        }

        sc.close();
    }
}