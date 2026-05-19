import java.util.Scanner;

// click the <icon src="AllIcons.Actions.Execute"/> icon in the gutter.
public class Main {
    public static Scanner sc = new Scanner(System.in);

    public static int viewMenu(){
        System.out.println("===== MENU =====");
        System.out.println("1. Nhập điểm học viên");
        System.out.println("2. Hiển thị thống kê");
        System.out.println("3. Thoát");
        System.out.print("Lựa chọn của bạn: ");
        return Integer.parseInt(sc.next());
    }

    public static void funcOne(){
        int point = 0;
        while (true){
            System.out.println("--- Nhập điểm học viên ( nhập -1 để dừng ) ---");
            System.out.print("Nhập điểm: ");
            point = Integer.parseInt(sc.next());
            if(point == -1) return;

            if(point < 0 || point > 10){
                System.out.println("Điểm không hợp lệ. Nhập lại.");
            } else {
                String title = "";
                if(point > 9) {
                    title = "Xuất sắc";
                }else if(point > 8 && point <= 9){
                    title = "Giỏi";
                }else if(point > 7 && point <= 8){
                    title = "Khá";
                }else if(point > 5 && point <= 7){
                    title = "Trung bình";
                }else {
                    title = "Yếu";
                }
                System.out.println("Học lực: " + title);
            }
        }
    }

    public static void funcTwo(){

    }

    static void main() {
        while (true){
            int chose = viewMenu();
            switch (chose){
                case 1:
                    funcOne();
                    break;
                case 2:
                    funcTwo();
                    break;
                case 3:
                    System.out.println("Đã thoát chương trình");
                    return;
                default:
                    System.out.println("Lựa chọn không hợp lệ vui lòng chọn lai!!!");
            }
        }
    }
}