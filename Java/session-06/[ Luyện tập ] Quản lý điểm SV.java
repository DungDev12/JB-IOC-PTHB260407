import java.util.Arrays;
import java.util.Scanner;

// click the <icon src="AllIcons.Actions.Execute"/> icon in the gutter.
public class Main {
    public static void displayMenu(){
        System.out.println("\n************* QUẢN LÝ ĐIỂM SV *************");
        System.out.println("1. Nhập danh sách điểm sinh viên");
        System.out.println("2. In danh sách điểm");
        System.out.println("3. Tính điểm trung bình");
        System.out.println("4. Tìm điểm cao nhất và thấp nhất");
        System.out.println("5. Đếm số lượng sinh viên đậu và trượt");
        System.out.println("6. Sắp xếp điểm tăng dần");
        System.out.println("7. Thống kê số lượng sinh viên giỏi và xuất sắc");
        System.out.println("8. Thoát");
        System.out.print("Lựa chọn của bạn: ");
    }

    public static int insertStudent(double[] diem){
        Scanner sc = new Scanner(System.in);
        int n = 0;
        System.out.println("Nhập số lượng sinh viên: ");
        n = Integer.parseInt(sc.next());
        for (int i = 0; i < n; i++) {
            double inputDiem = 0;
            do{
                System.out.print("Nhập điểm sinh viên " + (i + 1) + ": ");
                inputDiem = sc.nextDouble();
                if(inputDiem >= 0 && inputDiem <= 10){
                    diem[i] = inputDiem;
                } else {
                    System.out.println("Điểm không hợp lệ!");
                }
            }while (inputDiem < 0 || inputDiem > 10);
        }
        return n;
    }

    public static void tinhDiemTrungBinh(int n ,double[] diem){
        double tong = 0;
        for (int i = 0; i < n; i++) {
            tong += diem[i];
        }
        System.out.println("Điểm trung bình: " + (tong / n));
    }

     static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        double[] diem = new double[100];
        int chose = 0;
        int n = 0;

        do {
            displayMenu();
            chose = Integer.parseInt(sc.next());
            switch (chose){
                case 1:
                    n = insertStudent(diem);
                    break;
                case 2:
                    System.out.println("Danh sách điểm:");
                    for (int i = 0; i < n; i++) {
                        System.out.println("SV " + (i + 1) + ": " + diem[i]);
                    }
                    break;
                case 3:
                    tinhDiemTrungBinh(n,diem);
                    break;
                case 4:
                    double max = diem[0], min = diem[0];
                    for (int i = 1; i < n; i++) {
                        if (diem[i] > max) max = diem[i];
                        if (diem[i] < min) min = diem[i];
                    }
                    System.out.println("Điểm cao nhất: " + max);
                    System.out.println("Điểm thấp nhất: " + min);
                    break;
                case 5:
                    int dau = 0, truot = 0;
                    for (int i = 0; i < n; i++) {
                        if (diem[i] >= 5) dau++;
                        else truot++;
                    }
                    System.out.println("Số SV đậu: " + dau);
                    System.out.println("Số SV trượt: " + truot);
                    break;
                case 6:
                    Arrays.sort(diem, 0, n);
                    System.out.println("Đã sắp xếp điểm tăng dần.");
                    String printString = "";
                    for(int i = 0 ; i < n ; i++){
                        printString += diem[i] +" ";
                    }
                    System.out.println(printString);
                    break;
                case 7:
                    int gioi = 0, xuatSac = 0;
                    for (int i = 0; i < n; i++) {
                        if (diem[i] >= 8 && diem[i] < 9) gioi++;
                        if (diem[i] >= 9) xuatSac++;
                    }
                    System.out.println("Số SV giỏi: " + gioi);
                    System.out.println("Số SV xuất sắc: " + xuatSac);
                    break;
                case 8:
                    System.out.println("Thoát chương trình.");
                    break;
                default:
                    System.out.println("Lựa chọn không hợp lệ!");
            }
        }while (chose != 8);
     }
}