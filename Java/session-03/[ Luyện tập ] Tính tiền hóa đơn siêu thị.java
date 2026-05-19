import java.util.Scanner;

// click the <icon src="AllIcons.Actions.Execute"/> icon in the gutter.
public class Main {
    public static Scanner sc = new Scanner(System.in);

    static void main() {

        System.out.println("====== NHẬP THÔNG TIN HOÁ ĐƠN ======");
        System.out.print("Nhập tên khách hàng: ");
        String customerName = sc.nextLine();

        System.out.print("Nhập tên sản phẩm: ");
        String productName = sc.nextLine();

        System.out.print("Nhập giá sản phẩm: ");
        double priceProduct = Double.parseDouble(sc.nextLine());

        System.out.print("Nhập số lượng mua: ");
        int quantity = Integer.parseInt(sc.nextLine());

        System.out.print("Khách có thẻ thành viên? (true/false): ");
        boolean isMember = sc.nextBoolean();

        double amount = priceProduct * quantity;
        double discount = isMember ? amount * 0.1 : 0;
        double amountVAT = amount * 0.08;
        double total = amount - discount + amountVAT;

        System.out.println("============== HOÁ ĐƠN =============");
        System.out.println("Khách hàng : "+ customerName);
        System.out.println("Sản phẩm   : "+ productName);
        System.out.println("Số lượng   : "+ quantity);
        System.out.printf("Đơn giá    : %,.2f VND \n", priceProduct );
        System.out.printf("Thành tiền : %,.2f VND \n", amount );
        System.out.printf("Giảm giá thành viên (10%%): %,.2f VND \n", discount );
        System.out.printf("Tiền VAT (8%%): %,.2f VND \n", amountVAT );
        System.out.printf("Thổng thanh toán: %,.2f VND \n", total);
    }
}
