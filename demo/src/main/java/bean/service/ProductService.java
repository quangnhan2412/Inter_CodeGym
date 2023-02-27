package bean.service;

import bean.model.Product;

import java.sql.SQLException;
import java.util.List;

public interface ProductService {
    public List<Product> selectAllProduct();
    Product getProductById(int id);
    List<Product> searchProductByName(String nameProduct);
    public boolean updateProduct(Product product) throws SQLException;

    public boolean deleteProduct(int id) throws SQLException;
    void addProduct(Product product);
}
