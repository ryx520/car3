package dao;

import java.sql.*;

import static lec24jdbc.MD5Tools.md5;

public class UserDao3 {
    final static String url="jdbc:mysql://localhost:3306/ryx?&useSSL=false&serverTimezone=UTC&allowPublicKeyRetrieval=true";
    static Connection con=null;
    static Statement stmt=null;
    static {

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                con= DriverManager.getConnection(url,"root","123456");
                stmt=con.createStatement();
            } catch (Exception e) {
                e.printStackTrace();
            }
    }
    public static void main(String [] args){
        System.out.println(login("cat","123"));
        System.out.println(login("tom","456"));
        System.out.println(login("cat","456"));
        register("tom1","123456");
        register("cat1","666666");
        System.out.println(login("tom1","123456"));
        System.out.println(login("tom1","222222"));
        System.out.println(updatePassword("tom1","123456","654321"));
        System.out.println(login("tom1","123456"));
        System.out.println(login("tom1","654321"));
        System.out.println(login("admin","123' or '1'='1"));



    }

    private static boolean updatePassword(String name,String pass1,String pass2) {
        if (!login(name,pass1)){
            System.out.println("初始密码错误");
            return false;
        }
        String sql="update users set password='" + md5(pass2) + "'where user_id='" + name + "'";
        boolean result=executeUpdate(sql);
        if (result){
            System.out.println("修改密码成功");
        }else {
            System.out.println("修改密码失败");
        }
return result;
    }



    public static boolean register(String name, String pass) {
        String sql="select 1 from users where user_id='" + name +"'";
        if (executeQuery(sql)){
            System.err.println("用户名已存在,name="+name);
           return false;
        }
        sql="insert into users(user_id,password) VALUE('" + name + "','" + md5(pass) + "')";
        System.err.println(sql);
        boolean result=executeUpdate(sql);
        if (result){
            System.err.println("注册成功,user=" + name +",pass=" +pass);
        }else {
            System.err.println("注册失败,user=" + name + ",pass=" +pass);
        }
        return result;

    }

    public static boolean login(String name, String pass) {
        String sql="select 1 from users where user_id='" + name +"' and password='"+ md5(pass) +"' LIMIT 1";
        String sql2=String.format("select 1 from users where user_id='%s' and password='%s' LIMIT 1",name,md5(pass));
        System.err.println(sql);
        System.err.println(sql2);
        boolean result=executeQuery(sql);
        if (result){
            System.err.println("登陆成功,user=" + name + ",pass=" + pass);
        }else {
            System.err.println("登陆失败,user=" + name +",pass=" +pass);
        }
        return result;
    }

    private static boolean executeQuery(String sql) {
        try (ResultSet rs = stmt.executeQuery(sql)) {
            if (rs.next()) {return true;}
            return false;
        }catch (SQLException e){
            return false;
        }
    }
    private static boolean executeUpdate(String sql) {
        try {
            int affectedRows=stmt.executeUpdate(sql);
            return affectedRows>0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}
