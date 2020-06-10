<%-- 
    Documento   : index
    Data : 09 de junho, 2020
    Leonardo Viana
    Curso de DevOps | It Happens
--%>


<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Date"%>
<%@page import="java.net.*"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Desafio | Docker | HAproxy</title>
    </head>
    <body>
        <h1> Prática com docker, tomcat e haproxy | Curso de DevOps - It Happens </h1>
<FONT size = 5 COLOR="#0000FF">
        Container ID / IP : <%=InetAddress.getLocalHost()%> <br/><br/>
        </FONT>
       
        <hr/>

        <FONT size = 5 COLOR="#CC0000">
         <br/>
        ID da Sessão : <%=request.getSession().getId()%> <br/>
        É uma nova sessão : <%=request.getSession().isNew()%><br/>
        Data de criação da sessão : <%=new Date(request.getSession().getCreationTime())%><br/>
        Data de acesso à sessão : <%=new Date(request.getSession().getLastAccessedTime())%><br/><br/>
        </FONT>
        <b>Minha lista </b><br/>
        <hr/>
        
        
        <ul>
        <%
                String bookName = request.getParameter("bookName");
                List<String> listOfBooks = (List<String>) request.getSession().getAttribute("Books");
                if (listOfBooks == null) {
                    listOfBooks = new ArrayList<String>();
                    request.getSession().setAttribute("Books", listOfBooks);
                }
                if (bookName != null) {
                    listOfBooks.add(bookName);
 		    request.getSession().setAttribute("Books", listOfBooks);
                }
                for (String book : listOfBooks) {
                    out.println("<li>"+book + "</li><br/>");
                }
            
        %>
        </ul>
        <hr/>
        <form action="index.jsp" method="post">
            Item <input type="text" name="bookName" />

            <input type="submit" value="Adicionar item"/>
        </form>
        <hr/>
    </body>
</html>
