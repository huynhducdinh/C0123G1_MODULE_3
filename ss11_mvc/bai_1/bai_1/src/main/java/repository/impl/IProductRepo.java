package repository.impl;

import model.Product;

import java.util.List;

public interface IProductRepo {
    List<Product> getAll();
    void saveProduct(Product product);
}
