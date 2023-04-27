
import model.Calculator;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;


@WebServlet(name = "calculatorServlet", value = "/calculator")
public class CalculatorServlet extends HttpServlet {
@Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    float firstOperand = Float.parseFloat(request.getParameter("firstOperand"));
    float secondOperand = Float.parseFloat(request.getParameter("secondOperand"));
    String operator = request.getParameter("operator");

    try {
        float result = Calculator.calculator(firstOperand, secondOperand, operator);
        request.setAttribute("result", result);
    } catch (Exception ex) {
        String message = ex.getMessage();
        request.setAttribute("result", message);
        request.getRequestDispatcher("/result.jsp").forward(request, response);
    }
    request.getRequestDispatcher("/result.jsp").forward(request, response);
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        }
    }
