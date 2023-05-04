package repository;

import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBRepo {
    private static String jdbcURL = "jdbc:mysql://localhost:3306/ung_dung_quan_ly_user";
    private static String jdbcUsername = "root";
    private static String jdbcPassword = "@Dinh123";
    private static Connection connection;
    private static Connection getConnection(){
        if (connection==null){
            try {
                Class.forName("com.mysql.jdbc.Driver");
                connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
            } catch (ClassNotFoundException | SQLException e) {
                throw new RuntimeException(e);
            }
        }
        return connection;
    }
}
