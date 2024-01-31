<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TaskMent.aspx.cs" Inherits="IBM31Jan24ASPNETIntro.TaskMent" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
       <Span>Enter value contains in Name</Span>
        <asp:TextBox ID="txtSearchName" runat="server" AutoPostBack="True" OnTextChanged="txtSearchName_TextChanged"></asp:TextBox>
       
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Add new Employee" />
       
        <asp:Panel ID="Panel1" runat="server" Visible="False">

            <asp:TextBox ID="txtEmpName" runat="server"></asp:TextBox>
            <asp:TextBox ID="txtEmpSalary" runat="server"></asp:TextBox>

            <asp:Button ID="Button2" runat="server" Text="Save Value" />

        </asp:Panel>
       
        
        
        <asp:GridView ID="GridView1" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" />
            <EditRowStyle BackColor="#2461BF" />
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#EFF3FB" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F5F7FB" />
            <SortedAscendingHeaderStyle BackColor="#6D95E1" />
            <SortedDescendingCellStyle BackColor="#E9EBEF" />
            <SortedDescendingHeaderStyle BackColor="#4870BE" />
        </asp:GridView>
    </form>
</body>
</html>
