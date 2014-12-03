<%@ Import Namespace="System.Data"%>
<%@ Import Namespace="System.Data.OleDb"%>
<%@ Page Language="C#" %>
<script runat="server">
	OleDbConnection objConn = new OleDbConnection();
	OleDbCommand objCmd = new OleDbCommand();
	string strConnString;
	string strSQL;

	public void btnLogin_Click(object sender, EventArgs e)
	{

		strConnString = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("database/mydatabase.mdb") + ";Jet OLEDB:Database Password=;";
		objConn.ConnectionString = strConnString;
		objConn.Open();

		int intNumRows = 0;
		strSQL = "SELECT COUNT(*) FROM member WHERE Username = '" + this.txtUsername.Text + "' AND [Password] = '" + this.txtPassword.Text + "' ";
		objCmd = new OleDbCommand(strSQL, objConn);
		intNumRows = Convert.ToInt32(objCmd.ExecuteScalar());

		if (intNumRows > 0) {
			Session["strUser"] = this.txtUsername.Text;
			Response.Redirect("Page1.aspx");
		} else {
			this.pnlLogin.Visible = false;
			this.lblStatus.Visible = true;
			this.lblStatus.Text = "Username/Password is wrong.";
		}

		objConn.Close();
		objConn = null;

	}
</script>
<html>
<head>
    <title>ThaiCreate.Com Tutorial</title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:Panel id="pnlLogin" runat="server">
			<asp:Label id="lblLogin" Text="Login." runat="server" />
			<br />
			<br />
				<table border="1" style="width: 300px">
                <tbody>
                    <tr>
                        <td>
                            &nbsp;<asp:Label id="lblUsername" runat="server" text="Username"></asp:Label></td>
                        <td>
                            &nbsp;<asp:TextBox id="txtUsername" runat="server" Width="120px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="ChkUsername" runat="server" 
                                ControlToValidate="txtUsername" ErrorMessage="* Username"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;<asp:Label id="lblPassword" runat="server" text="Password"></asp:Label></td>
                        <td>
                            &nbsp;<asp:TextBox id="txtPassword" runat="server" Width="120px" 
                                TextMode="Password"></asp:TextBox>
                        </td>
                    </tr>               
                </tbody>
            </table>
            <br />
            <asp:Button id="btnLogin" onclick="btnLogin_Click" runat="server" Text="Login"></asp:Button>
            <br />
        </asp:Panel>
        <asp:Label id="lblStatus" runat="server" visible="False"></asp:Label>
    </form>
</body>
</html>