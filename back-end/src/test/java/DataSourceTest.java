import com.demo.entity.User;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:ApplicationContextConfig.xml")
public class DataSourceTest {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    @Test
    public void dataSourceTest() {
        System.out.println(jdbcTemplate);
    }

    @Test
    public void selectTest() {
        String sql= "select count(*) from t_user";
        Integer total = jdbcTemplate.queryForObject(sql, Integer.class);
        System.out.println(total);
    }

    @Test
    public void selectByIDTest() {
        String sql = "select * from t_user where id = 2";
        User user = jdbcTemplate.queryForObject(sql, new BeanPropertyRowMapper<User>(User.class));
        System.out.println(user);
    }

    @Test
    public void selectAllUsersTest() {
        String sql = "select * from t_user";
        List<User> users = jdbcTemplate.query(sql, new BeanPropertyRowMapper<User>(User.class));
        for (User u : users) {
            System.out.println(u);
        }
    }

    @Test
    public void addUserTest() {
        User u = new User(4, "Demo", "123456", "123456");
        String sql = "insert into t_user values(?,?,?,?)";
        Object[] args = {
                u.getId(),
                u.getUsername(),
                u.getPassword(),
                u.getTel()
        };
        jdbcTemplate.update(sql, args);
    }
}
