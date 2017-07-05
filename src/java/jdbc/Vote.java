package jdbc;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;

public class Vote {

    Connection con = null;
    Statement s = null;
    ConnectDB cdb = null;

    public Vote() throws ClassNotFoundException, SQLException {
        register();
        String sql = "CREATE TABLE VOTE("
                + "vote_name varchar(20) primary key,"
                + "vote_e1 varchar(20) not null,"
                + "vote_n1 int default 0,"
                + "vote_e2 varcher(20),"
                + "vote_n2 int default 0,"
                + "vote_e3 varcher(20),"
                + "vote_n3 int default 0,"
                + "vote_select varchar(20) default 'single',"
                + "vote_deadline Datetime not null,"
                + "vote_cancel varchar(20) default 'true'"
                + " )";
//   sql="drop table vote";
        try {
            s.executeUpdate(sql);

        } catch (SQLException ex) {
            Logger.getLogger(Vote.class.getName()).log(Level.SEVERE, null, ex);
        } finally {

        }
    }

    public boolean insertvote(String user, String name, String e1, String e2, String e3, String select, String deadline) throws SQLException {
        try {
            try {
                register();
            } catch (SQLException ex) {
                Logger.getLogger(Vote.class.getName()).log(Level.SEVERE, null, ex);
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(Vote.class.getName()).log(Level.SEVERE, null, ex);
            }
            String cancel = "true";
            Date d = new Date();
            SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
            Date td = (Date) df.parse(df.format(d));
            Date dl = (Date) df.parse(deadline);
            int i = td.compareTo(dl);
            if (i > 0) {
                cancel = "false";
            }
            String sql = "insert into  vote values ('" + name + "','" + e1 + "',0,'" + e2 + "',0,'" + e3 + "',0,'" + select + "','" + deadline + "','" + cancel + "')";
            s.executeUpdate(sql);
            UserVote uv = new UserVote();
            return uv.insertuv(user, name);
        } catch (ParseException ex) {
            Logger.getLogger(Vote.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(Vote.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Vote.class.getName()).log(Level.SEVERE, null, ex);
        }

        return false;
    }

    public void cancelvote(String name) {
        try {
            try {
                register();
            } catch (SQLException ex) {
                Logger.getLogger(Vote.class.getName()).log(Level.SEVERE, null, ex);
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(Vote.class.getName()).log(Level.SEVERE, null, ex);
            }
            name = "'" + name + "'";
            String sql = "update vote set  vote_cancel='false' where vote_name=" + name;
            s.executeUpdate(sql);
        } catch (SQLException ex) {
            Logger.getLogger(Vote.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void continuevote(String name) {
        try {
            try {
                register();
            } catch (SQLException ex) {
                Logger.getLogger(Vote.class.getName()).log(Level.SEVERE, null, ex);
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(Vote.class.getName()).log(Level.SEVERE, null, ex);
            }
            name = "'" + name + "'";
            String sql = "update vote set  vote_cancel='true' where vote_name=" + name;
            s.executeUpdate(sql);
        } catch (SQLException ex) {
            Logger.getLogger(Vote.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    public ResultSet getallvote() throws SQLException, ClassNotFoundException {
        register();
        String sql = "select * from vote ";
        ResultSet rs = s.executeQuery(sql);
        return rs;
    }

    public ResultSet getsearch(String search) {
        try {
            register();
        } catch (SQLException ex) {

        } catch (ClassNotFoundException ex) {

        }

        String sql = "select * from vote where vote_name like '%" + search + "%'";
        try {
            ResultSet rs = s.executeQuery(sql);
            return rs;
        } catch (SQLException ex) {

        }
        return null;
    }

    public boolean existvote(String name) {
        try {
            try {
                register();
            } catch (SQLException ex) {
                Logger.getLogger(Vote.class.getName()).log(Level.SEVERE, null, ex);
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(Vote.class.getName()).log(Level.SEVERE, null, ex);
            }
            name = "'" + name + "'";
            String sql = "select * from vote where vote_name=" + name;
            ResultSet rs = s.executeQuery(sql);
            if (rs.next()) {
                return false;
            }
            return true;
        } catch (SQLException ex) {
            Logger.getLogger(Vote.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public ResultSet getvoteelement(String name) {
        try {
            try {
                register();
            } catch (SQLException ex) {
                Logger.getLogger(Vote.class.getName()).log(Level.SEVERE, null, ex);
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(Vote.class.getName()).log(Level.SEVERE, null, ex);
            }
            name = "'" + name + "'";
            String sql = "select * from vote where vote_name =" + name;
            ResultSet rs = s.executeQuery(sql);
            return rs;
        } catch (SQLException ex) {
            Logger.getLogger(Vote.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public void setvote(String name, boolean e1, boolean e2, boolean e3) throws SQLException {
        try {
            try {
                register();
            } catch (SQLException ex) {
                Logger.getLogger(Vote.class.getName()).log(Level.SEVERE, null, ex);
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(Vote.class.getName()).log(Level.SEVERE, null, ex);
            }
            int n1 = 0, n2 = 0, n3 = 0;
            name = "'" + name + "'";
            String sql = "select * from vote where vote_name =" + name;
            ResultSet rs = s.executeQuery(sql);
            if (rs.next()) {
                n1 = rs.getInt("vote_n1");
                n2 = rs.getInt("vote_n2");
                n3 = rs.getInt("vote_n3");
                if (e1) {
                    n1++;
                }
                if (e2) {
                    n2++;
                }
                if (e3) {
                    n3++;
                }
            }
            sql = "update vote set vote_n1=" + n1 + ",vote_n2=" + n2 + ",vote_n3=" + n3 + "  where vote_name=" + name;
            s.executeUpdate(sql);
        } catch (SQLException ex) {
            Logger.getLogger(Vote.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    void register() throws SQLException, ClassNotFoundException {
        cdb = new ConnectDB("vote");
        con = cdb.getconnection();
        s = cdb.getstatement();
    }
}
