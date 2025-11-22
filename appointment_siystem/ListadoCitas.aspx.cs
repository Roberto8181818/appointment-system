using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace appointment_siystem
{
    public partial class ListadoCitas : System.Web.UI.Page
    {
        private void CargarCitas()
        {
            using (var db = new ClinicaDBEntities())
            {
                var citas = db.Cita
                    .Select(c => new
                    {
                        c.Id,
                        Paciente = c.Paciente.Nombre + " " + c.Paciente.Apellido,
                        Doctor = c.Doctor.Nombre + " " + c.Doctor.Apellido,
                        c.FechaHora,
                        c.Estado
                    })
                    .OrderBy(c => c.FechaHora)
                    .ToList();

                gvCitas.DataSource = citas;
                gvCitas.DataBind();
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarCitas();
            }
        }

        protected void CancelarCita(int id)
        {
            using (ClinicaDBEntities db = new ClinicaDBEntities())
            {
                var cita = db.Cita.FirstOrDefault(c => c.Id == id);
                if (cita == null)
                {
                    lblMensaje.Text = "La cita no existe.";
                    return;
                }
                if (cita.Estado != "Programada")
                {
                    lblMensaje.Text = "Solo se pueden cancelar citas programadas.";
                    return;
                }
                if ((cita.FechaHora - DateTime.Now).TotalHours < 24)
                {
                    lblMensaje.Text = "Solo puedes cancelar citas con 24 horas de antelación.";
                    return;
                }
                cita.Estado = "Cancelada";
                db.SaveChanges();
            }
            CargarCitas();
            lblMensaje.Text = "La cita fue cancelada correctamente.";
            Response.Redirect(Request.RawUrl, false);
        }
        protected void gvCitas_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Cancelar")
            {
                int idCita = Convert.ToInt32(e.CommandArgument);
                CancelarCita(idCita);
            }
        }
        protected void gvCitas_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                dynamic fila = e.Row.DataItem;

                string estado = fila.Estado;

                LinkButton btnCancelar = (LinkButton)e.Row.FindControl("btnCancelar");

                btnCancelar.Visible = (estado == "Programada");
            }
        }
        protected void btnRefresh_Click(object sender, EventArgs e)
        {
            CargarCitas();
            lblMensaje.Text = "Citas cargadas";
        }
    }
}