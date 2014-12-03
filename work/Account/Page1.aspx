<%@ Page Language="C#" %>
<script runat="server">

	public void Page_Load(object sender, EventArgs e)
	{
		if (Session["strUser"]==null) {
			Response.Redirect("Login.aspx");
			Response.End();
		} else {
			this.lblStatus.Text = "Welcome [" + Session["strUser"] + "]";
		}
	}

</script>
<html>
<head>
    <title>ThaiCreate.Com Tutorial</title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:Label id="lblStatus" runat="server"></asp:Label>
		<br />
		<br />
		<asp:HyperLink id="hplLogout" NavigateURL="Logout.aspx" Text="Logout" runat="server"></asp:HyperLink>
    </form>
</body>
</html>