package repository;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class BaseRepo {
    private static String URL = "jdbc:mysql://localhost:3306/ung_dung_quan_ly_user";
    private static String User = "root";
    private static String Password = "@Dinh123";
    private static Connection connection;
    public static Connection getConnectDB(){
        if (connection==null){
            try {
                Class.forName("com.mysql.jdbc.Driver");
                connection = DriverManager.getConnection(URL, User, Password);
            } catch (ClassNotFoundException | SQLException e) {
                throw new RuntimeException(e);
            }
        }
        return connection;
    }
}
