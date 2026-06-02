package org.example;

public class Main {
    static void main(String[] args) {

        CurrencyConverter.setRate(26000);

        int vnd = 1000000;

        double usd = CurrencyConverter.toUSD(vnd);

        System.out.println("Tỉ giá: " + CurrencyConverter.getRate());
        System.out.println("VND: " + vnd);
        System.out.println("USD: " + CurrencyConverter.formatUSD(usd));
    }
}
