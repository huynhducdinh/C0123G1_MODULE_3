package repository;

import model.User;

import java.util.List;

public interface IUserRepo {
    List<User> getAll();

    boolean save(User user);

    boolean update(int id, User user);
    boolean delete(int id);

    List<User> search(String countrySearch);

    List<User> sortByName();
}
