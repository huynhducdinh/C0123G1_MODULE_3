package service;

import model.User;

import java.util.List;

public interface IUserService {
    List<User> getAll();

    void saveUser(User user);

    boolean update(int id, User user);
    boolean delete(int id);

    List<User> search(String country);

    List<User> sortByName();
}
