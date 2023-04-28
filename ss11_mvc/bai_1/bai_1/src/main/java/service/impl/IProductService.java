package service.impl;

import model.Product;

import java.util.List;

public interface IProductService {
 List<Product> getAll();
 void saveProduct(Product product);
}
