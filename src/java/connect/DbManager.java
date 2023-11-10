package connect;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
public class DbManager {

    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    
    // creating connection db;
    public DbManager(){
        try {
            
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/crmdb?characterEncoding=utf-8","root","@Mmuutt00");
        } catch (ClassNotFoundException e) {
          e.printStackTrace();
        }
        catch (SQLException e) {
            e.printStackTrace();
        }
        
    } // end of constructor
    
//    start of insertUpdateDelete
    public boolean insertUpdateDelete(String query){
        try {
       ps = con.prepareStatement(query);
     int n =  ps.executeUpdate(); // it  return int value... no of row affected.
            if(n>0){
                return true;
            }else{
                
            return false;
            }
        } catch (SQLException e) {
//            e.printStackTrace();
            return false;
        }

        } // end of insertUpdateDelete
    
    
    // getting the result from query.
    public ResultSet select(String query){
        try {
            ps = con.prepareStatement(query);
           rs =  ps.executeQuery();
//         
        } catch (SQLException e) {
          e.printStackTrace();
        }
        return rs;
    }
    
}
