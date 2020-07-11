package dao;

import java.sql.*;

import static lec24jdbc.MD5Tools.md5;

public class UserDao3 {
    final static String url = "jdbc:mysql://localhost:3306/ryx?&useSSL=false&serverTimezone=UTC&allowPublicKeyRetrieval=true";

    static Connection con = null;
    static Statement stmt = null;

    static {

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection(url, "root", "123456");
            stmt = con.createStatement();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static void main(String[] args) {

        System.out.println(getNum("Structs2","aaa"));
    }

    public static boolean updatePassword(String name, String pass1, String pass2) {
        if (!login(name, pass1)) {
            System.out.println("初始密码错误");
            return false;
        }
        String sql = "update users set password='" + md5(pass2) + "'where user_id='" + name + "'";
        boolean result = executeUpdate(sql);
        if (result) {
            System.out.println("修改密码成功");
        } else {
            System.out.println("修改密码失败");
        }
        return result;
    }


    public static boolean register(String name, String pass) {
        String sql = "select 1 from users where user_id='" + name + "'";

        if (executeQuery(sql)) {
            System.err.println("用户名已存在,name=" + name);
            return false;
        }
        sql = "insert into users(user_id,password) VALUE('" + name + "','" + md5(pass) + "')";
        String sql2 = String.format("insert into car(name)VALUE('%s')", name);
        executeUpdate(sql2);
        System.err.println(sql2);
        System.err.println(sql);

        boolean result = executeUpdate(sql);
        if (result) {

            System.err.println("注册成功,user=" + name + ",pass=" + pass);
        } else {
            System.err.println("注册失败,user=" + name + ",pass=" + pass);
        }
        return result;

    }

    public static boolean login(String name, String pass) {
        String sql = "select 1 from users where user_id='" + name + "' and password='" + md5(pass) + "' LIMIT 1";
        String sql2 = String.format("select 1 from users where user_id='%s' and password='%s' LIMIT 1", name, md5(pass));
        System.err.println(sql);
        System.err.println(sql2);
        boolean result = executeQuery(sql);
        if (result) {
            System.err.println("登陆成功,user=" + name + ",pass=" + pass);
        } else {
            System.err.println("登陆失败,user=" + name + ",pass=" + pass);
        }
        return result;
    }

    private static boolean executeQuery(String sql) {
        try (ResultSet rs = stmt.executeQuery(sql)) {
            if (rs.next()) {
                return true;
            }
            return false;
        } catch (SQLException e) {
            return false;
        }
    }

    private static boolean executeUpdate(String sql) {
        try {
            int affectedRows = stmt.executeUpdate(sql);
            return affectedRows > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public static void add(String name, String username) {

        String sql = String.format("update car set %s=%s+1 where name= '%s' LIMIT 1", name, name, username);
        System.err.println(sql);
        executeUpdate(sql);

    }
  public static void del(String name,String username){
        if (getNum(name,username)!=0){
            String sql = String.format("update car set %s=%s-1 where name= '%s' LIMIT 1", name, name, username);
            System.err.println(sql);
            executeUpdate(sql);

        }

  }
  public static void delTotal(String name,double num,String username){
        if (getNum("total",username)!=0){
            String sql=String.format("update car set total=total-%s where name='%s' ",num,name);
            executeUpdate(sql);
        }

  }



    public static void addTotal(String name,double num) {
    String sql=String.format("update car set total=total+%s where name='%s' ",num,name);
    executeUpdate(sql);
    }
    public static int getNum(String name, String name1){

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection(url, "root", "123456");
            stmt = con.createStatement();

            String sql = String.format("select * from car where name='%s' ", name1);
             ResultSet rs = stmt.executeQuery(sql);

            while (rs.next()) {
                System.out.println(rs.getInt(name));

                return rs.getInt(name);
            }


        } catch (Exception e) {
            e.printStackTrace();

        }
        return 0;


    }


}






