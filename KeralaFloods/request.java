/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.amazonaws.auth.AWSStaticCredentialsProvider;
import com.amazonaws.auth.BasicAWSCredentials;
import com.amazonaws.regions.Region;
import com.amazonaws.regions.Regions;
import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.AmazonS3Client;
import com.amazonaws.services.s3.AmazonS3ClientBuilder;
import com.amazonaws.services.s3.model.AmazonS3Exception;
import com.amazonaws.services.s3.model.Bucket;
import com.amazonaws.services.s3.model.ObjectMetadata;
import com.amazonaws.services.s3.model.PutObjectRequest;
import com.amazonaws.services.s3.model.PutObjectResult;
import java.io.ByteArrayInputStream;

import java.io.IOException;
import java.io.InputStream;
import java.util.Date;
import java.util.List;


/**
 *
 * @author Rohith
 */
@WebServlet(urlPatterns = {"/request"})
public class request extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    
    public static BasicAWSCredentials creds=null; 
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        response.setContentType("text/html;charset=UTF-8");
        String bucketName = "prasannas3bucket";
        Date sum=new Date();
        String s=sum.toString();
        File file = new File("C:\\KeralaFloods\\floods.txt"); 
          FileWriter fr = new FileWriter(file, true);
          fr.append(request.getParameter("dis"));
          fr.append('|');
          fr.append(request.getParameter("loc"));
          fr.append('|');
          fr.append(request.getParameter("fname"));
          fr.append('|');
          fr.append(request.getParameter("pnum"));
          int i;
          String[] a= new String[4];
          a[0]=request.getParameter("req0");
          a[1]=request.getParameter("req1");
          a[2]=request.getParameter("req2");
          a[3]=request.getParameter("req3");
          fr.append('|');
          for(i=0;i<4;i++)
          {
              if(a[i]!=null)
              {
                  fr.append(a[i]);
                  fr.append(",");
              } 
          }
          fr.append('|');
          fr.append(s);
          fr.append(System.getProperty("line.separator"));
          fr.close();
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet request</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet request at " + request.getContextPath() + "</h1>");
            response.setHeader("Refresh", "3;url=index.html");
            out.println("</body>");
            out.println("</html>");
        }
        
        creds = new BasicAWSCredentials("", "");
      String path="C:\\KeralaFloods\\floods.txt";
      String foldername="summa.txt";
      AmazonS3 s3 = AmazonS3Client.builder().withRegion(Regions.US_EAST_1).withCredentials(new AWSStaticCredentialsProvider(creds)).build();
      PutObjectResult res=s3.putObject(new PutObjectRequest(bucketName, foldername, new File(path)));
        System.out.println(res.toString());
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

}
