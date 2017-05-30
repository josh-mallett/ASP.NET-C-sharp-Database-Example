<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SupplierInfo.aspx.cs" Inherits="SupplierInfo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>p5_jwm8483</title>
    <link rel="stylesheet" type="text/css" href="main.css" />
</head>
<body>
   <div class="db_form_display">

        <a href="CustomerInfo.aspx"><input type="button" id="CustomerButton" name="ShowCustomers" value="Customers"/></a>
        <a href="SupplierInfo.aspx"><input type="button" id="SupplierButton" name="ShowSuppliers" value="Suppliers"/></a>
        
  </div>
         <%
            List<string> SupplierInfo = null;
            NorthwindConnection conn = new NorthwindConnection();
            if (conn.MakeConnectionToDatabase())
            {
                SupplierInfo = conn.QueryTheDatabase("SELECT SupplierID, CompanyName, ContactName, Phone FROM Suppliers");
                conn.CloseTheConnectionToTheDatabase();
            }

            else {            
                %> Transaction Error!!!!<br /> <%
            }
         %>

    <div class="SupplierList" id="SupplierList">
        <ul>
            <%
                for (int i = 0; i < SupplierInfo.Count; i++)
                {
                    %>
                        <div class="info_panel">
                            <%= SupplierInfo[i] %>
                        </div>        
                    <%
                }
            %>
        </ul>
    </div>

</body>
</html>
