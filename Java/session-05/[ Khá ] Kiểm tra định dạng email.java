import java.util.Scanner;

// click the <icon src="AllIcons.Actions.Execute"/> icon in the gutter.
public class Main {

     static void main(String[] args) {

         while(true){
             Scanner sc = new Scanner(System.in);

             System.out.print("Nhập email: ");
             String email = sc.nextLine().trim();

             String regex = "^[a-zA-Z0-9._]+@[a-zA-Z0-9.]+\\.[a-zA-Z]{2,6}$";

             if (email.matches(regex)) {
                 System.out.println("Email hợp lệ");
             } else {
                 System.out.println("Email không hợp lệ");
             }
         }
    }
}