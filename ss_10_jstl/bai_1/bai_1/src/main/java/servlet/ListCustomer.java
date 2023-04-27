package servlet;

import model.Customer;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "listCustomers ", value ="/customers")
public class ListCustomer extends HttpServlet {

    private static List<Customer> customerList = new ArrayList<>();
    static {
        customerList.add(new Customer("Mai Văn Hoàn", "1983-08-20", "Hà Nội","https://bold.vn/wp-content/uploads/2020/09/hoc-vien-nhiep-anh-bold-academy-03.jpg"));
        customerList.add(new Customer("Nguyễn Văn Nam", "1983-08-20", "Bắc Giang","https://danviet.mediacdn.vn/296231569849192448/2021/10/22/base64-16348533028301536198145.png"));
        customerList.add(new Customer("Nguyễn Thái Hoà", "1983-08-20", "Nam Định","https://bold.vn/wp-content/uploads/2020/09/hoc-vien-nhiep-anh-bold-academy-03.jpg"));
        customerList.add(new Customer("Trần Đăng Khoa", "1983-08-20", "Hà Nội","https://bold.vn/wp-content/uploads/2020/11/hoc-chup-anh-chan-dung.jpg"));
        customerList.add(new Customer("Nguyễn Đình Thi", "1983-08-20", "Hà Tây","https://image.vtc.vn/resize/th/upload/2020/06/22/nu-sinh-canh-sat-07264242.jpg"));
        customerList.add(new Customer("Mai Văn Hoàn", "1983-08-20", "Hà Nội","https://bold.vn/wp-content/uploads/2020/09/hoc-vien-nhiep-anh-bold-academy-03.jpg"));
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("customer", customerList);
            request.getRequestDispatcher("/list.jsp").forward(request,response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
