package repository;

import model.Product;
import repository.impl.IProductRepo;

import java.util.ArrayList;
import java.util.List;

public class ProductRepo implements IProductRepo {
    private static List<Product> productList = new ArrayList<>();

    static {
        productList.add(new Product(1, "samsung s23", 12, "Tốt", "SamSung"));
        productList.add(new Product(2, "iphone 11 pro max", 12, "Tốt", "Iphone"));
        productList.add(new Product(3, "redmi note 11", 12, "Tốt", "Redmi"));
        productList.add(new Product(4, "xiaomi 11t pro", 12, "Tốt", "Xiaomi"));
    }

    @Override
    public List<Product> getAll() {
        return productList;
    }

    @Override
    public void saveProduct(Product product) {
        productList.add(product);
    }
}
