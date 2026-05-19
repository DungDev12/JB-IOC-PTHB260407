public class Main {
    public static Scanner sc = new Scanner(System.in);
    static void main() {
       while (true){
           int n = 0;
           do {
               System.out.print("Vui lòng nhập số nguyên dương N: ");
               n = sc.nextInt();

               if (n <= 0) {
                   System.out.println(" Số nhập vào không hợp lệ, vui lòng nhập lại!");
               }
           } while (n <= 0);

           int count = 0;
           for(int i = 0; i <= n; i++){
               count += i;
           }
           System.out.println("Tổng: "+ count);
       }
    }
}