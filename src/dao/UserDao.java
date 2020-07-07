package dao;

import java.util.HashMap;

public class UserDao {
    static HashMap<String,String> users=new HashMap<>();
    static {
        users.put("admin","123456");
        users.put("tom","123");
        users.put("cat","456");
    }
public static boolean register(String name,String pass){
    if (users.containsKey(name)||name.trim().isEmpty()){
        return false;
    }
    users.put(name,pass);
    System.out.println("注册成功!");
    return true;
}
public static boolean login(String user,String pass){
    if (users.get(user)==null){
        System.out.println("用户不存在");
        return false;
    }
    if (!users.get(user).equals(pass)){
        System.out.println("密码错误");
        return false;

    }
    System.out.println("登陆成功");
    return true;
}
    private static boolean updatePasssword(String name, String oldPass, String newPass) {

        if (!login(name,oldPass)){
            System.out.println("旧密码错误,修改失败");
            return false;
        }
        users.put(name,newPass);
        System.out.println("修改密码成功");
        return true;


    }
    public static void main(String[] args) {
        register("tom","123456");
        register("cat","222222");
        System.out.println(login("tom","123456"));
        System.out.println(login("tom","333333"));
        updatePasssword("tom","123456","654321");
        System.out.println(login("tom","123456"));
        System.out.println(login("tom","654321"));
        System.out.println(users);
    }




}
