package model;

public class Calculator {
    public static float calculator(float firstOperand, float secondOperand, String operator) throws ArithmeticException {
        switch (operator) {
            case "+":
                return firstOperand + secondOperand;
            case "-":
                return firstOperand - secondOperand;
            case "*":
                return firstOperand * secondOperand;
            case "/":
                if (secondOperand == 0) {
                    throw new ArithmeticException("Không thể chia cho 0");
                }
                return firstOperand / secondOperand;
            default:
                throw new RuntimeException("Sai định dạng.");
        }
    }
}