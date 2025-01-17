package vn.hoidanit.laptopshop.controller.client;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;

import vn.hoidanit.laptopshop.domain.Cart;
import vn.hoidanit.laptopshop.domain.CartDetail;
import vn.hoidanit.laptopshop.domain.Order;
import vn.hoidanit.laptopshop.domain.OrderDetail;
import vn.hoidanit.laptopshop.domain.Product;
import vn.hoidanit.laptopshop.domain.User;
import vn.hoidanit.laptopshop.service.ProductService;
import vn.hoidanit.laptopshop.service.UserService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class ItemController {
    private final ProductService productService;
    private final UserService userService;

    public ItemController(ProductService productService, UserService userService) {
        this.productService = productService;
        this.userService = userService;
    }

    @GetMapping("/product/{id}")
    public String getProductDetail(Model model, @PathVariable long id) {
        Product product = this.productService.getProductById(id);
        model.addAttribute("product", product);
        return "client/product/detail";
    }

    @PostMapping("/add-product-to-cart/{id}")
    public String addProductToCart(@PathVariable long id, HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        Long productId = id;
        String email = (String) session.getAttribute("email");
        this.productService.handleAddProductToCart(email, productId, session, 1);
        return "redirect:/";
    }

    @GetMapping("/cart")
    public String getCartPage(Model model, HttpServletRequest request) {
        User user = new User();
        HttpSession session = request.getSession(false);
        long id = (long) session.getAttribute("id");
        user.setId(id);
        Cart cart = this.productService.getCartByUser(user);
        List<CartDetail> cartDetails = cart == null ? new ArrayList<CartDetail>() : cart.getCartDetails();

        double sum = 0;
        for (CartDetail cd : cartDetails) {
            sum += cd.priceQuantity();
        }
        model.addAttribute("cartDetails", cartDetails);
        model.addAttribute("sum", sum);
        model.addAttribute("cart", cart);

        // model.addAttribute("costs", costs);
        return "client/cart/show";
    }

    @PostMapping("/delete-product-cart/{id}")
    public String postDeleteProductCart(Model model, @PathVariable long id, HttpServletRequest request) {
        this.productService.deleteCartById(id);
        HttpSession session = request.getSession(false);
        User user = new User();
        long id1 = (long) session.getAttribute("id");
        user.setId(id1);
        Cart cart = this.productService.getCartByUser(user);
        int s = cart.getSum() - 1;
        cart.setSum(s);
        this.productService.handleSaveCart(cart);
        session.setAttribute("sum", s);
        return "redirect:/cart";
    }

    @PostMapping("/confirm-checkout")
    public String getCheckOutPage(Model model, @ModelAttribute("cart") Cart cart) {
        List<CartDetail> cartDetails = cart == null ? new ArrayList<CartDetail>() : cart.getCartDetails();
        this.productService.handleUpdateCartBeforeCheckout(cartDetails);
        return "redirect:/checkout";
    }

    @GetMapping("/checkout")
    public String getCheckoutPage(Model model, HttpServletRequest request) {
        User user = new User();
        HttpSession session = request.getSession(false);
        long id = (long) session.getAttribute("id");
        user.setId(id);
        Cart cart = this.productService.getCartByUser(user);
        List<CartDetail> cartDetails = cart == null ? new ArrayList<CartDetail>() : cart.getCartDetails();

        double sum = 0;
        for (CartDetail cd : cartDetails) {
            sum += cd.priceQuantity();
        }
        model.addAttribute("cartDetails", cartDetails);
        model.addAttribute("sum", sum);

        return "client/cart/checkout";
    }

    @PostMapping("/place-order")
    public String postPlaceOrder(
            HttpServletRequest request,
            @RequestParam("receiverName") String receiverName,
            @RequestParam("receiverAddress") String receiverAddress,
            @RequestParam("receiverPhone") String receiverPhone) {

        HttpSession session = request.getSession();
        long id = (long) session.getAttribute("id");
        User currentUser = new User();
        currentUser.setId(id);
        this.productService.handlePlaceOrder(currentUser, session, receiverName, receiverAddress, receiverPhone);
        return "client/cart/thanks";

    }

    @GetMapping("/order-history")
    public String getOrderHistoryPage(Model model, HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        long id = (long) session.getAttribute("id");
        User user = this.userService.getUserById(id);
        List<Order> orders = this.productService.fetchOrderByUser(user);
        model.addAttribute("orders", orders);
        return "client/cart/history";
    }

    @PostMapping("/add-product-from-view-detail")
    public String handleAddProductFromViewDetail(
            @RequestParam("id") long id,
            @RequestParam("quantity") long quantity,
            HttpServletRequest request, @ModelAttribute("product") Product product) {
        HttpSession session = request.getSession(false);

        String email = (String) session.getAttribute("email");
        this.productService.handleAddProductToCart(email, id, session, quantity);
        return "redirect:/product/" + id;
    }
}
