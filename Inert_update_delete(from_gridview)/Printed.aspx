<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Printed.aspx.cs" Inherits="Inert_update_delete_from_gridview_.Printed" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="Ajax" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 626px;
        }
        .auto-style2 {
            width: 116px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>

            <asp:ScriptManager ID="ram" runat="server"></asp:ScriptManager>

            <h1 style="border-block-end-style: dotted; text-align: center;color:burlywood;border:double;background-color:black">! GridView – Insert, Update & Delete Operations !</h1>
            <table border="3px" style="text-align:inherit;background-color:lightcoral">
                <tr>
                    <td style="text-align:center;font-weight:bold;" class="auto-style2">Name:                           </td>
                    <td class="auto-style1">
                        <asp:TextBox ID="tbname" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td style="text-align: center;font-weight:bold" class="auto-style2">Age:</td>
                    <td class="auto-style1">
                        <asp:TextBox ID="tbage" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td style="text-align: center;font-weight:bolder" class="auto-style2">City:</td>
                  
                    <td class="auto-style1">
                        <asp:TextBox ID="tbcity" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td style="text-align: center;font-weight:bold" class="auto-style2">Dob:</td>
                    <td class="auto-style1">
                        <asp:TextBox ID="tbdob" runat="server"></asp:TextBox>
                        <Ajax:CalendarExtender ID="caldob" runat="server" PopupButtonID="tbdob" PopupPosition="Topright" TargetControlID="tbdob" />
                    </td>
                </tr>
                <tr>
                    <td style="text-align: center;font-weight:bold" class="auto-style2">Image:</td>
                    <td class="auto-style1">
                        <asp:FileUpload ID="fuimage" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2"></td>
                    <td class="auto-style1">
                        <asp:Button ID="btnsave" runat="server" Text="Save" OnClick="btnsave_Click" />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2"></td>
                    <td class="auto-style1">
                        <asp:GridView ID="tbgved" runat="server" OnRowCommand="tbgved_RowCommand" ShowFooter="True" OnRowEditing="tbgved_RowEditing" OnRowUpdating="tbgved_RowUpdating" DataKeyNames="id" OnRowCancelingEdit="tbgved_RowCancelingEdit" OnRowDeleting="tbgved_RowDeleting" AutoGenerateColumns="False" CellPadding="4" Width="1182px" HeaderStyle-HorizontalAlign="Center"
                            RowStyle-HorizontalAlign="Center" ForeColor="#333333" GridLines="None">
                            <AlternatingRowStyle BackColor="White" />
                            <Columns>
                                <asp:TemplateField HeaderText="Id:">
                                    <ItemTemplate>
                                        <%#Eval("id") %>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Name:">
                                    <ItemTemplate>
                                        <%#Eval("name") %>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="tbname10" runat="server" Text='<%#Eval("name") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <FooterTemplate>
                                        <asp:TextBox ID="tbname20" runat="server"></asp:TextBox>
                                    </FooterTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Age:">
                                    <ItemTemplate>
                                        <%#Eval("age") %>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="tbage10" runat="server" Text='<%#Eval("age") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <FooterTemplate>
                                        <asp:TextBox ID="tbage20" runat="server"></asp:TextBox>
                                    </FooterTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="City:">
                                    <ItemTemplate>
                                        <%#Eval("city") %>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="tbcity10" runat="server" Text='<%#Eval("city") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <FooterTemplate>
                                        <asp:TextBox ID="tbcity20" runat="server"></asp:TextBox>
                                    </FooterTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Dob:">
                                    <ItemTemplate>
                                        <%#Eval("dob") %>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="tbdob10" runat="server" Text='<%#Eval("dob") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <FooterTemplate>
                                        <asp:TextBox ID="tbdob20" runat="server"></asp:TextBox>
                                        <Ajax:CalendarExtender ID="caldob" runat="server" PopupButtonID="tbdob20" PopupPosition="TopRight" TargetControlID="tbdob20" />
                                    </FooterTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Photo:">
                                    <ItemTemplate>
                                        <asp:Image ID="img" runat="server" Width="50px" Height="70px" ImageUrl='<%#Eval("Image","~/Img1/{0}") %>' />
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:FileUpload ID="fuimage10" runat="server" />
                                    </EditItemTemplate>
                                    <FooterTemplate>
                                        <asp:FileUpload ID="fuimage20" runat="server" />
                                    </FooterTemplate>
                                </asp:TemplateField>


                                <asp:TemplateField>

                                    <ItemTemplate>
                                        <asp:Button ID="btndelete" runat="server" Text="Delete" CommandName="Delete" />
                                        <asp:Button ID="btnEdit" runat="server" Text="Edit" CommandName="Edit" />
                                    </ItemTemplate>

                                    <EditItemTemplate>
                                        <asp:Button ID="btnupdate" runat="server" Text="Update" CommandName="Update" />
                                        <asp:Button ID="btncancel" runat="server" Text="Cancle" CommandName="Cancel" />

                                    </EditItemTemplate>

                                    <FooterTemplate>
                                        <asp:Button ID="btnSave2" runat="server" Text="Insert" CommandName="A" />
                                    </FooterTemplate>
                                </asp:TemplateField>

                                <%-- </asp:TemplateField>--%>


                                <%--         <asp:CommandField ShowDeleteButton="true" />
                                <asp:CommandField ShowEditButton="true" />--%>
                            </Columns>
                            <FooterStyle BackColor="#990000" ForeColor="White" Font-Bold="True" />
                            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                            <PagerStyle ForeColor="#333333" HorizontalAlign="Center" BackColor="#FFCC66" />
                            <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                            <SortedAscendingCellStyle BackColor="#FDF5AC" />
                            <SortedAscendingHeaderStyle BackColor="#4D0000" />
                            <SortedDescendingCellStyle BackColor="#FCF6C0" />
                            <SortedDescendingHeaderStyle BackColor="#820000" />
                        </asp:GridView>
                    </td>
                </tr>
            </table>

        </div>
    </form>
</body>
</html>
