package org.student;

import java.util.Scanner;

public class Student {
    private int id;
    private String name;
    private double gpa;

    public static int countStudent = 0;
    final double SCORE_FACTOR = 0.25;

    public Student(){
        id = countStudent++;
    }

    public Student(int id, String name, double gpa) {
        this.id = id;
        this.name = name;
        this.gpa = gpa;
    }

    public void input(){
        Scanner sc = new Scanner(System.in);

        IO.print("Nhập tên học viên: ");
        name = sc.nextLine();

        IO.print("Nhập GPA học viên: ");
        gpa = Double.parseDouble(sc.nextLine());
    }

    public void print(){
        System.out.printf("ID: %d | Tên: %s | GPA: %.2f\n", id, name, gpa );
    }

    public double getGpa() {
        return gpa;
    }

    public static int getTotalStudents(){
        return countStudent;
    }
}
