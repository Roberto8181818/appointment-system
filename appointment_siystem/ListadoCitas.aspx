<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ListadoCitas.aspx.cs" Inherits="appointment_siystem.ListadoCitas" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <h1 style="text-align: center; margin-top: 20px;">Listado de Citas
        </h1>

        <asp:Button ID="btnRefresh" runat="server" Text="Recargar" OnClick="btnRefresh_Click" />
        <br />
        <asp:GridView ID="gvCitas" runat="server" AutoGenerateColumns="False" OnRowDataBound="gvCitas_RowDataBound" OnRowCommand="gvCitas_RowCommand">
            <Columns>
                <asp:BoundField DataField="Paciente" HeaderText="Paciente" />
                <asp:BoundField DataField="Doctor" HeaderText="Doctor" />
                <asp:BoundField DataField="FechaHora" HeaderText="Fecha" />
                <asp:BoundField DataField="Estado" HeaderText="Estado" />
                <asp:TemplateField HeaderText="Acciones">
                    <ItemTemplate>
                        <asp:LinkButton ID="btnCancelar" runat="server" CommandArgument='<%# Eval("Id") %>' CommandName="Cancelar" Text="Cancelar" OnClientClick="return confirm('¿Estás seguro que deseas cancelar esta cita?')" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>


        <asp:Label ID="lblMensaje" runat="server" ForeColor="Red" />
    </form>
</body>
</html>
