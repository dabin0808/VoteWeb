package jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class ConnectDB {

    Connection con = null;
    Statement s = null;

    public ConnectDB(String db) throws SQLException, ClassNotFoundException {
        register(db);
    }

    public Connection getconnection() {
        return con;
    }

    public Statement getstatement() {
        return s;
    }

    void register(String db) throws SQLException, ClassNotFoundException {
        Class.forName("org.sqlite.JDBC");
        con = DriverManager.getConnection("jdbc:sqlite:" + db + ".db");
        s = con.createStatement();

    }

    public void close() throws SQLException {
        if (con != null) {
            con.close();
            con = null;
        }
        if (s != null) {
            s = null;
        }
    }
}
