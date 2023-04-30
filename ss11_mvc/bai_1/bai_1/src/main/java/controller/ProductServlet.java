package controller;

import model.Product;
import service.ProductService;
import service.impl.IProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ProductServlet", value = "/product")
public class ProductServlet extends HttpServlet {
    private IProductService iProductService = new ProductService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                request.getRequestDispatcher("/create.jsp").forward(request, response);
                break;
            case "delete":
                int id = Integer.parseInt(request.getParameter("id"));
                iProductService.deleteProduct(id);
                response.sendRedirect("/product");
                break;
            case "update":
                List<Product> productList = iProductService.getAll();
                int idd = Integer.parseInt(request.getParameter("id"));
                for (int i = 0; i < productList.size(); i++) {
                    if (idd == productList.get(i).getId()) {
                        request.setAttribute("id", productList.get(i).getId());
                        request.setAttribute("name", productList.get(i).getName());
                        request.setAttribute("price", productList.get(i).getPrice());
                        request.setAttribute("description", productList.get(i).getDescribe());
                        request.setAttribute("producer", productList.get(i).getProducer());
                        request.getRequestDispatcher("/update.jsp").forward(request, response);
                    }
                }
                break;
            default:
                showList(request, response);
        }
    }

    private void showList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Product> productList = iProductService.getAll();
        if (productList == null) {
            request.getRequestDispatcher("/error.jsp").forward(request, response);
        } else {
            request.setAttribute("product", productList);
            request.getRequestDispatcher("/list.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                createProduct(request, response);
                break;
            case "update":
                updateProduct(request, response);
                break;
        }
    }


    private void createProduct(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        float price = Float.parseFloat(request.getParameter("price"));
        String describe = request.getParameter("describe");
        String producer = request.getParameter("producer");
        Product product = new Product(id, name, price, describe, producer);
        iProductService.saveProduct(product);
        response.sendRedirect("/product");
    }

    private void updateProduct(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        double price = Double.parseDouble(request.getParameter("price"));
        String describe = request.getParameter("describe");
        String producer = request.getParameter("producer");
        Product product = iProductService.findById(id);
        if (product == null) {
            request.getRequestDispatcher("/error_404.jsp");
        } else {
            product.setName(name);
            product.setPrice((float) price);
            product.setDescribe(describe);
            product.setProducer(producer);
            iProductService.updateProduct(id, product);
            request.setAttribute("product", product);
           request.getRequestDispatcher("/update.jsp");
        }
    }
}
