<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AgendarCitas.aspx.cs" Inherits="appointment_siystem.AgendarCitas" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Agendar Cita</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
    <form id="form1" runat="server" class="container mt-4">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

        <h1 class="text-center mb-4">Agendar cita médica</h1>

        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/ListadoCitas.aspx" CssClass="btn btn-link mb-3">Lista de citas</asp:HyperLink>

        <div class="mb-3">
            <asp:Label ID="lblDoctor" runat="server" Text="Doctor" CssClass="form-label"></asp:Label>
            <asp:DropDownList ID="ddlDoctor" runat="server" CssClass="form-select"></asp:DropDownList>
            <asp:RequiredFieldValidator ID="rfvDoctor" runat="server" ControlToValidate="ddlDoctor" InitialValue="" Text="Seleccione un doctor" ForeColor="red" CssClass="form-text text-danger" />
        </div>

        <div class="mb-3">
            <asp:Label ID="lblPaciente" runat="server" Text="Paciente" CssClass="form-label"></asp:Label>
            <asp:DropDownList ID="ddlPaciente" runat="server" CssClass="form-select"></asp:DropDownList>
            <asp:RequiredFieldValidator ID="rfvPaciente" runat="server" ControlToValidate="ddlPaciente" InitialValue="" Text="Seleccione un paciente" ForeColor="red" CssClass="form-text text-danger" />
        </div>

        <div class="mb-3">
            <asp:Label ID="lblFecha" runat="server" Text="Fecha" CssClass="form-label"></asp:Label>
            <asp:TextBox ID="txtFecha" runat="server" CssClass="form-control" />
            <ajaxToolkit:CalendarExtender ID="calFecha" runat="server" TargetControlID="txtFecha" Format="yyyy-MM-dd" />
            <asp:RequiredFieldValidator ID="rfvFecha" runat="server" ControlToValidate="txtFecha" Text="Seleccione una fecha" ForeColor="red" CssClass="form-text text-danger" />
            <asp:CompareValidator ID="cvFecha" runat="server" ControlToValidate="txtFecha" Operator="DataTypeCheck" Type="Date" ErrorMessage="La fecha no es válida." ForeColor="Red" CssClass="form-text text-danger" />
        </div>

        <div class="mb-3">
            <asp:Label ID="lblHora" runat="server" Text="Hora" CssClass="form-label"></asp:Label>
            <asp:DropDownList ID="ddlHora" runat="server" CssClass="form-select"></asp:DropDownList>
            <asp:RequiredFieldValidator ID="rfvHora" runat="server" ControlToValidate="ddlHora" InitialValue="" Text="Seleccione una hora" ForeColor="red" CssClass="form-text text-danger" />
        </div>

        <div class="mb-3">
            <asp:Label ID="lblMotivo" runat="server" Text="Motivo" CssClass="form-label"></asp:Label>
            <asp:TextBox ID="txtMotivo" runat="server" CssClass="form-control" />
            <asp:RegularExpressionValidator ID="revMotivo" runat="server" ControlToValidate="txtMotivo"
                ValidationExpression="^([a-zA-Z0-9áéíóúÁÉÍÓÚüÜñÑ.,;:()\- ]{5,200})?$"
                ErrorMessage="El motivo debe tener entre 5 y 200 caracteres y solo contener letras, números y algunos signos de puntuación."
                ForeColor="Red" CssClass="form-text text-danger" Display="Dynamic" />
        </div>

        <div class="mb-3">
            <asp:Button ID="btnGuardarCita" runat="server" OnClick="btnGuardarCita_Click" Text="Guardar Cita" CausesValidation="true" CssClass="btn btn-primary" />
        </div>

        <asp:Label ID="lblError" runat="server" ForeColor="Red" CssClass="form-text text-danger" Font-Size="Large"></asp:Label>
    </form>
</body>
</html>
