<%-- 
    Document   : productos
    Created on : 2 nov. 2022, 19:19:33
    Author     : Raul Ortega
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
        <title>Productos</title>
    </head>
    <body>  
        <%!
            Connection con;
            ResultSet resultset;

            public void jspInit() {
                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    con = DriverManager.getConnection("jdbc:mysql://localhost/WebProducts", "root", "Admin$123");
                    Statement statement = con.createStatement();
                    resultset = statement.executeQuery("select * from Products");
                } catch (Exception ex) {
                    ex.printStackTrace();
                }
            }

            public void jspDestroy() {
                try {
                    con.close();
                    resultset.close();
                } catch (Exception ex) {
                    ex.printStackTrace();
                }
            }
        %>       
        <div class="bg-image" style="background-image: url('https://images3.alphacoders.com/111/1117146.png'); height: 100vh"> 
            <nav class="navbar navbar-dark navbar-expand-lg bg-dark">
                <div class="container-fluid">
                    <a class="navbar-brand" >Productos.com</a>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>                
                </div>
            </nav>       

            <div class="container" style="margin-top:2%"> 
                <table class="table table-hover table-dark">
                    <thead>
                        <tr>
                            <th scope="col">Id</th>
                            <th scope="col">Nombre</th>
                            <th scope="col">Categoria</th>
                            <th scope="col">Precio</th>
                            <th scope="col">Fecha</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% while (resultset.next()) {%>
                        <tr>
                            <th scope="row"> <%=resultset.getInt("Id")%> </th>
                            <td><%=resultset.getString("Nombre")%></td>
                            <td><%=resultset.getString("Categoria")%></td>
                            <td><%=resultset.getInt("Precio")%></td>                        
                            <td><%=resultset.getString("Fecha")%></td>                                            
                        </tr>                    
                        <%}%>
                    </tbody>
                </table>   
            </div>
        </div>

    </body>
</html>
