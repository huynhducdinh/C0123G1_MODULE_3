import java.util.Scanner;

public class GiaiThuat {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.println("Nhập 1 số chẵn vào");
        int size = sc.nextInt();
        for (int i = 0; i < size / 2; i++) {
            for (int j = 0; j < i; j++) {
                System.out.print(" ");
            }
            for (int j = 0; j < size - 2 * i; j++) {
                System.out.print("*");
            }
            System.out.println();
        }
        for (int i = size / 2 - 1; i >= 0; i--) {
            for (int j = 0; j < i; j++) {
                System.out.print(" ");
            }
            for (int j = 0; j < size - 2 * i; j++) {
                System.out.print("*");
            }
            System.out.println();
        }
    }
}