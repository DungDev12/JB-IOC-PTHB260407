import java.util.Scanner;

// click the <icon src="AllIcons.Actions.Execute"/> icon in the gutter.
public class Main {
    public static Scanner sc = new Scanner(System.in);

    public static int viewMenu(){
        System.out.println("===== MENU =====");
        System.out.println("1. Nhập lương nhân viên");
        System.out.println("2. Hiển thị thống kê");
        System.out.println("3. Tính tổng tiền thưởng nhân viên");
        System.out.println("4. Thoát");
        System.out.print("Lựa chọn của bạn: ");
        return Integer.parseInt(sc.next());
    }

    public static void funcOne(){
        while (true){
            double salary = 0;
            System.out.println("--- Nhập lương nhân viên ( nhập -1 để kết thúc ) ---");
            System.out.print("Nhập lương: ");
            salary = Double.parseDouble(sc.next());

            if(salary < 0 || salary > 500000000){
                System.out.println("Lương không hợp lệ. Nhập lại");
            } else {
                String title= "";
                 if (salary > 50000000){
                    title = "Cao";
                }else if (salary > 15000000 && salary <= 50000000){
                    title = "Khá";
                }else if (salary > 5000000 && salary <= 15000000){
                    title = "Trung bình";
                }else {
                    title = "Thấp";
                }
                 System.out.println("Thu nhập " + title);
            }
        }
    }

    public static void funcTwo(){

    }

    public static void funcThree(){
        
    }


    static void main() {
        while (true){
            int chose = viewMenu();
            switch (chose){
                case 1:
                    funcOne();
                    return;
                case 2:
                    funcTwo();
                    break;
                case 3:
                    funcThree();
                    break;
                case 4:
                    System.out.println("Đã thoát chương trình");
                    return;
                default:
                    System.out.println("Lựa chọn không hợp lệ vui lòng chọn lai!!!");
            }
        }
    }
}
