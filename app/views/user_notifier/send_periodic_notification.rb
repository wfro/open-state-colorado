<!DOCTYPE html>
<html>
  <head>
    <meta content='text/html; charset=UTF-8' http-equiv='Content-Type' />
  </head>
  <body>
    <% @user.legislators.each do |legislator| %>
      <h3><%= legislator.full_name %></h3>
      <p><%= legislator.email %></p>
      <p><%= link_to "Official website", legislator.url %></p>
    <% end %>
  </body>
</html>