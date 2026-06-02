package org.example;

import org.student.Student;

import java.util.Scanner;

public class Main {
    public static void DisplayMenu(){
        IO.println("===== MENU SINH VIÊN =====");
        IO.println("1. Nhập danh sách sinh viên");
        IO.println("2. In danh sách sinh viên");
        IO.println("3. Tìm sinh viên GPA cao nhất");
        IO.println("4. In tổng số sinh viên đã tạo");
        IO.println("0. Thoát");
        IO.print("Lựa chọn của bạn: ");
    }

    static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        Student[] students = new Student[100];
        int count = 0;

        int chose = -1;
        do {
            DisplayMenu();
            chose = Integer.parseInt(sc.nextLine());
            switch (chose) {
                case 1:
                    Student s = new Student();
                    s.input();
                    students[count++] = s;
                    break;
                case 2:
                    for (int i = 0; i < count; i++) {
                        students[i].print();
                    }
                    break;
                case 3:
                    int max_idx = 0;
                    for (int i = 1; i < count; i++) {
                        if (students[i].getGpa() > students[max_idx].getGpa()) {
                            max_idx = i;
                        }
                    }

                    System.out.println("Sinh viên có GPA cao nhất:");
                    students[max_idx].print();
                    break;
                case 4:
                    IO.println("Tổng số sinh viên đã tạo là " + count);
                    break;
                case 0:
                    IO.println("Thoát chương trình");
                    return;
            }
        }while (true);
    }
}
