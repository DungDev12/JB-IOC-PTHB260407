package org.example;

public class Main {
    static void main(String[] args) {
        Rectangle r1 = new Rectangle(3,4);
        Rectangle r2 = new Rectangle(5,2);
        Rectangle r3 = new Rectangle(4.5,3.5);

        IO.println("Rectangle 1: " + r1);
        IO.println("Rectangle 2: " + r2);
        IO.println("Rectangle 3: " + r3);

        Rectangle[] rectangles = {r1, r2, r3};

        int idx_max = 0;
        for (int i = 0; i < rectangles.length; i++) {
            if(rectangles[i].getArea() > rectangles[idx_max].getArea()){
                idx_max = i;
            }
        }
        IO.println("Largest area = " + rectangles[idx_max].getArea() + " (Rectangle "+ idx_max + ":" + " width="+ rectangles[idx_max].getWidth() + " height=" +rectangles[idx_max].getHeight());
    }
}
