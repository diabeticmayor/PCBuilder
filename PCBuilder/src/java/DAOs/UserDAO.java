/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAOs;

import DTOs.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author d00191008
 */
public class UserDAO extends DAO implements UserDAOInterface {
    
    public UserDAO(String db) {
        super(db);
    }

    @Override
    public User getUserByEmailPassword(String e, String p) {
        
        //Initialize variables
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        
        User u = new User();
        
        try {
            //Connecto to database
            con = getConnection();
            
            //Construct SQL query
            String query = "SELECT * FROM User WHERE user_email = ? AND user_password = ?";
            
            //Prepare Statement for execution
            ps = con.prepareStatement(query);
            ps.setString(1, e);
            ps.setString(2, p);
            
            //Execute statement
            rs = ps.executeQuery();
            
            //If a user is found, retrieve values and construct User.
            if (rs.next()) {
                int id = rs.getInt("user_id");
                String firstname = rs.getString("user_firstname");
                String lastname = rs.getString("user_lastname");
                String email = rs.getString("user_email");
                String password = rs.getString("user_password");
                
                //If the found user has specified an address, retrieve it.
                if (rs.getString("user_address1") != null) {
                    String address1 = rs.getString("user_address1");
                    String address2 = rs.getString("user_address2");
                    String city = rs.getString("user_city");
                    String country = rs.getString("user_country");
                    
                    u = new User(firstname, lastname, email, password, address1, address2, city, country);
                    
                }
                
                else {
                    u = new User(firstname, lastname, email, password);
                }
            }
            
            
        } catch (SQLException ex) {
            System.out.println("An exception occured while preparing SQL: " + ex.getMessage());
            
            //Close connections.
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException ex) {
                    System.out.println("An exception occured while closing a connection: " + ex.getMessage());
                }
            }
            
            if (ps != null) {
                try {
                    ps.close();
                } catch (SQLException ex) {
                    System.out.println("An exception occured while closing a connection: " + ex.getMessage());
                }
            }
            
            if (con != null) {
                freeConnection(con);
            }
        }
        
        //Return user found.
        return u;
    }

    @Override
    public int registerUser(User u) {

        //Initialize variables
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        
        int registered = -1;
        
        try {
            //Connecto to database
            con = getConnection();
            String query;
            
            if (u.getAddress1() == null) {
                query = "INSERT INTO User(user_firstname, user_lastname, user_email, user_password) VALUES(?, ?, ?, ?)";
                ps = con.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
                ps.setString(1, u.getFirstname());
                ps.setString(2, u.getLastname());
                ps.setString(3, u.getEmail());
                ps.setString(4, u.getPassword());
            }
            else {
                query = "INSERT INTO User(user_firstname, user_lastname, user_email, user_password, user_address1, user_address2, user_city, user_country) VALUES(?, ?, ?, ?, ?, ?, ?, ?)";
                ps = con.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
                ps.setString(1, u.getFirstname());
                ps.setString(2, u.getLastname());
                ps.setString(3, u.getEmail());
                ps.setString(4, u.getPassword());
                ps.setString(5, u.getAddress1());
                ps.setString(6, u.getAddress2());
                ps.setString(7, u.getCity());
                ps.setString(8, u.getCountry());
            }
            
            rs = ps.getGeneratedKeys();
            
            if (rs.next()) {
                registered = rs.getInt(1);
            }
            
        } catch (SQLException ex) {
            System.out.println("An exception occured registering a user: " + ex.getMessage());
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (ps != null) {
                    ps.close();
                }
                if (con != null) {
                    freeConnection(con);
                }
            } catch (SQLException ex) {
                System.out.println("An exception occured while closing a connection: " + ex.getMessage());
            }
        }
        
        return registered;
    }

    @Override
    public boolean setAddress(User u, String a1, String a2, String city, String country) {
        
        Connection con = null;
        PreparedStatement ps = null;
        int rs = -1;
        
        User user = getUserByEmailPassword(u.getEmail(), u.getPassword());
        boolean set = false;
        
        try {
            //Connecto to database
            con = getConnection();
            
            //Construct SQL query
            String query = "UPDATE User SET user_address1 = ?, user_address2 = ?, user_city = ?, user_country = ? WHERE user_id = ?";
            
            //Prepare Statement for execution
            ps = con.prepareStatement(query);
            ps.setString(1, a1);
            ps.setString(2, a2);
            ps.setString(3, city);
            ps.setString(4, country);
            ps.setInt(5, u.getId());
            
            //Execute statement
            rs = ps.executeUpdate();
            
            if (rs > 0) {
                set = true;
            }
            
        } catch (SQLException ex) {
            System.out.println("An exception occured while preparing SQL: " + ex.getMessage());
            
            //Close connections.
        } finally {            
            if (ps != null) {
                try {
                    ps.close();
                } catch (SQLException ex) {
                    System.out.println("An exception occured while closing a connection: " + ex.getMessage());
                }
            }
            
            if (con != null) {
                freeConnection(con);
            }
        }
        
        //Return whether or not values were changed.
        return set;
    }
    
}
