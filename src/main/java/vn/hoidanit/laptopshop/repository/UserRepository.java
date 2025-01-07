package vn.hoidanit.laptopshop.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import vn.hoidanit.laptopshop.domain.User;
import java.util.List;

@Repository
public interface UserRepository extends JpaRepository<User, Long> {
    User save(User mimi);

    List<User> findByEmail(String email);

    void deleteById(long id);

    // insert into user value();
    List<User> findAll();

    User findById(long id);

}
