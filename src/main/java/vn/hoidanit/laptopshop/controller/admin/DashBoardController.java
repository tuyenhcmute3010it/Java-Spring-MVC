package vn.hoidanit.laptopshop.controller.admin;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import vn.hoidanit.laptopshop.domain.Order;
import vn.hoidanit.laptopshop.domain.Product;
import vn.hoidanit.laptopshop.domain.User;
import vn.hoidanit.laptopshop.service.ProductService;
import vn.hoidanit.laptopshop.service.UserService;

@Controller
public class DashBoardController {
    private final ProductService productService;
    private final UserService userService;

    public DashBoardController(ProductService productService, UserService userService) {
        this.productService = productService;
        this.userService = userService;
    }

    @GetMapping("/admin")
    public String getDashboard(Model model) {

        model.addAttribute("countUser", this.userService.countUser());
        model.addAttribute("countProduct", this.userService.countProduct());
        model.addAttribute("countOrder", this.userService.countOrder());
        return "admin/dashboard/show";
    }
}
