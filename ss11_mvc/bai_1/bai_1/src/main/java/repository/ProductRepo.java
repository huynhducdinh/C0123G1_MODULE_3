package repository;

import model.Product;
import repository.impl.IProductRepo;

import java.util.ArrayList;
import java.util.List;

public class ProductRepo implements IProductRepo {
    private static List<Product> productList = new ArrayList<>();

    static {
        productList.add(new Product(1, "samsung s23", 12, "Pink", "SamSung"));
        productList.add(new Product(2, "iphone 11 pro max", 12, "Red", "Iphone"));
        productList.add(new Product(3, "redmi note 11", 12, "Green", "Redmi"));
        productList.add(new Product(4, "xiaomi 11t pro", 12, "Blue", "Xiaomi"));
    }

    @Override
    public List<Product> getAll() {
        return productList;
    }

    @Override
    public void saveProduct(Product product) {
        productList.add(product);
    }

    @Override
    public void deleteProduct(int id) {
        for (int i = 0; i <= productList.size(); i++) {
            if (id == productList.get(i).getId()) {
                productList.remove(i);
                break;
            }
        }
    }

    @Override
    public void updateProduct(int id,Product product) {
        for (int i = 0; i <= productList.size(); i++) {
            if (id == productList.get(i).getId()) {
                productList.set(i,product);
                break;
            }
        }
    }
    public Product findById(int id) {
        return productList.get(id);
    }
}
