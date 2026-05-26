import java.util.Random;
import java.util.Scanner;

// click the <icon src="AllIcons.Actions.Execute"/> icon in the gutter.
public class Main {
     static void main(String[] args) {
         Scanner sc = new Scanner(System.in);
         Random rd = new Random();

         System.out.print("Nhập n: ");
         int n = sc.nextInt();

         String chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
         StringBuilder sb = new StringBuilder();

         for (int i = 0; i < n; i++) {
             int index = rd.nextInt(chars.length());
             sb.append(chars.charAt(index));
         }

         System.out.println("Mã giả ngẫu nhiên: " + sb.toString());
     }
}
