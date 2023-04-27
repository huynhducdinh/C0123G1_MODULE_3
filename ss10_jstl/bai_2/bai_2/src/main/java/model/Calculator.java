package model;

import servlet.CalculatorServlet;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "Calculator", value = "/calculator")
public class Calculator extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        float firstOperand = Float.parseFloat(request.getParameter("firstOperand"));
        float secondOperand = Float.parseFloat(request.getParameter("secondOperand"));
        String operator = request.getParameter("operator");
        try {
            float result = CalculatorServlet.calculator(firstOperand, secondOperand, operator);
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

