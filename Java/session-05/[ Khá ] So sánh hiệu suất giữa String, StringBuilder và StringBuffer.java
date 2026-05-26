public class Main {
     static void main(String[] args) {

        // String
        long start = System.currentTimeMillis();
        String str = "Hello";
        for (int i = 0; i < 100000; i++) {
            str += " World";
        }
        long end = System.currentTimeMillis();
        System.out.println("Thời gian thực hiện String: " + (end - start) + " ms");

        // StringBuilder
        start = System.currentTimeMillis();
        StringBuilder sb = new StringBuilder("Hello");
        for (int i = 0; i < 100000; i++) {
            sb.append(" World");
        }
        end = System.currentTimeMillis();
        System.out.println("Thời gian thực hiện StringBuilder: " + (end - start) + " ms");

        // StringBuffer
        start = System.currentTimeMillis();
        StringBuffer sf = new StringBuffer("Hello");
        for (int i = 0; i < 100000; i++) {
            sf.append(" World");
        }
        end = System.currentTimeMillis();
        System.out.println("Thời gian thực hiện StringBuffer: " + (end - start) + " ms");

        // Nhận xét
        System.out.println("\nNhận xét:");
        System.out.println("- String chậm nhất vì mỗi lần nối tạo đối tượng mới.");
        System.out.println("- StringBuilder nhanh nhất, dùng cho 1 luồng.");
        System.out.println("- StringBuffer chậm hơn StringBuilder vì có đồng bộ hóa, dùng cho đa luồng.");
    }
}