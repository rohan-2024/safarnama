<div class="content">
    <%
        String message=(String)session.getAttribute("message");
        if(message!=null){
    %>
    <h1><%= message %></h1>
    <%
        session.removeAttribute("message");
        }
    %>
</div>