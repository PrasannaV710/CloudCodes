/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Rohith
 */
public class Form extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Form</title>");            
            out.println("</head>");
            out.println("<body>");
            //out.println("<h1>Servlet Form at " + request.getContextPath() + "</h1>");
            String username=request.getParameter("username");
            String password=request.getParameter("password");
            int x=Integer.valueOf(request.getParameter("a"));
            int y=Integer.valueOf(request.getParameter("c"));
            int z=Integer.valueOf(request.getParameter("result"));
            int op=Integer.valueOf(request.getParameter("b"));
            String sa=request.getParameter("zip");
            String cit=request.getParameter("city");
            out.println(sa);
            //request.setAttribute("zip",request.getParameter("zip"));
            //ServletContext sc = this.getServletContext();
            //RequestDispatcher rd = sc.getRequestDispatcher("maps.jsp?zip="+sa);
            //rd.forward(request, response);
            
            
            //out.println(x);
            //out.println(y);
            //out.println(z);
            //out.println(op);
            int res=0;
            switch(op)
            {
                case 0:res=add(x,y);
                         break;
                case 1:res=subtract(x,y);
                        break;
                case 2:res=multiply(x,y);
                        break; 
                case 3:res=divide(x,y);
                        break;
                       
            }
            if(z==res)
            {
                out.println("<h1>Captcha is correct</h1>");
                if (username.equals("Cloud")&& password.equals("12345"))
            {
                out.println("<h1>Congratulations Login Success</h1>");
                response.setHeader("Refresh", "5;url=maps.jsp?zip="+sa);
                
            }
            
            else{
               out.println("<h1>Authentication Failed</h1>");
            }
            }
            else{
                out.println("<h1>Captcha is incorrect</h1>");
            }
            
            
            out.println("</body>");
            out.println("</html>");
        }
        
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    private static int add(int intA, int intB) {
        org.tempuri.Calculator service = new org.tempuri.Calculator();
        org.tempuri.CalculatorSoap port = service.getCalculatorSoap();
        return port.add(intA, intB);
    }

    private static int subtract(int intA, int intB) {
        org.tempuri.Calculator service = new org.tempuri.Calculator();
        org.tempuri.CalculatorSoap port = service.getCalculatorSoap();
        return port.subtract(intA, intB);
    }

    private static int multiply(int intA, int intB) {
        org.tempuri.Calculator service = new org.tempuri.Calculator();
        org.tempuri.CalculatorSoap port = service.getCalculatorSoap();
        return port.multiply(intA, intB);
    }

    private static int divide(int intA, int intB) {
        org.tempuri.Calculator service = new org.tempuri.Calculator();
        org.tempuri.CalculatorSoap port = service.getCalculatorSoap();
        return port.divide(intA, intB);
    }

}
