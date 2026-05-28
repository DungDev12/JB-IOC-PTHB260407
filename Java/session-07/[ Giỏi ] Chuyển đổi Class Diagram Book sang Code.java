package org.example;

public class Book {
    public String title;
    public String author;
    public Double price;
    
    public void printInfo(){
        System.out.println("Title: " + title);
        System.out.println("Author: " + author);
        System.out.println("Price: " + price);
    }
}
