package jdbc;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

public class UserVote {

    Connection con = null;
    Statement s = null;
    ConnectDB cdb = null;

    public UserVote() throws ClassNotFoundException, SQLException {
        register();
        String sql = "create table user_vote("
                + "uv_id int auto_increment primary key ,"
                + "vote_name varchar(20) not null,"
                + "user_id varchar(20) not null)";
//     sql="drop table user_vote";
        try {
            s.executeUpdate(sql);
        } catch (SQLException ex) {
            Logger.getLogger(UserVote.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            cdb.close();
        }
    }

    public ResultSet getuservote(String id) {
        try {
            try {
                register();
            } catch (SQLException ex) {
                Logger.getLogger(UserVote.class.getName()).log(Level.SEVERE, null, ex);
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(UserVote.class.getName()).log(Level.SEVERE, null, ex);
            }
            id = "'" + id + "';";
            String sql = "select * from user_vote where user_id =" + id;
            ResultSet rs = s.executeQuery(sql);

            return rs;
        } catch (SQLException ex) {
            Logger.getLogger(UserVote.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public boolean insertuv(String user, String vote) throws SQLException {
        try {
            try {
                register();
            } catch (SQLException ex) {
                Logger.getLogger(UserVote.class.getName()).log(Level.SEVERE, null, ex);
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(UserVote.class.getName()).log(Level.SEVERE, null, ex);
            }
            String sql = "insert into  user_vote(vote_name,user_id) values ('" + vote + "','" + user + "')";
            s.executeUpdate(sql);
        } catch (SQLException ex) {
            Logger.getLogger(UserVote.class.getName()).log(Level.SEVERE, null, ex);
        }
        return true;
    }

    void register() throws SQLException, ClassNotFoundException {
        cdb = new ConnectDB("uservote");
        con = cdb.getconnection();
        s = cdb.getstatement();
    }
}
