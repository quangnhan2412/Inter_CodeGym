package Controller;

import bean.model.Product;
import bean.service.ProductService;
import bean.service.ProductServiceImpl;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "ProductServlet", value = "/products")
public class ProductServlet extends HttpServlet {


    private ProductService productService = new ProductServiceImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                showNewFormProduct(request, response);
                break;
            case "delete":
                try {
                    showDeleteProduct(request, response);
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
                break;
            case "update":
                showUpdateFormProduct(request, response);
                break;
            default:
                listProduct(request, response);
                break;
        }
    }

    private void showUpdateFormProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Product existingProduct = productService.getProductById(id);
        RequestDispatcher dispatcher = request.getRequestDispatcher("product/update.jsp");
        request.setAttribute("existingProduct", existingProduct);
        dispatcher.forward(request, response);
    }

    private void showNewFormProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("product/create.jsp");
        dispatcher.forward(request, response);
    }

    private void showDeleteProduct(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        productService.deleteProduct(id);
        List<Product> productList = productService.selectAllProduct();
        request.setAttribute("productList", productList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("product/list.jsp");
        dispatcher.forward(request, response);
    }

    private void listProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String search = request.getParameter("search");
        List<Product> productList;
        if (search != null) {
            productList = productService.searchProductByName(search);
        } else {
            productList = productService.selectAllProduct();
        }
        request.setAttribute("productList", productList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("product/list.jsp");
        dispatcher.forward(request, response);
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
//        try {
        switch (action) {
            case "create":
                    createProduct(request, response);
                break;
            case "update":
                try {
                    updateProduct(request, response);
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
                break;
        }
//        } catch (SQLException e) {
//            throw new ServletException(e);
    }

    private void createProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String productName = request.getParameter("productName");
        double productPrice = Double.parseDouble(request.getParameter("productPrice"));
        int productQuantity = Integer.parseInt(request.getParameter("productQuantity"));
        String productColor = request.getParameter("productColor");
        String productCategory = request.getParameter("productCategory");

Product product = new Product(productName,productPrice,productQuantity,productColor,productCategory);
        productService.addProduct(product);
        RequestDispatcher dispatcher = request.getRequestDispatcher("product/create.jsp");
        dispatcher.forward(request, response);
    }


    private void updateProduct(HttpServletRequest request, HttpServletResponse response) throws IOException, SQLException, ServletException {
        int productStt = Integer.parseInt(request.getParameter("productStt"));
        String productName = request.getParameter("productName");
        double productPrice = Double.parseDouble(request.getParameter("productPrice"));
        int productQuantity = Integer.parseInt(request.getParameter("productQuantity"));
        String productColor = request.getParameter("productColor");
        String productCategory = request.getParameter("productCategory");

        Product productUpdate = new Product(productStt, productName, productPrice, productQuantity, productColor, productCategory);
        productService.updateProduct(productUpdate);

        response.sendRedirect("products");
//        RequestDispatcher dispatcher = request.getRequestDispatcher("product/update.jsp");
//        dispatcher.forward(request, response);
    }
}

