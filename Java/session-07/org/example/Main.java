package org.example;//TIP To <b>Run</b> code, press <shortcut actionId="Run"/> or

import java.util.Arrays;
import java.util.Scanner;

// click the <icon src="AllIcons.Actions.Execute"/> icon in the gutter.
public class Main {
    public static void displayMenu(){
        System.out.println("\n************* QUẢN LÝ BIỂN SỐ XE *************");
        System.out.println("1. Thêm các biển số xe");
        System.out.println("2. Hiển thị danh sách biển số xe");
        System.out.println("3. Tìm kiếm biển số xe");
        System.out.println("4. Tìm biển số xe theo mã tỉnh");
        System.out.println("5. Sắp xếp biển số xe tăng dần");
        System.out.println("6. Thoát");
        System.out.print("Lựa chọn của bạn: ");
    }

     static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        String[] bienSo = new String[100];
        int chose = 0;
        int n = 0;

        do {
            displayMenu();
            chose = Integer.parseInt(sc.next());
            switch (chose){
                case 1:
                    System.out.print("Nhập số lượng biển số xe: ");
                    n = sc.nextInt();
                    sc.nextLine();

                    for (int i = 0; i < n; i++) {
                        System.out.print("Nhập biển số xe " + (i + 1) + ": ");
                        String input = sc.nextLine();

                        // Regex kiểm tra biển số xe
                        if (input.matches("\\d{2}[A-Z]-\\d{3}\\.\\d{2}")) {
                            bienSo[i] = input;
                        } else {
                            System.out.println("Biển số không hợp lệ!");
                            i--;
                        }
                    }
                    break;

                case 2:
                    System.out.println("Danh sách biển số xe:");
                    for (int i = 0; i < n; i++) {
                        System.out.println(bienSo[i]);
                    }
                    break;

                case 3:
                    System.out.print("Nhập biển số cần tìm: ");
                    String search = sc.nextLine();
                    boolean found = false;

                    for (int i = 0; i < n; i++) {
                        if (bienSo[i].equals(search)) {
                            System.out.println("Tìm thấy: " + bienSo[i]);
                            found = true;
                            break;
                        }
                    }

                    if (!found) {
                        System.out.println("Không tìm thấy!");
                    }
                    break;

                case 4:
                    System.out.print("Nhập mã tỉnh (VD: 29, 30, 51...): ");
                    String maTinh = sc.nextLine();
                    boolean check = false;

                    for (int i = 0; i < n; i++) {
                        if (bienSo[i].startsWith(maTinh)) {
                            System.out.println(bienSo[i]);
                            check = true;
                        }
                    }

                    if (!check) {
                        System.out.println("Không có biển số nào!");
                    }
                    break;
                case 6:
                    System.out.println("Thoát chương trình.");
                    break;
                default:
                    System.out.println("Lựa chọn không hợp lệ!");
            }
        }while (chose != 6);
     }
}
