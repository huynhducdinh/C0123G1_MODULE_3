package service;

import model.User;
import repository.IUserRepo;
import repository.UserRepo;
import java.util.List;

public class UserService implements IUserService {
    IUserRepo iUserRepo = new UserRepo();

    @Override
    public List<User> getAll() {
        List<User> userList=iUserRepo.getAll();
        if (userList.size()==0){
            System.out.println("Không có dữ liệu");
            return null;
        }
        return userList;
    }

    @Override
    public void saveUser(User user) {
        iUserRepo.save(user);
    }

    @Override
    public boolean update(int id, User user) {
        return iUserRepo.update(id,user);
    }
    @Override
    public boolean delete(int id) {
        return iUserRepo.delete(id);
    }
    public List<User> search(String country) {
        return iUserRepo.search(country);
    }
    public List<User> sortByName() {
        return iUserRepo.sortByName();
    }
}
