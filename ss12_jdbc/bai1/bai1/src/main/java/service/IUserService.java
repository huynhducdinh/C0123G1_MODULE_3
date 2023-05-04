package service;

import model.User;

import java.util.List;

public interface IUserService {
    List<User> getAll();

    void saveUser(User user);

    void update(int id, User user);

    List<User> search(String country);

    List<User> sortByName();
}
