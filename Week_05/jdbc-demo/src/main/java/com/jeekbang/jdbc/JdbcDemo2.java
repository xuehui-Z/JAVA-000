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
public class JdbcDemo2 {
    final static String url = "jdbc:h2:mem:dataSource;DB_CLOSE_DELAY=-1;DB_CLOSE_ON_EXIT=false";
    final static String username = "sa";
    final static String password = "";

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
        Connection connection = null;
        PreparedStatement pst = null;
        try {
            connection = DriverManager.getConnection(url, username, password);
            connection.setAutoCommit(false);

            // 查询
            String querySql = "select * from student where id = ?";
            pst = connection.prepareStatement(querySql);
            pst.setInt(1,1);
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

        newConnectionQuery();
    }

    /**
     * 新开事务查询
     */
    private static void newConnectionQuery() {
        try {
            Connection connection = DriverManager.getConnection(url,username,password);
            System.out.println("新事务中的结果");
            queryAll(connection);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
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
