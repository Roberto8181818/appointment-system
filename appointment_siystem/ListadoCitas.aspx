<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ListadoCitas.aspx.cs" Inherits="appointment_siystem.ListadoCitas" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Listado De Citas</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
    <form id="form1" runat="server" class="container mt-4">
        <h1 class="text-center mb-4">Listado de Citas</h1>

        <div class="mb-3">
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/AgendarCitas.aspx" CssClass="btn btn-success me-2">Agendar cita</asp:HyperLink>
            <asp:Button ID="btnRefresh" runat="server" Text="Recargar" OnClick="btnRefresh_Click" CssClass="btn btn-secondary" />
            <asp:Label ID="lblMensaje" runat="server" ForeColor="Red" CssClass="form-text text-danger" Font-Size="Large"></asp:Label>
        </div>

        <asp:GridView ID="gvCitas" runat="server" AutoGenerateColumns="False"
            OnRowDataBound="gvCitas_RowDataBound"
            OnRowCommand="gvCitas_RowCommand"
            CssClass="table table-striped table-bordered">
            <Columns>
                <asp:BoundField DataField="Paciente" HeaderText="Paciente" />
                <asp:BoundField DataField="Doctor" HeaderText="Doctor" />
                <asp:BoundField DataField="FechaHora" HeaderText="Fecha y hora" />
                <asp:BoundField DataField="Estado" HeaderText="Estado" />
                <asp:TemplateField HeaderText="Acciones">
                    <ItemTemplate>
                        <asp:LinkButton ID="btnCancelar" runat="server" CommandArgument='<%# Eval("Id") %>' CommandName="Cancelar"
                            Text="Cancelar" CssClass="btn btn-danger btn-sm"
                            OnClientClick="return confirm('¿Estás seguro que deseas cancelar esta cita?')" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </form>
</body>
</html>
