<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="IBM31Jan24ASPNETIntro.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:IBM25Jan24DbConnectionString %>" SelectCommand="SELECT * FROM [EmployeeDept] WHERE ([DeptName] LIKE '%' + @DeptName + '%')" DeleteCommand="DELETE FROM [EmployeeDept] WHERE [EmployeeID] = @EmployeeID" InsertCommand="INSERT INTO [EmployeeDept] ([EmpName], [Salary], [DeptName]) VALUES (@EmpName, @Salary, @DeptName)" UpdateCommand="UPDATE [EmployeeDept] SET [EmpName] = @EmpName, [Salary] = @Salary, [DeptName] = @DeptName WHERE [EmployeeID] = @EmployeeID">
                <DeleteParameters>
                    <asp:Parameter Name="EmployeeID" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="EmpName" Type="String" />
                    <asp:Parameter Name="Salary" Type="Decimal" />
                    <asp:Parameter Name="DeptName" Type="String" />
                </InsertParameters>
                <SelectParameters>
                    <asp:ControlParameter ControlID="DropDownList1" Name="DeptName" PropertyName="SelectedValue" Type="String" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="EmpName" Type="String" />
                    <asp:Parameter Name="Salary" Type="Decimal" />
                    <asp:Parameter Name="DeptName" Type="String" />
                    <asp:Parameter Name="EmployeeID" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <asp:Calendar ID="Calendar1" runat="server"></asp:Calendar>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:IBM25Jan24DbConnectionString %>" SelectCommand="SELECT DISTINCT [DeptName] FROM [EmployeeDept]"></asp:SqlDataSource>
            <input id="Text1" type="text" runat="server" />

            <asp:Label ID="lblMsg" runat="server" Text="Hello World!!!"></asp:Label>
            <br />
            <br />
            <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="DeptName" DataValueField="DeptName">
            </asp:DropDownList>
            <br />
            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="EmployeeID" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="EmployeeID" HeaderText="EmployeeID" InsertVisible="False" ReadOnly="True" SortExpression="EmployeeID" />
                    <asp:BoundField DataField="EmpName" HeaderText="EmpName" SortExpression="EmpName" />
                    <asp:BoundField DataField="Salary" HeaderText="Salary" SortExpression="Salary" />
                    <asp:BoundField DataField="DeptName" HeaderText="DeptName" SortExpression="DeptName" />
                    <asp:CommandField ButtonType="Button" ShowDeleteButton="True" ShowEditButton="True" />
                </Columns>
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
            <br />
            <asp:FormView ID="FormView1" runat="server" CellPadding="4" DataKeyNames="EmployeeID" DataSourceID="SqlDataSource1" ForeColor="#333333">
                <EditItemTemplate>
                    EmployeeID:
                    <asp:Label ID="EmployeeIDLabel1" runat="server" Text='<%# Eval("EmployeeID") %>' />
                    <br />
                    EmpName:
                    <asp:TextBox ID="EmpNameTextBox" runat="server" Text='<%# Bind("EmpName") %>' />
                    <br />
                    Salary:
                    <asp:TextBox ID="SalaryTextBox" runat="server" Text='<%# Bind("Salary") %>' />
                    <br />
                    DeptName:
                    <asp:TextBox ID="DeptNameTextBox" runat="server" Text='<%# Bind("DeptName") %>' />
                    <br />
                    <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                    &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                </EditItemTemplate>
                <EditRowStyle BackColor="#999999" />
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <InsertItemTemplate>
                    EmpName:
                    <asp:TextBox ID="EmpNameTextBox" runat="server" Text='<%# Bind("EmpName") %>' />
                    <br />
                    Salary:
                    <asp:TextBox ID="SalaryTextBox" runat="server" Text='<%# Bind("Salary") %>' />
                    <br />
                    DeptName:
                    <asp:TextBox ID="DeptNameTextBox" runat="server" Text='<%# Bind("DeptName") %>' />
                    <br />
                    <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                    &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                </InsertItemTemplate>
                <ItemTemplate>
                    EmployeeID:
                    <asp:Label ID="EmployeeIDLabel" runat="server" Text='<%# Eval("EmployeeID") %>' />
                    <br />
                    EmpName:
                    <asp:Label ID="EmpNameLabel" runat="server" Text='<%# Bind("EmpName") %>' />
                    <br />
                    Salary:
                    <asp:Label ID="SalaryLabel" runat="server" Text='<%# Bind("Salary") %>' />
                    <br />
                    DeptName:
                    <asp:Label ID="DeptNameLabel" runat="server" Text='<%# Bind("DeptName") %>' />
                    <br />
                    <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" />
                    &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" />
                    &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" />
                </ItemTemplate>
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            </asp:FormView>
            <asp:TextBox ID="txtName" runat="server" Height="39px" Width="323px"></asp:TextBox>
            <asp:Button ID="btnSubmit" runat="server" Text="Submit" 
                OnClick="btnSubmit_Click" Height="42px" Width="125px" />
        </div>
    </form>
</body>
</html>
