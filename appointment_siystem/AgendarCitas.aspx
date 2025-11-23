<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AgendarCitas.aspx.cs" Inherits="appointment_siystem.AgendarCitas" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

        <h1 style="text-align: center; margin-top: 20px;">Agendar cita médica
        </h1>

        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/ListadoCitas.aspx">Lista de citas</asp:HyperLink>
        <br />

        <br />

        <asp:Label ID="lblDoctor" runat="server" Text="Doctor"></asp:Label>
        <asp:DropDownList ID="ddlDoctor" runat="server">
        </asp:DropDownList>
        <asp:RequiredFieldValidator
            ID="rfvDoctor"
            runat="server"
            ControlToValidate="ddlDoctor"
            InitialValue=""
            Text="*"
            ForeColor="Red" />

        <br />
        <br />

        <asp:Label ID="lblPaciente" runat="server" Text="Paciente"></asp:Label>
        <asp:DropDownList ID="ddlPaciente" runat="server">
        </asp:DropDownList>
        <asp:RequiredFieldValidator
            ID="rfvPaciente"
            runat="server"
            ControlToValidate="ddlPaciente"
            InitialValue=""
            Text="*"
            ForeColor="Red" />

        <br />
        <br />

        <asp:Label ID="lblFecha" runat="server" Text="Fecha"></asp:Label>
        <asp:TextBox ID="txtFecha" runat="server" />
        <ajaxToolkit:CalendarExtender
            ID="calFecha"
            runat="server"
            TargetControlID="txtFecha"
            Format="yyyy-MM-dd" />
        <asp:RequiredFieldValidator
            ID="rfvFecha"
            runat="server"
            ControlToValidate="txtFecha"
            Text="*"
            ForeColor="Red" />
        <asp:CompareValidator
            ID="cvFecha"
            runat="server"
            ControlToValidate="txtFecha"
            Operator="DataTypeCheck"
            Type="Date"
            ErrorMessage="La fecha no es válida."
            ForeColor="Red" />

        <br />
        <br />

        <asp:Label ID="lblHora" runat="server" Text="Hora"></asp:Label>
        <asp:DropDownList ID="ddlHora" runat="server"></asp:DropDownList>
        <asp:RequiredFieldValidator
            ID="rfvHora"
            runat="server"
            ControlToValidate="ddlHora"
            InitialValue=""
            Text="*"
            ForeColor="Red" />

        <br />
        <br />

        <asp:TextBox ID="txtMotivo" runat="server" />

        <asp:RegularExpressionValidator
            ID="revMotivo"
            runat="server"
            ControlToValidate="txtMotivo"
            ValidationExpression="^([a-zA-Z0-9áéíóúÁÉÍÓÚüÜñÑ.,;:()\- ]{5,200})?$"
            ErrorMessage="El motivo debe tener entre 5 y 200 caracteres y solo contener letras, números y algunos signos de puntuación."
            ForeColor="Red"
            Display="Dynamic" />

        <br />
        <br />

        <asp:Button ID="btnGuardarCita" runat="server" OnClick="btnGuardarCita_Click" Text="Guardar Cita" CausesValidation="true"/>

        <br />
        <br />
        <asp:Label ID="lblError" runat="server" ForeColor="Red"></asp:Label>
    </form>
</body>
</html>
