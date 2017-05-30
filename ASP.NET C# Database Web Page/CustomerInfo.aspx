<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CustomerInfo.aspx.cs" Inherits="CustomerInfo" %>

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
            List<string> CustomerInfo = null;
            NorthwindConnection ndc = new NorthwindConnection();
            if (ndc.MakeConnectionToDatabase())
            {
                CustomerInfo = ndc.QueryTheDatabase("SELECT CustomerID, CompanyName, ContactName, Phone FROM Customers");
                ndc.CloseTheConnectionToTheDatabase();
            }

            else {            
                %> Transaction Error!!!!<br /> <%
            }
         %>


    <div class="CustomerList" id="CustomerList">
        <ul>
            <%
                for (int i = 0; i < CustomerInfo.Count; i++)
                {
                    %>
                        <div class="info_panel">
                            <%= CustomerInfo[i] %>
                        </div>        
                    <%
                }
            %>
        </ul>
    </div>

</body>
</html>
