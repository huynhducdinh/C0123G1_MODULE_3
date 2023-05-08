package repository;

import model.User;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UserRepo implements IUserRepo {
    private final String SELECT_ALL = "SELECT * FROM quan_ly_user;";
    private final String INSERT_INTO = "INSERT INTO quan_ly_user (name,email,country) VALUES (?,?,?);";
    //    private final String UPDATE = "INSERT INTO quan_ly_user (namese,email,country) VALUES (?,?,?);";
    private static final String FIND_BY_COUNTRY = "SELECT * FROM quan_ly_user WHERE country like ?;";
    private static final String SORT_BY_NAME = "SELECT * FROM quan_ly_user ORDER BY namese;";
    private static final String SEARCH_USERS = "SELECT * FROM quan_ly_user AS u WHERE u.country=?;";
    private static final String GET_USERS = "CALL get_users();";
    private static final String UPDATE_USERS = "CALL update_user(?,?,?,?);";
    private static final String DELETE_USERS = "CALL delete_user(?);";


    @Override
    public List<User> getAll() {
        List<User> userList = new ArrayList<>();
        Connection connection = BaseRepo.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(GET_USERS);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                String email = resultSet.getString("email");
                String country = resultSet.getString("country");
                User user = new User(id, name, email, country);
                userList.add(user);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return userList;
    }


    @Override
    public boolean save(User user) {
        Connection connection = BaseRepo.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_INTO);
            preparedStatement.setString(1, user.getName());
            preparedStatement.setString(2, user.getEmail());
            preparedStatement.setString(3, user.getCountry());
            return preparedStatement.executeLargeUpdate() > 0;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public boolean update(int id ,User user) {
        Connection connection = BaseRepo.getConnectDB();
        try {
            CallableStatement callableStatement= connection.prepareCall(UPDATE_USERS);
            callableStatement.setString(2, user.getName());
            callableStatement.setString(3, user.getEmail());
            callableStatement.setString(4, user.getCountry());
            callableStatement.setInt(1, user.getId());
            return callableStatement.executeUpdate()>0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean delete(int id) {
        Connection connection=BaseRepo.getConnectDB();
        try {
            CallableStatement  callableStatement=connection.prepareCall(DELETE_USERS);
            callableStatement.setInt(1,id);
            return  callableStatement.executeUpdate()>0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public List<User> search(String country) {
        List<User> searchUsers = new ArrayList<>();
        Connection connection = BaseRepo.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SEARCH_USERS);
            preparedStatement.setString(1, country);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                String name = resultSet.getString("namese");
                String email = resultSet.getString("email");
                String userCountry = resultSet.getString("country");
                searchUsers.add(new User(name, email, userCountry));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return searchUsers;
    }

    @Override
    public List<User> sortByName() {
        List<User> userList = new ArrayList<>();
        Connection connection = BaseRepo.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SORT_BY_NAME);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String name = resultSet.getString("namese");
                String email = resultSet.getString("email");
                String country = resultSet.getString("country");
                User user = new User(id, name, email, country);
                userList.add(user);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return userList;
    }

}
