/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import static java.nio.charset.StandardCharsets.UTF_8;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.*;
import java.util.Date;

public class loginModel {
    public String getHashPass(String plainText) throws NoSuchAlgorithmException
    {
        String hashpass;
        MessageDigest mdAlgorithm = MessageDigest.getInstance("MD5");
        mdAlgorithm.update(plainText.getBytes(UTF_8));

        byte[] digest = mdAlgorithm.digest();
        StringBuffer hexString = new StringBuffer();

        for (int i = 0; i < digest.length; i++) {
            plainText = Integer.toHexString(0xFF & digest[i]);

            if (plainText.length() < 2) {
                plainText = "0" + plainText;
            }

            hexString.append(plainText);
        }
        hashpass = hexString.toString();
        return hashpass;
    }
    public boolean checkLogin(String usname, String Passw)
    {
        try
        {
            Connection con = new dbConn().getConnection();
            PreparedStatement pu = con.prepareStatement("select us_id from users where usname = ? and password = ?");
            pu.setString(1, usname);
            pu.setString(2, Passw);
            if(pu.executeQuery().next())
            {
                PreparedStatement up = con.prepareStatement("update users set last_login = ? where usname = ? ");
                up.setString(1, new Date().toString());
                up.setString(2, usname);
                if(up.executeUpdate()>0)
                    return true;
            }
        }
        catch(Exception e)
        {
            System.out.println("Exception:"+e);
        }
        return false;
    }
}
