import java.util.Scanner;

// click the <icon src="AllIcons.Actions.Execute"/> icon in the gutter.
public class Main {
    public static void displayMenu(){
        System.out.println("\n************* QUẢN LÝ NGƯỜI DÙNG *************");
        System.out.println("1. Nhập thông tin người dùng");
        System.out.println("2. Chuẩn hóa họ tên");
        System.out.println("3. Kiểm tra email hợp lệ");
        System.out.println("4. Kiểm tra số điện thoại hợp lệ");
        System.out.println("5. Kiểm tra mật khẩu hợp lệ");
        System.out.println("6. Thoát");
        System.out.print("Lựa chọn của bạn: ");
    }

     static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        String hoTen = "", email = "", sdt = "", matKhau = "";
        int chose = 0;

        do {
            displayMenu();
            chose = Integer.parseInt(sc.next());
            switch (chose){
                case 1:
                    System.out.print("Nhập họ tên: ");
                    hoTen = sc.nextLine();

                    System.out.print("Nhập email: ");
                    email = sc.nextLine();

                    System.out.print("Nhập số điện thoại: ");
                    sdt = sc.nextLine();

                    System.out.print("Nhập mật khẩu: ");
                    matKhau = sc.nextLine();
                    break;
                case 2:
                    hoTen = hoTen.replaceAll("\\s+", " ");
                    String[] words = hoTen.split(" ");
                    StringBuilder sb = new StringBuilder();
                    String result = "";
                    for (int i = 0; i < words.length; i++) {
                        String word = words[i];

                        String first = word.substring(0, 1).toUpperCase();
                        String last = word.substring(1).toLowerCase();

                        result += first + last + " ";
                    }

                    hoTen = result.trim();

                    System.out.println("Họ tên sau chuẩn hóa: " + hoTen);
                    break;
                case 3:
                    String regexEmail = "^[a-zA-Z0-9._]+@[a-zA-Z0-9.]+\\.[a-zA-Z]{2,6}$";

                    if (email.matches(regexEmail)) {
                        System.out.println("Email hợp lệ");
                    } else {
                        System.out.println("Email không hợp lệ");
                    }
                    break;
                case 4:
                    String regexSDT = "^0\\d{9}$";

                    if (sdt.matches(regexSDT)) {
                        System.out.println("Số điện thoại hợp lệ");
                    } else {
                        System.out.println("Số điện thoại không hợp lệ");
                    }
                    break;
                case 5:
                    String regexPass = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[@#$!%]).{8,}$";

                    if (matKhau.matches(regexPass)) {
                        System.out.println("Mật khẩu hợp lệ");
                    } else {
                        System.out.println("Mật khẩu không hợp lệ");
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
