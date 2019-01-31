/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAOs;

import DTOs.User;

/**
 *
 * @author d00191008
 */
public interface UserDAOInterface {
    public User getUserByEmailPassword(String email, String password);
    public int registerUser(User u);
    public boolean setAddress(User u, String a1, String a2, String city, String Country);
}
