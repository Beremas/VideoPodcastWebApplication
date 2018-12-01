<%-- 
    Document   : error
    Created on : 1-nov-2018, 18.41.47
    Author     : Marco C
--%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title># - Error page</title>
        
        <style><%@include file="/WEB-INF/css/error.css"%></style>
    </head>
    
    <!-- retriving the error message from the servlet session variable -->
    <%    String errorMessage = (String)session.getAttribute("errorMessage");  %>
    
    <body>
            <h1 align="center">:( Oops something went wrong!</h1>
            
            <br>
            
            <div id="placeHereErrorMessage" align="center">
                <h1><%=errorMessage%></h1>
                <!--Link box and submit button -->
                <a onclick="" href="podcastServlet?param=loadIndex">Go back and try again</a>
            </div>
    </body>
</html>
