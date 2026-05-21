import java.util.Scanner;

// click the <icon src="AllIcons.Actions.Execute"/> icon in the gutter.
public class Main {
    public static Scanner sc = new Scanner(System.in);

    static void main() {
        System.out.print("Nhập số lượng phần tử: ");
        int n = sc.nextInt();

        int[] arr = new int[n];

        for (int i = 0; i < n; i++) {
            System.out.print("Nhập phần tử thứ " + (i + 1) + ": ");
            arr[i] = sc.nextInt();
        }

        for (int i = 0; i < n - 1; i++) {
            int maxIndex = i;
            for (int j = i + 1; j < n; j++) {
                if (arr[j] > arr[maxIndex]) {
                    maxIndex = j;
                }
            }

            int temp = arr[i];
            arr[i] = arr[maxIndex];
            arr[maxIndex] = temp;
        }

        System.out.println("\nMảng sau khi sắp xếp giảm dần:");

        for (int i = 0; i < n; i++) {
            System.out.print(arr[i] + " ");
        }

        System.out.print("\n\nNhập số cần tìm: ");
        int x = sc.nextInt();

        int linearResult = -1;

        for (int i = 0; i < n; i++) {

            if (arr[i] == x) {
                linearResult = i;
                break;
            }
        }

        int binaryResult = -1;

        int left = 0;
        int right = n - 1;

        while (left <= right) {

            int mid = (left + right) / 2;

            if (arr[mid] == x) {
                binaryResult = mid;
                break;
            }

            if (arr[mid] < x) {
                right = mid - 1;
            } else {
                left = mid + 1;
            }
        }

        if (linearResult != -1) {
            System.out.println("Tìm kiếm tuyến tính: Tìm thấy tại vị trí " + linearResult);
        } else {
            System.out.println("Tìm kiếm tuyến tính: Không tìm thấy");
        }

        if (binaryResult != -1) {
            System.out.println("Tìm kiếm nhị phân: Tìm thấy tại vị trí " + binaryResult);
        } else {
            System.out.println("Tìm kiếm nhị phân: Không tìm thấy");
        }

        sc.close();

    }
}
