package controller;

import model.User;
import service.IUserService;
import service.UserService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "UserServlet", value = "/user")
public class UserServlet extends HttpServlet {
    private static IUserService iUserService = new UserService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create": {
                request.getRequestDispatcher("/create.jsp").forward(request, response);
                break;
            }
            case "update":{
                goUpdate(request, response);
                break;
            }
            case "delete": {
                deleteUser(request, response);
                break;
            }
            default: {
                showList(request, response);
                break;
            }
        }
    }

    public void deleteUser(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        iUserService.delete(id);
        try {
            response.sendRedirect("/user");
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private static void goUpdate(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        List<User>userList=iUserService.getAll();
        for (int i=0;i<userList.size();i++){
            if (id==userList.get(i).getId()){
                request.setAttribute("id",userList.get(i).getId());
                request.setAttribute("name",userList.get(i).getName());
                request.setAttribute("email",userList.get(i).getEmail());
                request.setAttribute("country",userList.get(i).getCountry());
                request.getRequestDispatcher("/update.jsp").forward(request,response);
            }
        }
    }

    private static void showList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<User> userList = iUserService.getAll();
        if (userList == null) {
            request.getRequestDispatcher("/error.jsp").forward(request, response);
        } else {
            request.setAttribute("userList", userList);
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
            case "create": {
                createUser(request, response);
                break;
            }
            case "update": {
                updateUser(request, response);
                break;
            }
            case "sort": {
                sortUser(request, response);
                break;
            }
            case "search": {
                searchUser(request, response);
                break;
            }
        }
    }

    private static void searchUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String country = request.getParameter("country");
        List<User> userList = iUserService.search(country);
        request.setAttribute("userList", userList);
        request.getRequestDispatcher("/list.jsp").forward(request, response);
    }

    private static void sortUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<User> userList = iUserService.sortByName();
        request.setAttribute("userList", userList);
        request.getRequestDispatcher("/list.jsp").forward(request, response);
    }

    private static void updateUser(HttpServletRequest request, HttpServletResponse response) throws IOException {
        Integer id= Integer.valueOf(request.getParameter("id"));
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String country = request.getParameter("country");
        User user = new User(id,name, email, country);
        iUserService.update(id ,user);
        response.sendRedirect("/user");
    }

    private static void createUser(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String country = request.getParameter("country");
        User user = new User(name, email, country);
        iUserService.saveUser(user);
        response.sendRedirect("/user");

    }
}
