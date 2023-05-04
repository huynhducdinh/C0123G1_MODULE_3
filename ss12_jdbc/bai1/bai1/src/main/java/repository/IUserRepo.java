package repository;

import model.User;

import java.util.List;

public interface IUserRepo {
    List<User> getAll();

    boolean save(User user);

    void update(int id, User user);

    List<User> search(String countrySearch);

    List<User> sortByName();
}
