<%@ Page Language="C#" %>
<script runat="server">
	public void Page_Load(object sender, EventArgs e)
	{
		Session.Abandon();
		Response.Redirect("Login.aspx");
	}
</script>
<html>
<head>
    <title>ThaiCreate.Com Tutorial</title>
</head>
<body>
    <form id="form1" runat="server">
        
    </form>
</body>
</html>