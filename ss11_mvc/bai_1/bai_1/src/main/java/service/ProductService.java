package service;

import model.Product;
import repository.ProductRepo;
import repository.impl.IProductRepo;
import service.impl.IProductService;

import java.util.List;

public class ProductService implements IProductService {
    private IProductRepo iProductRepo = new ProductRepo();

    public List<Product> getAll() {
        List<Product> productList = iProductRepo.getAll();
        if (productList.size() == 0) {
            System.out.println("Không có dữ liệu");
            return null;
        }
        return productList;
    }

    public void saveProduct(Product product) {
        iProductRepo.saveProduct(product);
    }

    @Override
    public void deleteProduct(int id) {
        iProductRepo.deleteProduct(id);
    }

    @Override
    public void updateProduct(int id, Product product) {
        iProductRepo.updateProduct(id,product);

    }
     public Product findById(int id){
        return iProductRepo.findById(id);
     }
}
