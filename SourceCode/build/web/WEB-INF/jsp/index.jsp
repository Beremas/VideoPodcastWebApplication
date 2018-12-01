
<%-- 
    Document   : index
    Created on : 27-ott-2018, 17.29.35
    Author     : Marco C.
--%>
<!DOCTYPE html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title># - Home</title>
        <style><%@include file="/WEB-INF/css/index.css"%></style>
    </head>

    <body>
        <div class="container">        
                <div class="card border-0">
                    <!--logo #-->
                    <picture>
                        <a href="#" target="_blank">
                            <img src="#" class="roundeds" alt="logo">
                        </a>
                    </picture>
                    
                    <!--Link box and submit button -->
                    <form action="podcastServlet" method="POST">
                        XML RSS link <input type="text" name="link" id="ip4" placeholder="Paste here the XML/RSS source link" required/>       
                            <button input="submit" class="button">Submit</button>            
                    </form>
                </div>     
       </div>
        
     <!-- Script box-->
     <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.2/css/all.css" integrity="sha384-/rXc/GQVaYpyDdyxK+ecHPVYJSN9bmVFBvjA/9eOB+pb3F2w2N6fc5qB9Ew5yIns" crossorigin="anonymous">
     <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
     <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
     <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
     <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
    </body>
</html>
