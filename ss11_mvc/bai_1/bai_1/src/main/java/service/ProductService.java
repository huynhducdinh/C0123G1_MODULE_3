package service;

import model.Product;
import repository.ProductRepo;
import repository.impl.IProductRepo;
import service.impl.IProductService;

import java.util.List;

public class ProductService implements IProductService {
    private IProductRepo iProductRepo = new ProductRepo();

    public List<Product> getAll() {
        List<Product> productList=iProductRepo.getAll();
        return productList;
    }

    public void saveProduct(Product product) {
        iProductRepo.saveProduct(product);
    }
}
