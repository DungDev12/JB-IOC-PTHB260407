import java.util.Scanner;

// click the <icon src="AllIcons.Actions.Execute"/> icon in the gutter.
public class Main {
     static void main(String[] args) {
         Scanner sc = new Scanner(System.in);

       while (true){
           System.out.print("Nhập mật khẩu: ");
           String password = sc.nextLine();

           String regex = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[@#$!%]).{8,}$";

           if (password.matches(regex)) {
               System.out.println("Mật khẩu hợp lệ");
           } else {
               System.out.println("Mật khẩu không hợp lệ");
           }
       }
    }
}