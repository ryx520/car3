package dao;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Scanner;

public class UserDao2 {
    final static String DB_FILE="users.csv";
    static HashMap<String,String> users=new HashMap<>();
    static {
        try {
            Scanner cin=new Scanner(new File(DB_FILE));
            cin.nextLine();
            while (cin.hasNextLine()){
                String line=cin.nextLine().trim();// 线trim去掉字符串首尾空格
                if (line.isEmpty())continue;
                String [] paras=line.split("\\s*,\\s*");
                System.err.println(Arrays.asList(paras));
                users.put(paras[0],paras[1]);
            }
            cin.close();

        } catch (IOException e) {
File file=new File(DB_FILE);
            try {
                file.createNewFile();
                PrintWriter pw=new PrintWriter(file);
                pw.println("name,password");
                System.err.println(DB_FILE+" created!!!");
                pw.close();
            } catch (IOException e1) {
                e1.printStackTrace();
            }
        }
    }  //todo

    public static boolean register(String name,String pass){
       //todo
        if (users.containsKey(name)){
            System.err.println("用户名已经存在注册失败");
            return false;
        }
        try {PrintWriter pw = new PrintWriter(new FileWriter(new File(DB_FILE), true));
            pw.println(name+","+pass);
            users.put(name,pass);
            System.err.println("注册成功");
            pw.close();
        } catch (IOException e) {
            System.err.println("网站错误,注册失败");
            return false;
        }
        return true;
    }
    public static boolean login(String user,String pass){
  try{
      Scanner cin=new Scanner(new File(DB_FILE));
      cin.nextLine();
      while (cin.hasNextLine()) {
          String line = cin.nextLine().trim();
          if (line.isEmpty()) continue;

          String[] paras = line.split("\\s*,\\s*");
          if (paras[0].equals(user)) {
              if (paras[1].equals(pass)) {

                  System.err.println("登录成功");
                  return true;
              }else {
                  System.err.println("密码错误");
                  return false;}
          }
      }
  }catch (IOException e){

  }
        System.err.println("用户名不存在");
        return false;
    }
    private static boolean updatePasssword(String name, String oldPass, String newPass) {
//todo
        return true;
    }
        public static void main(String[] args) {
register("zj","123");
login("zj","123");
login("zj2","123");
login("zj","123456");
    }
}
