package vn.hoidanit.laptopshop.controller.admin;

import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import vn.hoidanit.laptopshop.domain.Order;
import vn.hoidanit.laptopshop.domain.User;
import vn.hoidanit.laptopshop.service.UploadService;
import vn.hoidanit.laptopshop.service.UserService;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import jakarta.validation.Valid;

@Controller
public class UserController {
    private final UserService userService;
    private final UploadService uploadService;
    private final PasswordEncoder passwordEncoder;

    public UserController(UserService userService, UploadService uploadService,
            PasswordEncoder passwordEncoder) {
        this.userService = userService;
        this.uploadService = uploadService;
        this.passwordEncoder = passwordEncoder;

    }

    @RequestMapping("/")
    public String getHomePage(Model model) {
        List<User> arrUsers = this.userService.getAllUsersByEmail("mimicute@gmail.com");
        System.out.println(arrUsers);

        String test = this.userService.handleHello();
        model.addAttribute("mimi", test);
        model.addAttribute("hoidanit", "from controller with model  ");
        return "hello";
    }

    @GetMapping("/admin/user/create")
    public String getUserCreatePage(Model model) {
        model.addAttribute("newUser", new User());

        return "admin/user/create";
    }

    @RequestMapping("/admin/user")
    public String getUserPage(Model model, @RequestParam("page") Optional<String> pageOptional) {
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
        Page<User> prs = this.userService.fetchUsers(pageable);
        List<User> users = prs.getContent();
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", prs.getTotalPages());
        model.addAttribute("newUser", new User());
        model.addAttribute("users", users);
        return "admin/user/show";
    }

    @RequestMapping("/admin/user/{id}")
    public String getUserDetailPage(Model model, @PathVariable long id) {
        User user = this.userService.getUserById(id);
        model.addAttribute("user", user);
        return "admin/user/detail";
    }

    @RequestMapping("/admin/user/update/{id}")
    public String getUserUpdatePage(Model model, @PathVariable long id) {
        User currentUser = this.userService.getUserById(id);
        model.addAttribute("newUser", currentUser);
        return "admin/user/update";
    }

    @PostMapping("/admin/user/update")
    public String postUpdateUser(Model model, @ModelAttribute("updateUser") User mimi,
            @RequestParam("mimiFile") MultipartFile file) {
        User currentUser = this.userService.getUserById(mimi.getId());
        if (currentUser != null) {
            System.out.println("Run here");
            currentUser.setAddress(mimi.getAddress());
            currentUser.setFullName(mimi.getFullName());
            currentUser.setPhone(mimi.getPhone());
            currentUser.setRole(this.userService.getRoleByName(mimi.getRole().getName()));
            String avatar = this.uploadService.handleSaveUploadFile(file, "avatar");
            currentUser.setAvatar(avatar);
            this.userService.handleSaveUser(currentUser);
        }
        return "redirect:/admin/user";
    }

    @RequestMapping(value = "/admin/user/create1", method = RequestMethod.POST)
    public String createUserPage(Model model, @ModelAttribute("newUser") @Valid User mimi,
            BindingResult newUserBindingResult,
            @RequestParam("mimiFile") MultipartFile file) {

        List<FieldError> errors = newUserBindingResult.getFieldErrors();
        for (FieldError error : errors) {
            System.out.println(">>>>>>>>" + error.getField() + " - " + error.getDefaultMessage());
        }
        if (newUserBindingResult.hasErrors()) {
            return "admin/user/create";
        }
        String avatar = this.uploadService.handleSaveUploadFile(file, "avatar");
        String hashPassword = this.passwordEncoder.encode(mimi.getPassword());
        mimi.setAvatar(avatar);
        mimi.setPassword(hashPassword);
        mimi.setRole(this.userService.getRoleByName(mimi.getRole().getName()));
        // Save role

        this.userService.handleSaveUser(mimi);

        return "redirect:/admin/user";
    }

    @GetMapping("/admin/user/delete/{id}")
    public String getDeleteUserPage(Model model, @PathVariable long id) {
        model.addAttribute("id", id);
        // User user = new User();
        // user.setId(id);
        model.addAttribute("newUser", new User());
        return "admin/user/delete";
    }

    @PostMapping("/admin/user/delete")
    public String postDeleteUserPage(Model model, @ModelAttribute("newUser") User mimi) {
        this.userService.deleteUser(mimi.getId());
        return "redirect:/admin/user";
    }

}
