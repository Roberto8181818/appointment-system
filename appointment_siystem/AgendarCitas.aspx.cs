using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace appointment_siystem
{
    public partial class AgendarCitas : System.Web.UI.Page
    {
        private void CargarHoras(DropDownList ddl)
        {
            ddl.Items.Clear();

            int intervalo = 17;

            for (int h = 6; h < 19; h++)
            {
                for (int m = 0; m < 60; m += intervalo)
                {
                    string hora = $"{h:D2}:{m:D2}";
                    ddl.Items.Add(new ListItem(hora, hora));
                }
            }

            ddl.Items.Insert(0, new ListItem("Selecciona la hora", ""));
        }
        private void CargarDoctorDropDownList()
        {
            using (var db = new ClinicaDBEntities())
            {
                var doctores = db.Doctor
                    .Select(c => new
                    {
                        Id = c.Id,
                        nombreCompleto = c.Nombre + " " + c.Apellido
                    }).ToList();

                ddlDoctor.DataSource = doctores;
                ddlDoctor.DataTextField = "nombreCompleto";
                ddlDoctor.DataValueField = "Id";
                ddlDoctor.DataBind();
                ddlDoctor.Items.Insert(0, new ListItem("Selecciona un doctor", ""));
            }
        }
        private void CargarPacienteDropDownList()
        {
            using (var db = new ClinicaDBEntities())
            {
                var pacientes = db.Paciente
                    .Select(c => new
                    {
                        Id = c.Id,
                        nombreCompleto = c.Nombre + " " + c.Apellido
                    }).ToList();

                ddlPaciente.DataSource = pacientes;
                ddlPaciente.DataTextField = "nombreCompleto";
                ddlPaciente.DataValueField = "Id";
                ddlPaciente.DataBind();
                ddlPaciente.Items.Insert(0, new ListItem("Selecciona un paciente", ""));
            }
        }
        private void CargarDropDownLists()
        {
            CargarDoctorDropDownList();
            CargarPacienteDropDownList();
            CargarHoras(ddlHora);
        }
        protected void btnGuardarCita_Click(object sender, EventArgs e)
        {
            lblError.Text = "";

            if (string.IsNullOrWhiteSpace(ddlDoctor.SelectedValue) ||
                string.IsNullOrWhiteSpace(ddlPaciente.SelectedValue) ||
                string.IsNullOrWhiteSpace(txtFecha.Text) ||
                string.IsNullOrWhiteSpace(ddlHora.SelectedValue))
            {
                lblError.Text = "Rellene los campos obligatorios.";
                return;
            }

            int idDoctor = int.Parse(ddlDoctor.SelectedValue);
            int idPaciente = int.Parse(ddlPaciente.SelectedValue);

            DateTime fechaHora;

            string fechaCompleta = txtFecha.Text + " " + ddlHora.SelectedValue;

            if (!DateTime.TryParse(fechaCompleta, out fechaHora))
            {
                lblError.Text = "La fecha u hora no es válida.";
                return;
            }

            if (fechaHora < DateTime.Now)
            {
                lblError.Text = "No puedes agendar citas en fechas pasadas.";
                return;
            }

            using (var db = new ClinicaDBEntities())
            {
                bool doctorOcupado = db.Cita.Any(c =>
                    c.IdDoctor == idDoctor &&
                    c.FechaHora == fechaHora &&
                    c.Estado == "Programada"
                );

                bool pacienteOcupado = db.Cita.Any(c =>
                    c.IdPaciente == idPaciente &&
                    c.FechaHora == fechaHora &&
                    c.Estado == "Programada"
                );
                
                if (pacienteOcupado)
                {
                    lblError.Text = "El paciente ya tiene una cita programada en esa fecha y hora.";
                    return;
                }
                
                if (doctorOcupado)
                {
                    lblError.Text = "El doctor ya tiene una cita programada en esa fecha y hora.";
                    return;
                }

                var cita = new Cita
                {
                    IdDoctor = idDoctor,
                    IdPaciente = idPaciente,
                    FechaHora = fechaHora,
                    Motivo = txtMotivo.Text,
                    Estado = "Programada"
                };

                if (Page.IsValid)
                {
                    db.Cita.Add(cita);
                    db.SaveChanges();
                    Response.Redirect("ListadoCitas.aspx");
                }
                else
                {
                    lblError.Text = "Hay errores en el formulario.";
                }
            }

        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarDropDownLists();
            }
        }
    }
}