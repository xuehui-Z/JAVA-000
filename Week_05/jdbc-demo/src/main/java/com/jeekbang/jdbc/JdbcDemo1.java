package com.jeekbang.jdbc;

import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;


/**
 * 使用 JDBC 原生接口，实现数据库的增删改查操作
 * 1、数据库URL
 * 2、Connection Connection conn = DriverManager.getConnection(url,user,pass);
 * 3.1、Statement Statement st = conn.createStatement();
 * 3.2、PreperedStatement  PreperedStatement st =  conn.preparedStatement()
 * 4、获取行 ResultSet
 * 5、释放资源
 */
public class JdbcDemo1 {
    public static void main(String[] args) throws ClassNotFoundException {
        initH2DataBase();
        long start=System.currentTimeMillis();
        jdbcTest();
        System.out.println("使用时间："+ (System.currentTimeMillis()-start) + " ms");
    }

    private static void initH2DataBase() {
        new ClassPathXmlApplicationContext("classpath:application.xml");
    }

    public static void jdbcTest() {
        String url = "jdbc:h2:mem:dataSource;DB_CLOSE_DELAY=-1;DB_CLOSE_ON_EXIT=false";
        String username = "sa";
        String password = "";
        Connection connection = null;
        Statement statement = null;
        try {
            connection = DriverManager.getConnection(url, username, password);
            statement = connection.createStatement();
            // 查询
            String querySql = "select * from student";
            List<Student> result = query(statement,querySql);
            print(result);

            // 新增
            String insertSql = "insert into student(name) values('测试')";
            boolean exFlg = execte(statement, insertSql);
            if (exFlg) System.out.println("新增成功");
            result = query(statement,querySql);
            print(result);

            // 修改
            String updateSql = "update student set name='测试-修改' where name='测试'";
            exFlg = execte(statement, updateSql);
            if (exFlg) System.out.println("修改成功");
            result = query(statement,querySql);
            print(result);

            // 删除
            String deleteSql = "delete from student where name='测试-修改'";
            exFlg = execte(statement, deleteSql);
            if (exFlg) System.out.println("删除成功");
            result = query(statement,querySql);
            print(result);

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            if (statement != null) {
                try {
                    statement.close();
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



    private static void print(List<Student> result) {
        result.forEach((student)->System.out.println(student));
    }

    private static List<Student> query(Statement statement, String sql) throws SQLException {
        statement.executeQuery(sql);
        ResultSet resultSet = statement.getResultSet();
        List<Student> resultList = new ArrayList<>();
        while (resultSet.next()) {
            int id = resultSet.getInt("id");
            String name = resultSet.getString("name");
            resultList.add(new Student(id,name));
        }
        return resultList;
    }

    private static boolean execte(Statement statement, String sql) throws SQLException {
        int i = statement.executeUpdate(sql);
        return i>0;
    }
}
