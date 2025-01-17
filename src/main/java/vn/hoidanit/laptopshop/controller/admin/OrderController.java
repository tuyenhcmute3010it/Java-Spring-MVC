package vn.hoidanit.laptopshop.controller.admin;

import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

import vn.hoidanit.laptopshop.domain.CartDetail;
import vn.hoidanit.laptopshop.domain.Order;
import vn.hoidanit.laptopshop.domain.OrderDetail;
import vn.hoidanit.laptopshop.domain.Product;
import vn.hoidanit.laptopshop.service.OrderService;
import vn.hoidanit.laptopshop.service.ProductService;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

@Controller
public class OrderController {
    private final ProductService productService;
    private final OrderService orderService;

    public OrderController(ProductService productService, OrderService orderService) {
        this.productService = productService;
        this.orderService = orderService;
    }

    @GetMapping("/admin/order")
    public String getOrderPage(
            @RequestParam("page") Optional<String> pageOptional, Model model) {
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
        Page<Order> prs = this.orderService.fetchOrders(pageable);
        List<Order> orders = prs.getContent();
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", prs.getTotalPages());
        model.addAttribute("orders", orders);
        return "admin/order/show";
    }

    @GetMapping("/admin/order/{id}")
    public String getOrderDetailPage(Model model, @PathVariable long id) {
        Order order = this.productService.getOrderById(id).get();
        model.addAttribute("order", order);
        model.addAttribute("orderDetails", order.getOrderDetails());
        return "admin/order/detail";
    }

    @PostMapping("/admin/order/delete/{id}")
    public String deleteOrder(Model model, @PathVariable long id) {
        Order order = this.productService.getOrderById(id).get();
        List<OrderDetail> orderDetail = order.getOrderDetails();
        for (OrderDetail cd : orderDetail) {
            if (cd.getOrder().getId() == id) {
                this.productService.deleteOrderDetailById(cd.getId());
            }
        }
        this.productService.deleteOrderById(id);
        return "redirect:/admin/order";
    }

    @GetMapping("/admin/order/update/{id}")
    public String getOrderUpdatePage(Model model, @PathVariable long id) {
        Order order = this.productService.getOrderById(id).get();
        model.addAttribute("order", order);
        model.addAttribute("orderDetails", order.getOrderDetails());
        return "admin/order/update";
    }

    @PostMapping("/admin/order/update/{id}")
    public String postUpdateOrder(Model model, @PathVariable long id, @ModelAttribute("order") Order order) {
        Order order1 = this.productService.getOrderById(id).get();
        order1.setStatus(order.getStatus());
        return "redirect:/admin/order";
    }

}
