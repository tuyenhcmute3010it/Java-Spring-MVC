package vn.hoidanit.laptopshop.controller.admin;

import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import jakarta.validation.Valid;
import vn.hoidanit.laptopshop.domain.Product;
import vn.hoidanit.laptopshop.service.ProductService;
import vn.hoidanit.laptopshop.service.UploadService;

@Controller
public class ProductController {
    private final ProductService productService;
    private final UploadService uploadService;

    @GetMapping("/admin/product")
    public String getProduct(
            Model model,
            @RequestParam("page") Optional<String> pageOptional) {
        int page = 1;
        try {
            if (pageOptional.isPresent()) {
                // convert from String to int
                page = Integer.parseInt(pageOptional.get());
            } else {
                // page = 1
            }
        } catch (Exception e) {
            // page = 1
            // TODO: handle exception
        }

        Pageable pageable = PageRequest.of(page - 1, 5);
        Page<Product> prs = this.productService.fetchProducts(pageable);
        List<Product> listProducts = prs.getContent();
        model.addAttribute("products", listProducts);

        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", prs.getTotalPages());

        return "admin/product/show";
    }

    ProductController(ProductService productService, UploadService uploadService) {
        this.uploadService = uploadService;
        this.productService = productService;
    }

    @PostMapping("/admin/product/create")
    public String postCreateProduct(Model model, @ModelAttribute("newProduct") @Valid Product pro,
            BindingResult newProductBindingResult,
            @RequestParam("thumbProduct") MultipartFile thumb) {
        //
        List<FieldError> errors = newProductBindingResult.getFieldErrors();
        for (FieldError error : errors) {
            System.out.println(">>>>>>>>" + error.getField() + " - " + error.getDefaultMessage());
        }
        if (newProductBindingResult.hasErrors()) {
            return "admin/product/create";
        }
        //
        model.addAttribute("newProduct", new Product());
        String image = this.uploadService.handleSaveUploadFile(thumb, "product");
        pro.setImage(image);
        this.productService.saveCreateProduct(pro);
        return "redirect:/admin/product";
    }

    @GetMapping("/admin/product/create")
    public String getCreateProductPage(Model model, @ModelAttribute("newProduct") Product pro) {
        model.addAttribute("newProduct", new Product());

        return "admin/product/create";
    }

    @GetMapping("/admin/product/{id}")
    public String getProductDetail(Model model, @PathVariable long id) {
        Product product = this.productService.getProductById(id);
        model.addAttribute("product", product);
        return "admin/product/detail";
    }

    @GetMapping("/admin/product/update/{id}")
    public String getUpdateProductPage(Model model, @PathVariable long id) {
        Product product = this.productService.getProductById(id);
        model.addAttribute("updateProduct", product);
        return "admin/product/update";
    }

    @PostMapping("/admin/product/update")
    public String postMethodName(Model model, @RequestParam("thumbProduct") MultipartFile thumb,
            @ModelAttribute("updateProduct") @Valid Product pro, BindingResult updateProductBindingResult) {
        List<FieldError> errors = updateProductBindingResult.getFieldErrors();
        for (FieldError error : errors) {
            System.out.println(">>>>>>>>" + error.getField() + " - " + error.getDefaultMessage());
        }
        if (updateProductBindingResult.hasErrors()) {
            return "admin/product/update";
        }
        Product product = this.productService.getProductById(pro.getId());
        if (product != null) {
            if (!thumb.isEmpty()) {
                String image = this.uploadService.handleSaveUploadFile(thumb, "product");
                product.setImage(image);
            }
            product.setName(pro.getName());
            product.setPrice(pro.getPrice());
            product.setDetailDesc(pro.getDetailDesc());
            product.setQuantity(pro.getQuantity());
            product.setFactory(pro.getFactory());
            product.setTarget(pro.getTarget());
            this.productService.saveCreateProduct(product);
        }

        return "redirect:/admin/product";
    }

    @GetMapping("/admin/product/delete/{id}")
    public String getDeleteProductPage(Model model, @ModelAttribute("deleteProduct") Product product) {
        model.addAttribute("deleteProduct", product);

        return "admin/product/delete";
    }

    @PostMapping("/admin/product/delete")
    public String postMethodName(@ModelAttribute("deleteProduct") Product product) {
        // TODO: process POST request
        this.productService.deleteProductById(product.getId());
        return "redirect:/admin/product";
    }

}
