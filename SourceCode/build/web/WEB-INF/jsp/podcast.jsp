<%-- 
    Document   : podcast
    Created on : 27-ott-2018, 17.29.35
    Author     : Marco C.
--%>

<%@page import="java.util.LinkedList"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <style><%@include file="/WEB-INF/css/podcast.css"%></style>
        <title># - Podcast Page</title>   
        
        <!-- script box - need to lead the environment (area white box, the css, bootstrap before the other things-->
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.2/css/all.css" integrity="sha384-/rXc/GQVaYpyDdyxK+ecHPVYJSN9bmVFBvjA/9eOB+pb3F2w2N6fc5qB9Ew5yIns" crossorigin="anonymous">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
    </head>
    
    <!-- retriving data from session variable by podcastServlet  -->
    <%
           // retrieve your list from the request, with casting 
           List<String> ListOfVideo = (LinkedList<String>)session.getAttribute("video");
           List<String> ListOfVideoDescription = (LinkedList<String>)session.getAttribute("VideoDescription");
           List<String> ListOfVideoTitle = (LinkedList<String>)session.getAttribute("VideoTitle");
           String PodcastDescription = (String)session.getAttribute("PodcastDescription");
           String PodcastTitle = (String)session.getAttribute("PodcastTitle");
           String PodcastPubDate = (String)session.getAttribute("PodcastPubDate");
           
           Integer indexVideoStarting = (Integer)session.getAttribute("indexVideoStarting");
           
    %>
        
    <body> 
        <div class ="container">
            
            <!--podcast title-->
            <div class="card w-25">
                <div class="card-body">
                    <p><h5 align="center">Podcast title:</h5> <%=PodcastTitle%></p>
                </div>
            </div>
            
            <!--podcast description-->
            <div class="card" >
                <div class="card-body">
                    <p><h5 align="center">Podcast description</h5><%=PodcastDescription%></p>
                </div>
            </div>
                      
            <!--menu SX -->         
            <div id="left_part">                           
                    <div class="card" >
                    <nav>
                    <ul>                        
                    <!--list of video titles-->
                    <% for(int i = 0; i < ListOfVideoTitle.size(); i+=1) { %>
                           <div class="card-body">
                                <a onclick="loadVideo()" href="podcastServlet?param=<%=i%>">
                                    Clip <%=i+1%> - Title: "<%=ListOfVideoTitle.get(i)%>" - 
                                    PubDate: "<%=PodcastPubDate%>"                                  
                                </a>
                            </div>
                    <% } %>
                    </ul>
                    </nav>
                    </div> 
            </div>
                     
    
            <!--Video DX-->
            <div id="right_part">
                <div  class="embed-responsive embed-responsive-16by9" style="height:222px;">
                    <iframe class="embed-responsive-item" src="<%=ListOfVideo.get(indexVideoStarting)%>" allowfullscreen>
                    </iframe>
                </div>
                
            </div>
            
            <!--Video Description -->
            <div class="card">
                <div class="card-body"> 
                    <!-- this indexVideoStarting +1 is totally for a client view. To avoid the 0 java List indexing -->
                    <h5 align="center">Clip <%=indexVideoStarting+1%> - Video description</h5>
                    <%=ListOfVideoDescription.get(indexVideoStarting)%>
                </div>
            </div>

        </div>
    </body>
</html>
