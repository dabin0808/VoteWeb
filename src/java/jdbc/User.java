package jdbc;

import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;

public class User {

    ConnectDB cdb = null;
    Connection con = null;
    Statement s = null;

    public User() throws SQLException, ClassNotFoundException {
        String id = null;
        String sql = null;
        register();
        sql = "create table user("
                + " user_id varchar2(20) primary key,"
                + " user_name varchar2(20) not null,"
                + " user_password varchar2(20) not null)";
//       sql ="drop table user";
        try {
            s.executeUpdate(sql);
        } catch (SQLException ex) {
            Logger.getLogger(User.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            cdb.close();
        }
    }

    public void updateuser(String id, String name, String password) throws SQLException, ClassNotFoundException {
        register();
        String sql = " insert into  user (user_id,user_name,user_password) values ('" + id + "','" + name + "','" + password + "')";
        s.executeUpdate(sql);
        cdb.close();
    }

    public ResultSet text() throws SQLException, ClassNotFoundException {
        register();
        String sql = "select * from user";
        return s.executeQuery(sql);
    }

    public int existuser(String id, String name) throws ClassNotFoundException, SQLException {
        if (id.equals("") || id == null || name.equals("") || name == null) {
            return 3;
        }
        register();
        String sql = "select * from user";
        ResultSet rs = s.executeQuery(sql);

        while (rs.next()) {
            if (id.equals(rs.getString("user_id"))) {
                return 1;
            }
            if (name.equals(rs.getString("user_name"))) {
                return 2;
            }
        }
        return 0;
    }

    public boolean login(String id, String password) throws ClassNotFoundException, SQLException {
        register();
        String sql = "select * from user";
        ResultSet rs = s.executeQuery(sql);
        while (rs.next()) {
            if (id.equals(rs.getString("user_id")) && password.equals(rs.getString("user_password"))) {
                return true;
            }
        }
        return false;
    }

    public String getusername(String id) throws ClassNotFoundException, SQLException {
        register();
        id = "'" + id + "'";
        String sql = "select * from user where user_id=" + id;
        ResultSet rs = s.executeQuery(sql);
        while (rs.next()) {
            String s = rs.getString("user_name");
            return s;
        }
        return null;
    }

    void register() throws SQLException, ClassNotFoundException {
        cdb = new ConnectDB("user");
        con = cdb.getconnection();
        s = cdb.getstatement();
    }
}
