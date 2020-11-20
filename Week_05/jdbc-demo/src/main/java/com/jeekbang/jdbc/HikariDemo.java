package com.jeekbang.jdbc;

import com.zaxxer.hikari.HikariDataSource;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import javax.sql.DataSource;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;


/**
 * 配置 Hikari 连接池
 */
public class HikariDemo {

    public static DataSource hikariDataSource(){
        HikariDataSource hikariDataSource = new HikariDataSource();
        hikariDataSource.setDriverClassName("org.h2.Driver");
        hikariDataSource.setJdbcUrl("jdbc:h2:mem:dataSource;DB_CLOSE_DELAY=-1;DB_CLOSE_ON_EXIT=false");
        hikariDataSource.setUsername("sa");
        hikariDataSource.setPassword("");

        return hikariDataSource;
    }

    private static void initH2DataBase() {
        new ClassPathXmlApplicationContext("classpath:application.xml");
    }

    public static void main(String[] args) {
        initH2DataBase();
        long start=System.currentTimeMillis();
        hikariTest();
        System.out.println("使用时间："+ (System.currentTimeMillis()-start) + " ms");
    }

    private static void hikariTest() {
        PreparedStatement pst = null;
        Connection connection = null;
        try {
            DataSource dataSource = hikariDataSource();
            connection = dataSource.getConnection();

            // 查询
            String querySql = "select * from student";
            pst = connection.prepareStatement(querySql);
            List<Student> result = query(pst);
            print(result);

            // 新增
            String insertSql = "insert into student(name) values(?)";
            pst = connection.prepareStatement(insertSql);
            pst.setString(1,"周杰伦");
            boolean exFlg = execte(pst);
            if (exFlg) {
                System.out.println("新增成功");
                //connection.commit();
            }
            queryAll(connection);

            // 修改
            String updateSql = "update student set name=? where name=?";
            pst = connection.prepareStatement(updateSql);
            pst.setString(1,"Jay");
            pst.setString(2,"周杰伦");
            exFlg = execte(pst);
            if (exFlg) {
                System.out.println("修改成功");
                connection.commit();
            }
            queryAll(connection);

            // 删除
            String deleteSql = "delete from student where name=?";
            pst = connection.prepareStatement(deleteSql);
            pst.setString(1,"Jay");
            exFlg = execte(pst);
            if (exFlg) {
                System.out.println("删除成功");
                //connection.commit();
            }
            queryAll(connection);
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            if (pst != null) {
                try {
                    pst.close();
                } catch (SQLException throwables) {
                    throwables.printStackTrace();
                }
            }
            if (connection != null) {
                try {
                    connection.close();
                } catch (SQLException throwables) {
                    throwables.printStackTrace();
                }
            }
        }
    }

    /**
     * 查询所有
     * @param connection
     * @throws SQLException
     */
    private static void queryAll(Connection connection) throws SQLException {
        Statement statement = connection.createStatement();
        statement.executeQuery("select * from student");
        ResultSet resultSet = statement.getResultSet();
        while (resultSet.next()) {
            int id = resultSet.getInt("id");
            String name = resultSet.getString("name");
            System.out.print(name+ " ");
        }
        System.out.println();
    }

    private static void print(List<Student> result) {
        result.forEach((student)->System.out.println(student));
    }

    private static List<Student> query(PreparedStatement statement) throws SQLException {
        ResultSet resultSet = statement.executeQuery();
        List<Student> resultList = new ArrayList<>();
        while (resultSet.next()) {
            int id = resultSet.getInt("id");
            String name = resultSet.getString("name");
            resultList.add(new Student(id,name));
        }
        return resultList;
    }

    private static boolean execte(PreparedStatement statement) throws SQLException {
        int i = statement.executeUpdate();
        return i > 0;
    }
}
