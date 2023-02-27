package bean.repository;

import bean.model.Product;
import bean.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ProductRepositoryImpl implements ProductRepository {


    private static final String SELECT_ALL_PRODUCT = "select * from product";
    private static final String DELETE_PRODUCT_BY_ID = "delete from product where product_stt = ?";
    private static final String UPDATE_PRODUCT_SQL = "update product set product_name= ?,  product_price =?,quantity=?,color_product =?,category =? where  product_stt = ?;";
    private static final String SELECT_PRODUCT_BY_ID = "select * from product where product_stt = ?";
    private static final String INSERT_PRODUCT_SQL = "INSERT INTO product" + "  (product_stt,product_name,product_price,quantity,color_product,category) VALUES " +
            " (?, ?, ?,?,?, ?)";

    @Override
    public List<Product> selectAllProduct() {
        List<Product> productList = new ArrayList<>();
        Connection connection = DBConnection.getConnection();
        ResultSet rs = null;
        PreparedStatement preparedStatement = null;
        if (connection != null) {
            try {
                preparedStatement = connection.prepareStatement(SELECT_ALL_PRODUCT);
                rs = preparedStatement.executeQuery();
                while (rs.next()) {
                    int productStt = rs.getInt("product_stt");
                    String productName = rs.getString("product_name");
                    double productPrice = rs.getDouble("product_price");
                    int productQuantity = rs.getInt("quantity");
                    String productColor = rs.getString("color_product");
                    String productCategory = rs.getString("category");

                    Product product = new Product(productStt, productName, productPrice, productQuantity, productColor, productCategory);
                    productList.add(product);
                }
            } catch (SQLException e) {
                throw new RuntimeException(e);
            } finally {
                try {
                    rs.close();
                    preparedStatement.close();
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
                DBConnection.close();
            }
        }
        return productList;
    }

    @Override
    public Product getProductById(int id) {
        Product product = null;
        Connection connection = DBConnection.getConnection();
        ResultSet rs = null;
        PreparedStatement preparedStatement = null;
        if (connection != null) {
            try {
                preparedStatement = connection.prepareStatement(SELECT_PRODUCT_BY_ID);
                preparedStatement.setInt(1, id);
                rs = preparedStatement.executeQuery();
                while (rs.next()) {
                    int productStt = rs.getInt("product_stt");
                    String productName = rs.getString("product_name");
                    double productPrice = rs.getDouble("product_price");
                    int productQuantity = rs.getInt("quantity");
                    String productColor = rs.getString("color_product");
                    String productCategory = rs.getString("category");

                     product = new Product(productStt, productName, productPrice, productQuantity, productColor, productCategory);
                }
            } catch (SQLException ex) {
                throw new RuntimeException(ex);
            } finally {
                try {
                    rs.close();
                    preparedStatement.close();
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
                DBConnection.close();
            }
        }
        return product;
    }

    @Override
    public List<Product> searchProductByName(String nameProduct) {
        List<Product> result = new ArrayList<>();
        Connection connection = DBConnection.getConnection();
        ResultSet rs = null;
        CallableStatement preparedStatement = null;
        if (connection != null) {
            try {
                preparedStatement = connection.prepareCall("{call search_product_by_name(?)}");
                preparedStatement.setString(1, nameProduct);
                rs = preparedStatement.executeQuery();
                while (rs.next()) {
                    int productStt = rs.getInt("product_stt");
                    String productName = rs.getString("product_name");
                    double productPrice = rs.getDouble("product_price");
                    int productQuantity = rs.getInt("quantity");
                    String productColor = rs.getString("color_product");
                    String productCategory = rs.getString("category");

                    Product product = new Product(productStt, productName, productPrice, productQuantity, productColor, productCategory);
                    result.add(product);
                }
            } catch (SQLException e) {
                throw new RuntimeException(e);
            } finally {
                try {
                    rs.close();
                    preparedStatement.close();
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
                DBConnection.close();
            }
        }
        return result;
    }

    @Override
    public boolean updateProduct(Product product) throws SQLException {
        boolean rowDelete = false;
        Connection connection = DBConnection.getConnection();
        PreparedStatement preparedStatement = null;
        if (connection != null) {
            try {
                preparedStatement = connection.prepareStatement(UPDATE_PRODUCT_SQL);
                preparedStatement.setString(1, product.getProductName());
                preparedStatement.setDouble(2, product.getProductPrice());
                preparedStatement.setInt(3, product.getProductQuantity());
                preparedStatement.setString(4, product.getProductColor());
                preparedStatement.setString(5, product.getProductCategory());
                preparedStatement.setInt(6, product.getProductId());

                rowDelete = preparedStatement.executeUpdate() > 0;
            } catch (SQLException ex) {
                throw new RuntimeException(ex);
            } finally {
                try {
                    preparedStatement.close();
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
                DBConnection.close();
            }
        }
        return rowDelete;
    }

    @Override
    public boolean deleteProduct(int id) throws SQLException {
        boolean rowDelete = false;
        Connection connection = DBConnection.getConnection();
        PreparedStatement preparedStatement = null;
        if (connection != null) {
            try {
                preparedStatement = connection.prepareStatement(DELETE_PRODUCT_BY_ID);
                preparedStatement.setInt(1, id);
                rowDelete = preparedStatement.executeUpdate() > 0;
            } catch (SQLException e) {
                throw new RuntimeException(e);
            } finally {
                try {
                    preparedStatement.close();
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
                DBConnection.close();
            }
        }
        return rowDelete;
    }

    @Override
    public void addProduct(Product product) {
        Connection connection = DBConnection.getConnection();
        PreparedStatement preparedStatement = null;
        if (connection != null) {
            try {
                preparedStatement = connection.prepareStatement(INSERT_PRODUCT_SQL);
                preparedStatement.setInt(1, product.getProductId());
                preparedStatement.setString(2, product.getProductName());
                preparedStatement.setDouble(3, product.getProductPrice());
                preparedStatement.setInt(4, product.getProductQuantity());
                preparedStatement.setString(5, product.getProductColor());
                preparedStatement.setString(6, product.getProductCategory());
                System.out.println(preparedStatement);
                preparedStatement.executeUpdate();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            } finally {
                try {
                    preparedStatement.close();
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
                DBConnection.close();
            }
        }
    }


}
