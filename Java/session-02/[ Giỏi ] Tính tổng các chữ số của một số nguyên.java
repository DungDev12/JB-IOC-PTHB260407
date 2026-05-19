public class Main {
    public static Scanner sc = new Scanner(System.in);

    static void main() {
        while (true){
            int n = 0;
            System.out.print("Nhập sô nguyên dương N: ");
            n = Math.abs(Integer.parseInt(sc.next()));
            int sum = 0;
            while (n > 0) {
            sum += n % 10; // lấy chữ số cuối
            n /= 10;       // bỏ chữ số cuối
            }
            System.out.println("Tổng cá chữ số là: " + sum);
        }
    }
}
