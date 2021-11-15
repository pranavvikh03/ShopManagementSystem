/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Model.loginModel;
import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "Login", urlPatterns = {"/Login"})
public class Login extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect("index.html?status=2");
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String usname = request.getParameter("username");
        String Passw = request.getParameter("password");
        loginModel lm = new loginModel();
        try {
            Passw = lm.getHashPass(Passw);
            if(lm.checkLogin(usname, Passw)==true)
            {
                HttpSession session = request.getSession();
                session.setAttribute("usname", usname);
//                request.getRequestDispatcher("dashboard").forward(request,response);
                response.sendRedirect("dashboard");
            }
            else
            {
                response.sendRedirect("index.html?status=1");

            }
        } catch (NoSuchAlgorithmException ex) {
            Logger.getLogger(Login.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}
