package Servlet;


import ParserXMLRSS.RSSFeedParser;
import ParserXMLRSS.Feed;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.MalformedURLException;
import java.util.LinkedList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author User
 */
public class podcastServlet extends HttpServlet {

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
            out.println("<title>Servlet podcastServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet podcastServlet at " + request.getContextPath() + "</h1>");
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
        
        String whatIsThis = (String)request.getParameter("param");
        
        if (whatIsThis.equals("loadIndex")){  // here is the call to index home page.              
                response.sendRedirect("index.htm");
        }else{  // here the param is the number index video 
                int atThisPointTheParamisTheIndexVideo = Integer.parseInt(whatIsThis);
                HttpSession session = request.getSession(true);        
                session.setAttribute("indexVideoStarting",atThisPointTheParamisTheIndexVideo);            
                response.sendRedirect("podcast.htm");  
        }
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
        //processRequest(request, response);
        
        HttpSession session = request.getSession(true); 
        try{
                
        String linkToParse = (String)request.getParameter("link");
        
        List<String> LLvideo = new LinkedList<>();
        List<String> LLdescription = new LinkedList<>();
        List<String> LLTitle = new LinkedList<>();
        String PodcastDescription,PodcastTitle,PodcastPubDate;
        Integer indexVideoStarting = 0;
        
        RSSFeedParser parser = new RSSFeedParser(linkToParse);        
        Feed feed = parser.readFeed();        
        
        PodcastDescription = feed.getDescription();
        PodcastTitle = feed.getTitle();
        PodcastPubDate = feed.getPubDate();
        
        
        
        feed.getMessages().forEach((message) -> {
            LLvideo.add(message.getLink());
            LLdescription.add(message.getDescription());
            LLTitle.add(message.getTitle());            
        });
        
        
        session.setAttribute("video",LLvideo);  
        session.setAttribute("VideoDescription",LLdescription);
        session.setAttribute("VideoTitle",LLTitle);  
        session.setAttribute("PodcastDescription",PodcastDescription);
        session.setAttribute("PodcastPubDate",PodcastPubDate);  
        session.setAttribute("PodcastTitle",PodcastTitle); 
        
            session.setAttribute("indexVideoStarting",indexVideoStarting); 
        
        response.sendRedirect("podcast.htm");        
        //request.getRequestDispatcher("podcast.htm").forward(request, response);
        }
        catch(MalformedURLException npe){
            session.setAttribute("errorMessage","Message from the Server: "+npe); 
            response.sendRedirect("error.htm"); 
        } 
        catch(RuntimeException | IOException re){
            session.setAttribute("errorMessage","Message from the Server: "+re); 
            response.sendRedirect("error.htm"); 
        }
        
       
         
       

        
     

      
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
